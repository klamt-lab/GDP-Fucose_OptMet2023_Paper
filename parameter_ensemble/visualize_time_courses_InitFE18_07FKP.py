#!/usr/bin/env python
# -*- coding: utf-8 -*-

""" Visualization of the time courses that were simulated with the model based on the estimated parameters from the entire ensemble set to initial concentrations to the baseline experiment.

    1. Load random parameter sampling result.
    2. Import simulation results for each parameter set.
    3. Create subplots for each model species that contain all different trajectories (100 fits -> 100 curves in each plot).

"""

from basico import *
import math
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import pickle

# SETUP
# load sim_results
pickle_file = open("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCSimResults_InitFE18_07FKP.pkl", "rb")
sim_results = pickle.load(pickle_file)
pickle_file.close()
#column order of dataframes in sim_results determines the order of subplots later on -> set it here
new_cols_order = ['GMP', 'GDP', 'GTP', 'ADP', 'ATP', 'Fuc', 'Fuc1P', 'GDP_Fucose', 'PP', 'P',
                  'Values[GDP-Fucose at 40h]', 'Values[GDP-Fucose at 24h]',
                  'Values[Dyn. Updated Initial Fucose Conc]',
                  'Values[Dyn. Updated Initial GMP Conc]', 'Values[E_tot]',
                  'Values[Yield_Fucose]', 'Values[Yield_GMP]',
                  'Values[Substrate Weighted Cost]', 'Values[Productivity]',
                  'Values[S_tot]', 'Values[Enzyme Weighted Cost]',
                  'Values[Cost per Product]', 'Values[E_tot_MW]']
idx = 0
for df in sim_results:
    sim_results[idx] = df[new_cols_order + [c for c in df.columns if c not in new_cols_order]]
    idx = idx+1
# store column names of data frames (all df have the same col names so just store those from first df -> sim_result[0])
sim_results_col_names = sim_results[0].columns
# load FE18_07FKP experimental data for plotting
selected_exp_data = pd.read_csv('2022_11_24_FE18_for_model_fiting_07FKP.txt', sep='\t')
selected_exp_data_SD = pd.read_csv('2022_11_24_FE18_for_model_fiting_07FKP_SD.txt', sep='\t')
# remove last row because its measurement time point of 28.36h is outside of the simulation end time = 24h
selected_exp_data = selected_exp_data[:-1]
selected_exp_data_SD = selected_exp_data_SD[:-1]

# STATISTICS
# calculate statistics across all simulation results:
# 1) Average Trajectories
# for each species we want the average concentration per time point across all simulation result data frames in the list sim_results
# idea: just sum up all data frames in sim_results and divide by the amount of data frames!
sim_results_avg = sum(sim_results)/len(sim_results)
# 2) Standard Deviation of the Average Trajectories
# 'The standard deviation is the square root of the average of the squared deviations from the mean, i.e., std = sqrt(mean(x)), where x = abs(a - a.mean())**2.' <https://numpy.org/doc/stable/reference/generated/numpy.std.html>
sim_results_abs_sqd_diffs = list()
for df in sim_results:
    # calculate absolute squared differences between current data frame df and averaged sim results
    df_abs_sqd_diffs = np.abs(df - sim_results_avg)**2
    sim_results_abs_sqd_diffs.append(df_abs_sqd_diffs)
# compute new data frame containing the final standard deviations of the average trajectories
sim_results_avg_SD = np.sqrt( sum(sim_results_abs_sqd_diffs)/len(sim_results_abs_sqd_diffs) )

# MULTIPLOT TIME COURSES
# set multiplot size and define subplots for all species which each containing all trajectories from all simulations (10 relevant species: P, ATP, GTP, Fuc1P, GDP, Fuc, GDP_Fucose, PP, ADP, GMP) 10 plots: 2 rows, 5 cols of subplots
fig, ax = plt.subplots(2, 5, constrained_layout=True, 
                       figsize=(6, 3), dpi=200)
# set title
#fig.suptitle('Model Time Courses based on Random Sampling (n = 100) of Model Kinetic Parameters \n Model: GDP-Fucose_v7XGSK, Parameter Estimation: PE9XGSK, Init: FE18_07FKP', fontsize=16)
# define subplot titles
subplot_titles = ['GMP', 'GDP', 'GTP', 'ADP', 'ATP', 
                  'Fuc', 'Fuc1P', 'GDP_Fucose', 'PP', 'P']
df_col = 0
for i in range(2):
    for j in range(5):
        # set sub plot name to species name
        ax[i,j].set_title(subplot_titles[df_col], fontsize=6)
        # if condition setup allows different rendering of subplots of species with exp. data compared to those where no exp. data is avilable
        # (currently both are rendered in the same way)
        if sim_results_col_names[df_col] in selected_exp_data.columns:
            # plotting loop for 100 simulated curves
            for df in sim_results:
                ax[i,j].plot(df.iloc[:,df_col],
                             linewidth=0.2, color='grey', alpha=0.5)
            # plot average sim. trajectory
            ax[i,j].plot(sim_results_avg.iloc[:,df_col],
                         linewidth=0.5, color='#08519c')
            # plot average + associated SD
            ax[i,j].plot(sim_results_avg.iloc[:,df_col]+sim_results_avg_SD.iloc[:,df_col],             linewidth=0.5, color='#3182bd')
            # plot average - associated SD
            ax[i,j].plot(sim_results_avg.iloc[:,df_col]-sim_results_avg_SD.iloc[:,df_col],             linewidth=0.5, color='#3182bd')
            # fill area between +SD and -SD curves
            ax[i,j].fill_between(sim_results_avg.index, sim_results_avg.iloc[:,df_col]+sim_results_avg_SD.iloc[:,df_col], sim_results_avg.iloc[:,df_col]-sim_results_avg_SD.iloc[:,df_col], color='#9ecae1')
            # plot exp. data points of the selected experiment of the current species
            curr_exp_data_time = selected_exp_data["Time"]
            curr_exp_data_conc = selected_exp_data[sim_results_col_names[df_col]]
            curr_exp_data_SD = selected_exp_data_SD[sim_results_col_names[df_col]]
            #ax[i,j].plot(curr_exp_data_time, curr_exp_data_conc,
            #             '.', markersize=2, color='black')
            ax[i,j].errorbar(curr_exp_data_time, curr_exp_data_conc,
                             yerr=curr_exp_data_SD, color='black', 
                             fmt='o', markersize=0.5, elinewidth=0.5, 
                             capsize=0.5, capthick=0.5)
        else:
            # plotting loop for 100 simulated curves
            for df in sim_results:
                ax[i,j].plot(df.iloc[:,df_col], 
                             linewidth=0.2, color='grey', alpha=0.5)
            # plot average sim. trajectory
            ax[i,j].plot(sim_results_avg.iloc[:,df_col],
                         linewidth=0.5, color='#08519c')
            # plot average + associated SD
            ax[i,j].plot(sim_results_avg.iloc[:,df_col]+sim_results_avg_SD.iloc[:,df_col],             linewidth=0.5, color='#3182bd')
            # plot average - associated SD
            ax[i,j].plot(sim_results_avg.iloc[:,df_col]-sim_results_avg_SD.iloc[:,df_col],             linewidth=0.5, color='#3182bd')
            # fill area between +SD and -SD curves
            ax[i,j].fill_between(sim_results_avg.index, sim_results_avg.iloc[:,df_col]+sim_results_avg_SD.iloc[:,df_col], sim_results_avg.iloc[:,df_col]-sim_results_avg_SD.iloc[:,df_col], color='#9ecae1')
        # set axes tick label fontsize
        ax[i,j].tick_params(axis='x', labelsize=6)
        ax[i,j].tick_params(axis='y', labelsize=6)
        # set font size of 'offset text' = scaling factor label
        ax[i,j].yaxis.offsetText.set_fontsize(6)
        df_col = df_col + 1

# OUTPUT
# save plot as .pdf
plt.savefig("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCs_InitFE18_07FKP_fig.pdf")
# save plot as .png (for Word)
plt.savefig("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCs_InitFE18_07FKP_fig.png")
# save plot as .svg (for Word)
plt.savefig("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCs_InitFE18_07FKP_fig.svg")