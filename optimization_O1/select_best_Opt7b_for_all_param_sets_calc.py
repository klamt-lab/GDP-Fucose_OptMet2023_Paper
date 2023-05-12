#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Select the best optimization result (prediction) by
calculating the objective value (here: titer = conc.
of GDP-Fucose at 24h) for all combinations of 
all parameter sets p with all optimization results O.

Model: GDP-Fucose_v7XGSK_with_PE9XGSK_setup.cps

Approach: Load the list of parameter sets and load the list
of optimization results (= sets of optimal initial enzyme concentrations).
Both lists are of equal size (usually 100). Then, build a two level loop
to iterate over all possible combinations of i parameter sets p and
j optimization results O. Set the respective parameters and initial enzyme
concentrations in the model and run a simulation. Store the results in
a i x j matrix (rows: parameter sets, columns: optimization results). Then,
calculate different measures (median, minimum, sum) for each column
(= each optimization result) and combine them to calculate a score
for each column. The optimization result with the highest score is selected
for experimental testing.

Package: basiCO - simplified Copasi Python API
         <https://github.com/copasi/basico>"""

import os
from basico import *
import pandas as pd
from tqdm import tqdm
import pickle
import seaborn as sns

# INITIALIZATION
# load model (the model will only be used for time course simulations in this script,
# no further parameter estimations or other optimizations)
path = os.getcwd()
parent_dir_path = os.path.abspath(os.path.join(path, os.pardir))
model_path = parent_dir_path + '\\' + 'parameter_ensemble' + '\\' + 'GDP-Fucose_v7XGSK_with_PE9XGSK_setup.cps'
model = load_model(model_path)
# set initial substrate concentrations to FE18_07FKP since those were used for Opt7b
set_species('Fuc', initial_concentration=25.7)
set_species('ATP', initial_concentration=6)
set_species('GMP', initial_concentration=25.7)
# load the parameter ensemble data
# (the first column is all zeros, parameter columns start at .iloc[:,1])
param_sets = pd.read_csv(parent_dir_path + '\\' + 'parameter_ensemble' + '\\' + 'sampling_output_EvoStrat_100runs.csv')
# load the data of the repeated optimization
# object: list of list of pandas data frames; 
opt_result_sets = pd.read_pickle('GDP-Fucose_v7XGSK_PE9XGSK_Opt7b_RandParamSampl_EvoStrat100x_list_res_stats.pkl')

# CROSS-VALIDATION SIMULATION LOOP
# prepare list for overall loop result
all_titers = []
# loop over all i parameter sets and j optimization results
for index, param_set in tqdm(param_sets.iterrows()):
    # prepare list for inner loop results 
    # (sublists with titers for all different optimization results for one parameter set)
    titers_row = []
    for opt_result in opt_result_sets:
        # 1) override model kinetic parameters with current parameter set
        # current list of parameter values
        curr_param_set_vals = list(param_set)
        # current list of parameter names
        curr_param_set_names = list(param_set.keys())
        # list() to only get content (values or names) of pandas series param_set
        # .keys() to get names of values in pandas series param_set
        # trim both lists (get rid of first entries = name and last entries = obj_val of fit)
        curr_param_set_vals = curr_param_set_vals[1:-1]
        curr_param_set_names = curr_param_set_names[1:-1]
        # set model parameter values to current estimated parameters from rand sampling result
        for i in range(len(list(curr_param_set_vals))): 
            set_reaction_parameters(name = curr_param_set_names[i], value = curr_param_set_vals[i])
        # 2) override model initial enzyme concentrations with current optimization result
        curr_opt_set_conc = opt_result[0]['sol']    # pandas.series
        # first set_species needs to be called twice so that the species is actually set ... no idea why that is ...
        set_species('E_FKP',  initial_concentration=curr_opt_set_conc[0])
        set_species('E_FKP',  initial_concentration=curr_opt_set_conc[0])
        set_species('E_GMPK', initial_concentration=curr_opt_set_conc[1])
        set_species('E_PPA',  initial_concentration=curr_opt_set_conc[2])
        set_species('E_PPK3', initial_concentration=curr_opt_set_conc[3])
        # 3) simulate the model
        sim_result = run_time_course()
        # calculate the objective value (here: titer = GDP-Fucose concentration at 24h)
        # 24h is the last time point of the time course simulation
        sim_concs_timepoint_24h = sim_result.iloc[-1]
        titer_24h = sim_concs_timepoint_24h['GDP_Fucose']
        # append the titer to the row of titers (= contains titers for all different
        # optimization results and one parameter set)
        titers_row.append(titer_24h)
    # append row of titers for all different optimization results and one parameter set to overall result list
    all_titers.append(titers_row)

# OUTPUT
# export all_titers as python object
file_name = "GDP-Fucose_v7XGSK_PE9XGSK_Opt7b_SlctBestOptAllParams_EvoStrat_100x_allTit.pkl"
open_file = open(file_name, "wb")
pickle.dump(all_titers, open_file)
open_file.close()
# result structure:
# outer list: elements are lists of titers [ inner lists: elements are float titers]
# indexing:  all_titers[0]           -> first list of titers (for all different optimization 
#                                       results and for one parameter set)
#            all_titers[0][0]        -> first titer of the inner list

# SCORING
# import an opt_results list object via pickle
pickle_file = open("GDP-Fucose_v7XGSK_PE9XGSK_Opt7b_SlctBestOptAllParams_EvoStrat_100x_allTit.pkl", "rb")
all_titers = pickle.load(pickle_file)
pickle_file.close()
# create pandas data frame from all titers list of lists
# each sublist should be one row of the resulting df
df = pd.DataFrame(all_titers)
# column names: optimization result sets O1 ... Oi
df.columns = ['O{}'.format(i+1) for i in df.columns]
# row names: parameter sets p1 ... pj
df.index = ['p{}'.format(i+1) for i in df.index]
# calculate statistics (count, mean, std, min, 25%, 50%=median, 75%, max)
# for each column of the p x O matrix (rows: parameter sets p; columns: optimization result sets O)
df_col_stats = df.describe()
# calculate sum for each column
df_col_sums= df.sum(axis=0)
# select colum with the highest median
df_col_stats_medians = df_col_stats.loc['50%']
df_max_col_median_idx = df_col_stats_medians.idxmax()
# select colum with the highest minimum
df_col_stats_mins = df_col_stats.loc['min']
df_max_col_min_idx = df_col_stats_mins.idxmax()
# select column with highest sum
df_max_col_sum_idx = df_col_sums.idxmax()
# combine different statistical measures to obtain final ranking
# idea: for each column calculate
# 'col_median/overall_max_median + col_min/overall_max_min + col_sum/overall_max_sum = score';
# max score = 3
df_col_stats_max_median = max(df_col_stats.loc['50%'])     # highest median over all columns
df_col_stats_max_min    = max(df_col_stats.loc['min'])     # highest min over all columns
df_col_sums_max_sum     = max(df_col_sums)                 # highest sum over all columns
# calculate score for each column (= each optimization result)
scoring_results = []
for col_name in df_col_stats:
    # content of current column in data frame 'df_col_stats'
    curr_col = df_col_stats.loc[:,col_name]
    # extract median and min
    curr_median = curr_col.loc['50%']
    curr_min = curr_col.loc['min']
    # extract sum from separate data frame 'df_col_sums' with same id (= current col name)
    curr_sum = df_col_sums.loc[col_name]
    # calculate score
    curr_score = (curr_median/df_col_stats_max_median) + (curr_min/df_col_stats_max_min) + (curr_sum/df_col_sums_max_sum)
    # save each term and score in sublist and append to overall result list
    scoring_results.append([curr_median/df_col_stats_max_median, 
                            curr_min/df_col_stats_max_min,
                            curr_sum/df_col_sums_max_sum,
                            curr_score])

# create data frame from list of sublists 'scoring_result'
# each sublist should be one row of the resulting df
df_scores = pd.DataFrame(scoring_results)
# column names: 'median_score', 'min_score', 'sum_score', 'total_score'
df_scores.columns = ['median_score', 'min_score', 'sum_score', 'total_score']
# row names: optimization result sets O1 ... Oi
df_scores.index = ['O{}'.format(i+1) for i in df_scores.index]
# identify optimization result with the best total score
best_total_score_value = max(df_scores.loc[:,'total_score'])
best_total_score_index = df_scores.loc[:,'total_score'].idxmax()