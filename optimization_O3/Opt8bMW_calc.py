#!/usr/bin/env python
# -*- coding: utf-8 -*-

""" Model-based optimization using the entire parameter ensemble.
    
    Model: GDP-Fucose_v7XGSK_PE9XGSK_with_Opt8bMW_setup.cps
    Method: Genetic Algorithm, default COPASI settings

    The optimization is set in the COPASI model file (.cps)
    
    Approach: Calculate the optimization result for each of the
    estimated parameter sets from the random parameter sampling 
    (100 times). Export the result as serialized pickle (.pkl) file.
    
    Package: basiCO - simplified Copasi Python API
             <https://github.com/copasi/basico>"""

import os
from basico import *
import matplotlib.pyplot as plt
import pandas as pd
from tqdm import tqdm
import pickle
import seaborn as sns

model = load_model('GDP-Fucose_v7XGSK_PE9XGSK_with_Opt8bMW_setup.cps')

# optimization parameters (= optimization variables):
# 1	   0.00021 ≤ [E_FKP]_0 ≤ 0.01491; Start Value = 0.006625024
# 2	   0.002413333 ≤ [E_GMPK]_0 ≤ 0.50706; Start Value = 0.006358087
# 3	   0.00319 ≤ [E_PPA]_0 ≤ 0.22363; Start Value = 0.03106716
# 4	   0.00018 ≤ [E_PPK3]_0 ≤ 0.0129; Start Value = 0.002878526
# constraints:
# 1	   0 ≤ [ADP] ≤ inf
# 2	   0 ≤ [ATP] ≤ inf
# 3	   0 ≤ [Fuc1P] ≤ inf
# 4	   0 ≤ [Fuc] ≤ inf
# 5	   0 ≤ [GDP] ≤ inf
# 6	   0 ≤ [GDP_Fucose] ≤ inf
# 7	   0 ≤ [GMP] ≤ inf
# 8	   0 ≤ [GTP] ≤ inf
# 9	   0 ≤ [PP] ≤ inf
# 10	   0 ≤ [P] ≤ inf
# 11	   15 ≤ Values[GDP-Fucose at 24h] ≤ inf
#     -> global quantity 'GDP-Fucose at 24h', value: 12.81660265 <-> event: 'Save GDP-Fucose at 24h' with trigger: {Time} == 24, target: Values[GDP-Fucose at 24h], expression: {[GDP_Fucose]}

# PREPARATION OF VARIABLES
# read the data of the parameter estimation sampling
# (the first column is all zeros, parameter columns start at .iloc[:,1])
path = os.getcwd()
parent_dir_path = os.path.abspath(os.path.join(path, os.pardir))
fits_data = pd.read_csv(parent_dir_path + '\\' + 'parameter_ensemble' + '\\' + 'sampling_output_EvoStrat_100runs.csv')
# setup optimization problem (it's already set in the .cps file but basiCO needs it here as well)
opt_vars = [{'name': '[E_FKP]_0',
            'lower': 0.00021,
            'upper': 0.01491,
            'start': 0.006625024},
            {'name': '[E_GMPK]_0',
            'lower': 0.002413333,
            'upper': 0.50706,
            'start': 0.006358087},
            {'name': '[E_PPA]_0',
            'lower': 0.00319,
            'upper': 0.22363,
            'start': 0.03106716},
            {'name': '[E_PPK3]_0',
            'lower': 0.00018,
            'upper': 0.0129,
            'start': 0.002878526}]
set_opt_parameters(opt_vars)
# there can be no spaces in the Copasi object name!
set_objective_function(expression='Values[E_tot_MW]', minimize=True)
# constraints are set in the .cps file
set_opt_settings(settings={
    'subtask': T.TIME_COURSE,
    'method': {
        'name': PE.GENETIC_ALGORITHM
}})

# OPTIMIZATION LOOP
# setup for repeated optimizations with all different estimated parameter sets from random parameter sampling result
opt_results = list()
# loop over result data frame (every row = one parameter set)
for index, param_set in tqdm(fits_data.iterrows()):
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
    # optimize the model with these updated parameter values
    opt_result = run_optimization() # opt_result is a pandas.core.frame.DataFrame
    opt_stats = get_opt_statistic() # opt_stats is a dict
    # get list of optimization variable start values
    opt_vars_start_vals = [opt_vars[0]['start'], 
                           opt_vars[1]['start'], 
                           opt_vars[2]['start'], 
                           opt_vars[3]['start']]
    # add start values of optimization variables to result data frame as column 3
    opt_result.insert(2, "start", opt_vars_start_vals, True)
    # store the optimization result dataframe and the opt_stats dict as a list
    opt_results.append([opt_result, opt_stats])

# OUTPUT
# export opt_results as python object
file_name = "GDP-Fucose_v7XGSK_PE9XGSK_Opt8bMW_EvoStrat100x_res_stats.pkl"
open_file = open(file_name, "wb")
pickle.dump(opt_results, open_file)
open_file.close()