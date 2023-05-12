#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Generation of an ensemble of kinetic model parameters via 
repeated global parameter estimation.

Model: GDP-Fucose_v7XGSK_with_PE9XGSK_setup.cps 
Experimental Data:
2022_11_08_FE13_for model fiting.txt,
2022_11_17_FE17_for_model_fiting_1FKP.txt,
2022_11_17_FE17_for_model_fiting_07FKP.txt,
2022_11_24_FE18_for_model_fiting_1FKP.txt,
2022_11_24_FE18_for_model_fiting_07FKP.txt
Method: Evolutionary Strategy (SRES), default COPASI settings

The parameter estimation is set in the
COPASI model file (.cps).

Approach: Repeat the parameter estimation 100
times, each time with the same initial parameter 
values using a global algorithm. Save the estimated 
parameters and the objective values of the fits.

Package: basiCO - simplified Copasi Python API
         <https://github.com/copasi/basico>
"""

import sys
if '../..' not in sys.path:
    sys.path.append('../..')

from basico import *
import matplotlib.pyplot as plt
import pandas as pd
from tqdm import trange

model = load_model('GDP-Fucose_v7XGSK_with_PE9XGSK_setup.cps')

# Parameter Estimation Setup:
# 1    1e-6 ≤ (FKP (fucokinase)).Km_ADP ≤ 1e4; Start Value = 0.1
# 2    1e-2 ≤ (FKP (fucokinase)).Km_ATP ≤ 1e2; Start Value = 1.08
# 3    1e-5 ≤ (FKP (fucokinase)).Km_Fuc ≤ 1e0; Start Value = 0.045
# 4    1e-7 ≤ (FKP (fucokinase)).Km_Fuc1P ≤ 1e4; Start Value = 0.1
# 5    1e0 ≤ (FKP (fucokinase)).kcat_F ≤ 1e6; Start Value = 1404
# 6    1e-4 ≤ (FKP (guanylyltransferase)).Km_Fuc1P ≤ 1e2; Start Value = 0.03295
# 7    1e-2 ≤ (FKP (guanylyltransferase)).Km_GDP_Fuc ≤ 1e3; Start Value = 0.12
# 8    1e-4 ≤ (FKP (guanylyltransferase)).Km_GTP ≤ 1e3; Start Value = 0.012
# 9    1e-2 ≤ (FKP (guanylyltransferase)).Km_PP ≤ 1e2; Start Value = 0.135
# 10   1e0 ≤ (FKP (guanylyltransferase)).kcat_F ≤ 1e6; Start Value = 36252
# 11   1e-10 ≤ (FKP (guanylyltransferase)).ki_PP ≤ 1e-6; Start Value = 1e-8
# 12   1e-4 ≤ (GMPK).Km_ADP ≤ 1e2; Start Value = 0.017
# 13   1e-3 ≤ (GMPK).Km_ATP ≤ 1e2; Start Value = 0.5
# 14   1e-4 ≤ (GMPK).Km_GDP ≤ 1e2; Start Value = 0.097
# 15   1e-4 ≤ (GMPK).Km_GMP ≤ 1e2; Start Value = 0.156
# 16   1e0 ≤ (GMPK).kcat_F ≤ 1e6; Start Value = 752400
# 17   1e-6 ≤ (PPA).Km_PP ≤ 1e1; Start Value = 0.003
# 18   1e0 ≤ (PPA).kcat_F ≤ 1e6; Start Value = 558000
# 19   0.5 ≤ (PPK3_A).K_eq_PPK3_A ≤ 2; Start Value = 1
# 20   1e-4 ≤ (PPK3_A).Km_ADP ≤ 1e2; Start Value = 2.5
# 21   1e-4 ≤ (PPK3_A).Km_ATP ≤ 1e2; Start Value = 2
# 22   1e0 ≤ (PPK3_A).kcat_F ≤ 1e6; Start Value = 18780
# 23   0.5 ≤ (PPK3_G).K_eq_PPK3_G ≤ 2; Start Value = 1
# 24   1e-4 ≤ (PPK3_G).Km_GDP ≤ 1e2; Start Value = 1.2
# 25   1e-6 ≤ (PPK3_G).Km_GTP ≤ 1e4; Start Value = 0.1
# 26   1e0 ≤ (PPK3_G).kcat_F ≤ 1e6; Start Value = 15048
# Constraints:
# 1    0 ≤ [ADP] ≤ inf
# 2    0 ≤ [ATP] ≤ inf
# 3    0 ≤ [E_FKP] ≤ inf
# 4    0 ≤ [E_GMPK] ≤ inf
# 5    0 ≤ [E_PPA] ≤ inf
# 6    0 ≤ [E_PPK3] ≤ inf
# 7    0 ≤ [Fuc1P] ≤ inf
# 8    0 ≤ [Fuc] ≤ inf
# 9    0 ≤ [GDP] ≤ inf
# 10   0 ≤ [GDP_Fucose] ≤ inf
# 11   0 ≤ [GMP] ≤ inf
# 12   0 ≤ [GTP] ≤ inf
# 13   0 ≤ [PP] ≤ inf
# 14   0 ≤ [P] ≤ inf

# PREPARATION OF VARIABLES
# get the reaction parameters (creates: pandas.core.frame.DataFrame)
reaction_params = get_reaction_parameters()
# get the estimation setup (creates: pandas.core.frame.DataFrame)
fit_params = get_fit_parameters()
# get experimental data (creates: list)
exp_data = get_experiment_data_from_model()
# run parameter estimation task with 'Current Solution Statistics' once to 
# get the correct mapping of exp data to the model species
# (this will not fit anything, it will just show the current solution and it 
# will make the correct mapping possible!)
run_parameter_estimation(method='Current Solution Statistics', update_model=False)
# get mapping of experimental data (creates: pandas.core.frame.DataFrame)
# (sufficient to get it from FE13 since the mapping is the same for all exp. data sets)
mapping = get_experiment_mapping('FE13')
# create an empty pandas data frame to store the results of repeated parameter estimations
# (obj value and all estimated parameters)
# .index.values returns the row names of the pandas dataframe as a numpy.ndarray;
# the list() function converts the ndarray to a list (containing the row names as strings);
# add a column for the objective value of the fit as last column
column_names = list(reaction_params.index.values) + ['obj_val']
fit_results = pd.DataFrame(columns=column_names)

# PARAMETER ESTIMATION LOOP
for i in trange(100):
    # estimate the parameters with the global solver: 'Evolution Strategy (SRES)'
    run_parameter_estimation(method='Evolution Strategy (SRES)', update_model=False)
    # get solution of the parameter estimation run (creates: pandas.core.frame.DataFrame)
    fit_sol = get_parameters_solution()
    # sol.iloc[0,0] -> '1e-1' = str type lower boundary entry
    # => sol.iloc[:,2] returns all estimated parameter values
    # (third column = sol) as pandas.core.series.Series
    fit_estim_params = fit_sol.iloc[:,2]
    # get objective value of the last fit ( = measurement for quality of the fit) and
    # create a series with that value and the name 'obj_val'
    fit_stats = get_fit_statistic()
    fit_stats_objval = pd.Series(fit_stats['obj'], index=['obj_val'])
    # append the series which contains the objective value to the series of fitted 
    # parameter values (at the end)
    fit_estim_params = fit_estim_params.append(fit_stats_objval)
    # append the updated series to the result dataframe by first converting it to
    # a data frame with .to_frame() and by transposing the resulting data frame with
    # .T (to get one long row instead of one column with many rows)
    fit_results = pd.concat([fit_results, fit_estim_params.to_frame().T])

# OUTPUT
fit_results.to_csv('sampling_output_EvoStrat_100runs.csv')