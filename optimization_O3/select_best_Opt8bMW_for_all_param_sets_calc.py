#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Select the best optimization result (prediction) by
calculating the objective value (here: enzyme load 
= sum of all initial enzyme conc.) for all combinations of 
all parameter sets p with all optimization results O.

Model: GDP-Fucose_v7XGSK_with_PE9XGSK_setup.cps

Approach: Load the list of parameter sets and load the list of optimization results
(= sets of optimal initial enzyme concentrations). Both lists are of equal size
(usually 100). Then, build a two level loop to iterate over all possible combinations of
i parameter sets p and j optimization results O. Set the respective parameters and initial
enzyme concentrations in the model and run a simulation. Store the results in a
i x j matrix (rows: parameter sets, columns: optimization results). Then, calculate different
measures (median, minimum, sum) for each column (= each optimization result) and combine them
to calculate a score for each column. The optimization result with the highest score is selected
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
# set initial substrate concentrations to FE18_07FKP since those were used for Opt8bMW
set_species('Fuc', initial_concentration=25.7)
set_species('ATP', initial_concentration=6)
set_species('GMP', initial_concentration=25.7)
# load the data of the parameter estimation sampling
# (the first column is all zeros, parameter columns start at .iloc[:,1])
param_sets = pd.read_csv(parent_dir_path + '\\' + 'parameter_ensemble' + '\\' + 'sampling_output_EvoStrat_100runs.csv')
# load the data of the repeated optimization
# object: list of list of pandas data frames; 
opt_result_sets = pd.read_pickle('GDP-Fucose_v7XGSK_PE9XGSK_Opt8bMW_EvoStrat100x_res_stats.pkl')

# CROSS-VALIDATION SIMULATION LOOP
# prepare lists for overall loop results
all_E_tot_MW = []
all_titers = []
# loop over all i parameter sets and j optimization results
for index, param_set in tqdm(param_sets.iterrows()):
    # prepare lists for inner loop results 
    # (sublists with gram enyme loads and titers for all different optimization results for one parameter set)
    E_tot_MW_row = []
    titer_row = []
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
        # calculate the objective value (here: gram enzyme load = sum of all initial
        # enzyme concentrations in g/l; E_tot_MW is constant across all time points)
        sim_vals_timepoint_24h = sim_result.iloc[-1]
        E_tot_MW_24h = sim_vals_timepoint_24h['Values[E_tot_MW]']
        # titer at 24h is part of a constraint in this case so it is also stored
        titer_24h = sim_vals_timepoint_24h['GDP_Fucose']
        # append the gram enzyme load to the row of gram enzyme loads (= contains
        # gram enzyme loads for all different optimization results and one parameter set)
        E_tot_MW_row.append(E_tot_MW_24h)
        # append the titer to the row of titers (= contains titers for all different
        # optimization results and one parameter set)
        titer_row.append(titer_24h)
    # append row of gram enzyme loads and titers for all different optimization results
    # and one parameter set to overall result list
    all_E_tot_MW.append(E_tot_MW_row)
    all_titers.append(titer_row)

# OUTPUT
# export all_E_tot_MW as python object
file_name = "GDP-Fucose_v7XGSK_PE9XGSK_Opt8bMW_SlctBstOptAllPar_EvoStrat100x_allEtotMW.pkl"
open_file = open(file_name, "wb")
pickle.dump(all_E_tot_MW, open_file)
open_file.close()
# export all_titers as python object
file_name = "GDP-Fucose_v7XGSK_PE9XGSK_Opt8bMW_SlctBstOptAllPar_EvoStrat100x_allTit.pkl"
open_file = open(file_name, "wb")
pickle.dump(all_titers, open_file)
open_file.close()
# result structure (example for all gram enzyme loads object):
# outer list: elements are lists of titers [ inner lists: elements are float titers]
# indexing:  all_E_tot_MW[0]           -> first list of gram enzyme lodas (for all different optimization 
#                                       results and for one parameter set)
#            all_E_tot_MW[0][0]        -> first gram enzyme load of the inner list

# SCORING
# import an opt_results list object via pickle (allEtotMW)
pickle_file = open("GDP-Fucose_v7XGSK_PE9XGSK_Opt8bMW_SlctBstOptAllPar_EvoStrat100x_allEtotMW.pkl", "rb")
all_E_tot_MW = pickle.load(pickle_file)
pickle_file.close()
# import an opt_results list object via pickle (alltiters)
pickle_file = open("GDP-Fucose_v7XGSK_PE9XGSK_Opt8bMW_SlctBstOptAllPar_EvoStrat100x_allTit.pkl", "rb")
all_titers = pickle.load(pickle_file)
pickle_file.close()
# create pandas data frame from all gram enzyme loads list of lists
# each sublist should be one row of the resulting df
df_E_tot_MW = pd.DataFrame(all_E_tot_MW)
# column names: optimization result sets O1 ... Oi
df_E_tot_MW.columns = ['O{}'.format(i+1) for i in df_E_tot_MW.columns]
# row names: parameter sets p1 ... pj
df_E_tot_MW.index = ['p{}'.format(i+1) for i in df_E_tot_MW.index]
# create pandas data frame from all titers list of lists
# each sublist should be one row of the resulting df
df_titers = pd.DataFrame(all_titers)
# column names: optimization result sets O1 ... Oi
df_titers.columns = ['O{}'.format(i+1) for i in df_titers.columns]
# row names: parameter sets p1 ... pj
df_titers.index = ['p{}'.format(i+1) for i in df_titers.index]
# calculate statistics (count, mean, std, min, 25%, 50%=median, 75%, max) for
# each column of the p x O matrix (rows: parameter sets p; columns: optimization result sets O)
df_E_tot_MW_col_stats = df_E_tot_MW.describe()
df_titers_col_stats = df_titers.describe()
# calculate sum for each column
df_E_tot_MW_col_sums= df_E_tot_MW.sum(axis=0)
df_titers_col_sums= df_titers.sum(axis=0)
# combine different statistical measures to obtain final ranking
# idea: weight1*(overall_enzyme_load_min/col_enyzme_load_value) + weight2*(titers_col_min-15) with
# weight1 = 10 and weight2 = 1 so that scores become positive (based on known value ranges) and
# also to emphasize the importance of getting a good (= low) gram enzyme load; 15
# because constraint in optimization problem was titer at 24h >= 15 mM
df_E_tot_MW_col_stats_min_min  = min(df_E_tot_MW_col_stats.loc['min'])   # lowest min gram enzyme load
# calculate score for each column (= each optimization result)
scoring_results = []
for E_tot_MW_col_name, titers_col_name in zip(df_titers_col_stats, df_E_tot_MW_col_stats):
    # content of current column in data frame 'df_titers_col_stats'
    titers_curr_col = df_titers_col_stats.loc[:,titers_col_name]
    # extract min
    titers_curr_min = titers_curr_col.loc['min']
    # content of current column in data frame 'df_E_tot_MW_col_stats'
    E_tot_MW_curr_col = df_E_tot_MW_col_stats.loc[:,E_tot_MW_col_name]
    E_tot_MW_curr_min = E_tot_MW_curr_col.loc['min']
    # calculate score
    curr_score = 10*(df_E_tot_MW_col_stats_min_min/E_tot_MW_curr_min) + 1*(titers_curr_min-15)
    # save each term and score in sublist and append to overall result list
    scoring_results.append([10*(df_E_tot_MW_col_stats_min_min/E_tot_MW_curr_min),
                            1*(titers_curr_min-15),
                            curr_score])
# create data frame from list of sublists 'scoring_result'
# each sublist should be one row of the resulting df
df_scores = pd.DataFrame(scoring_results)
# column names: 'E_tot_MW_min_score', 'titers_min_constraint_score', 'total_score'
df_scores.columns = ['E_tot_MW_min_score', 'titers_min_constraint_score', 'total_score']
# row names: optimization result sets O1 ... Oi
df_scores.index = ['O{}'.format(i+1) for i in df_scores.index]
# identify optimization result with the best total score
best_total_score_value = max(df_scores.loc[:,'total_score'])
best_total_score_index = df_scores.loc[:,'total_score'].idxmax()