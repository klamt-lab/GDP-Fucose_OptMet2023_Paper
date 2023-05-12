#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Simulate model with entire parameter ensemble set to the initial
concentrations of the validation experiment.

1. Load random parameter sampling result
2. Go through each set of estimated parameters, set the model
   parameters to these values, simulate the model,
   and store the results as data frames in a list
   (100 fits -> 100 model simulations)
"""

import os
from basico import *
import math
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import pickle

# SETUP
# get parent directory
path = os.getcwd()
parent_dir_path = os.path.abspath(os.path.join(path, os.pardir))
# read the data of the parameter estimation sampling
# (the first column is all zeros, parameter columns start at .iloc[:,1])
fits_data = pd.read_csv(parent_dir_path + '\\' + 'parameter_ensemble' + '\\' + 'sampling_output_EvoStrat_100runs.csv')
# rename first column (names for fits will be stored there)
fits_data.rename({'Unnamed: 0' : 'Name'}, axis=1, inplace=True)
# index parameter sets (set IDS in first column 'Unnamed: 0' of result data frame)
for i in range(len(fits_data)):
    fits_data.at[i, 'Name'] = i
# load model (the model will only be used for time course simulations in this script,
# no further parameter estimations or other optimizations)
model_path = parent_dir_path + '\\' + 'parameter_ensemble' + '\\' + 'GDP-Fucose_v7XGSK_with_PE9XGSK_setup.cps'
model = load_model(model_path)
# set initial concentrations of Alberto FE20_Validation2 experiment [mM]
# (initial enzyme concentrations from opt. result 'O88'.EvoStrat100x as listed in
# 'select_best_Opt8bMW_for_all_param_sets.py'; initial substrate concentrations from FE20_Validation2 experiment)
set_species('Fuc', initial_concentration=22)            # set to measured GMP_0
set_species('ATP', initial_concentration=5)             # measrued at t=0
set_species('GMP', initial_concentration=22)            # measured at t=0
set_species('E_FKP', initial_concentration=0.007145)
set_species('E_PPA', initial_concentration=0.007279)
set_species('E_PPK3', initial_concentration=0.001040)
set_species('E_GMPK', initial_concentration=0.002413)
# FE20_Validation2 is not part of the model file. Therefore, we need to get it from an external text file
# (changes to file: change 'GDP-Fucose' to 'GDP_Fucose', add square brackets around sepcies names
# in header, remove AMP measurements)
selected_exp_data = pd.read_table('2023_02_01_FE20_Validation2_withInitConcColumns.txt', sep='\t', header=0)
# load standard deriatives
selected_exp_data_SD = pd.read_table('2023_02_01_FE20_Validation2_SD.txt', sep='\t', header=0)

# SIMULATION LOOP
# loop over result data frame (every row = one parameter set)
sim_results = list()
for index, param_set in fits_data.iterrows():
    # current list of parameter values
    curr_param_set_vals = list(param_set)
    # current list of parameter names
    curr_param_set_names = list(param_set.keys())
    # both lists have same length: 31
    # list() to only get content (values or names) of pandas series param_set
    # .keys() to get names of values in pandas series param_set
    # trim both lists (get rid of first entries = name and last entries = obj_val of fit)
    curr_param_set_vals = curr_param_set_vals[1:-1]
    curr_param_set_names = curr_param_set_names[1:-1]
    # set model parameter values to current estimated parameters from rand sampling result
    for i in range(len(list(curr_param_set_vals))): 
        set_reaction_parameters(name = curr_param_set_names[i], value = curr_param_set_vals[i])
    # simulate the model with these updated parameter values
    sim_result = run_time_course()
    # store the simulation result
    sim_results.append(sim_result)

# OUTPUT
# export sim_results as python object
file_name = "GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCSRes_InitFE20_Val2_Opt8bMW_O88.pkl"
open_file = open(file_name, "wb")
pickle.dump(sim_results, open_file)
open_file.close()