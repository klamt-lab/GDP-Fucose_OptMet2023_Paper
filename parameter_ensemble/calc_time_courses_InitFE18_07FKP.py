#!/usr/bin/env python
# -*- coding: utf-8 -*-

""" Simulate model with entire parameter ensemble set to initial concentrations of the baseline experiment.

    1. Load random parameter sampling result
    2. First loop: go through each set of estimated parameters, set the model parameters to these values, simulate the model, and store the results as data frames in a list (100 fits -> 100 model simulations)
    3. Second loop: create subplots for each model species that contain all different trajectories (100 fits -> 100 curves in each plot)
    
"""

from basico import *
import math
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import pickle

# SETUP
# read the data of the parameter estimation sampling
# (the first column is all zeros, parameter columns start at .iloc[:,1])
fits_data = pd.read_csv('sampling_output_EvoStrat_100runs.csv')
# rename first column (names for fits will be stored there)
fits_data.rename({'Unnamed: 0' : 'Name'}, axis=1, inplace=True)
# name parameter sets (enter names in first column 'Unnamed: 0' of result data frame)
for i in range(len(fits_data)):
    fits_data.at[i, 'Name'] = i # fstrings are not accepted, just use number for now
# load model (the model will only be used for time course simulations in this script, no further parameter estimations or other optimizations)
model = load_model('GDP-Fucose_v7XGSK_with_PE9XGSK_setup.cps')
# set initial concentrations of Alberto FE18_07FKP experiment [mM]
set_species('Fuc', initial_concentration=25.7)
set_species('ATP', initial_concentration=6)
set_species('GMP', initial_concentration=25.7)
set_species('E_FKP', initial_concentration=0.006625024)
set_species('E_PPA', initial_concentration=0.03106716)
set_species('E_PPK3', initial_concentration=0.002878526)
set_species('E_GMPK', initial_concentration=0.006358087)
# fetch FE18_07FKP experimental data for plotting
exp_data = get_experiment_data_from_model()
# (Indices: 0 - FE13; 1 - FE17_07FKP; 2 - FE17_1FKP; 3 - FE18_07FKP; 4 - FE18_1FKP)
selected_exp_data = exp_data[3]

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
file_name = "GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCSimResults_InitFE18_07FKP.pkl"
open_file = open(file_name, "wb")
pickle.dump(sim_results, open_file)
open_file.close()