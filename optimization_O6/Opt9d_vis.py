#!/usr/bin/env python
# -*- coding: utf-8 -*-

""" Visualize the model-based optimization using the entire parameter ensemble.
    
    Model: GDP-Fucose_v7XGSK_PE9XGSK_with_Opt9d_setup.cps
    Method: Genetic Algorithm, default COPASI settings
    
    The optimization is set in the COPASI model file (.cps)
    
    Approach: Import the optimization result for each of the
    estimated parameter sets from the random parameter sampling 
    (100 times). Plot the optimization results (= predicted initial 
    enzyme concentrations) as combination of box and strip plot.
    
    "A box plot (or box-and-whisker plot) shows the distribution of quantitative data in a 
    way that facilitates comparisons between variables or across levels of a categorical 
    variable. The box shows the quartiles of the dataset while the whiskers extend to show 
    the rest of the distribution, except for points that are determined to be “outliers” 
    using a method that is a function of the inter-quartile range."
    <https://seaborn.pydata.org/generated/seaborn.boxplot.html>
    
    Package: basiCO - simplified Copasi Python API
             <https://github.com/copasi/basico>"""

import sys
if '../..' not in sys.path:
    sys.path.append('../..')

from basico import *
import matplotlib.pyplot as plt
import pandas as pd

from tqdm import tqdm
import pickle
import seaborn as sns

# OPTIMIZATION DATA
# result structure:
# outer list opt_results [ inner lists  [ df opt result, dict opt_stats  ]  [...]  [...] ...]
# indexing: opt_results[0][0]           -> first opt result dataframe
#           opt_results[0][0].iloc[:,0] -> first column in first opt_result dataframe
#           opt_results[0][1]           -> first opt result statistics dictionary
#           opt_results[0][1]['key']    -> entry of 'key' in first opt result  
#                                          statistics dictionary
# import an opt_results list object via pickle
pickle_file = open('GDP-Fucose_v7XGSK_PE9XGSK_Opt9d_RandParamSampl_EvoStrat100x_list_res_stats.pkl', "rb")
opt_results = pickle.load(pickle_file)
pickle_file.close()
# prepare opt result data for plotting -> seaborn plots need pandas dataframe:
# cols: ['name', 'sol']
# rows: amount of rows = amount of different enzymes * amount of optimizations
# method: create pandas dataframe from pandas series; then use dataframe for plotting
plot_data = []
for sublist in opt_results:
    # unpack sublist
    result_df = sublist[0]    # pandas dataframe
    result_stats = sublist[1] # dict
    # get series of recommended initial concentrations for all enzymes
    rec_init_concs = result_df.iloc[:,3]
    # append series to plot_data list
    plot_data.append(rec_init_concs)
# stack all series vertically
plot_data = pd.concat(plot_data, axis = 0)
# reset index to create dataframe (former index is now names column)
plot_df = plot_data.reset_index()
# split plot_df into enzyme and substrate dataframes (| is 'or' in pandas)
plot_df_enzymes = plot_df[(plot_df == 'E_FKP').any(axis=1) |
                          (plot_df == 'E_GMPK').any(axis=1) |
                          (plot_df == 'E_PPA').any(axis=1) |
                          (plot_df == 'E_PPK3').any(axis=1)]
plot_df_substrates = plot_df[(plot_df == 'ATP').any(axis=1) |
                             (plot_df == 'Fuc').any(axis=1) |
                             (plot_df == 'GMP').any(axis=1)]
plot_dfs = [plot_df_enzymes, plot_df_substrates]
# create data frames with start concentrations before optimization (pre_opt_concs) and the optimization result that I found manually via the Copasi GUI and stored in optimization_infos.txt (selected_opt_concs)
pre_opt_concs_E = [['E_FKP', 0.006625024],
                   ['E_GMPK', 0.006358087],
                   ['E_PPA', 0.03106716],
                   ['E_PPK3', 0.002878526]]
pre_opt_concs_S = [['ATP', 6],
                   ['Fuc', 25.7],
                   ['GMP', 25.7]]
pre_opt_dfs = [pd.DataFrame(pre_opt_concs_E, columns=['name', 'conc']),
               pd.DataFrame(pre_opt_concs_S, columns=['name', 'conc'])]

# PLOTTING
# visualize the optimization result with a box plot+ strip plot: recommended initial enzyme concentration values are used to create box plots + are drawn as scattered dots per enzyme category
# define figure style and set scaling of all font sizes
sns.set(style='white', font_scale=1.25, rc={'axes.grid': True})
# define multiplot (composite of the following individual graphs); width=12, height=6
fig, ax = plt.subplots(1,2, figsize=(12, 6),
                       constrained_layout=True)
for i in range(2):
    # 1) create seaborn box plot
    sns.boxplot(x='name', y='sol', data=plot_dfs[i], ax=ax[i],
                boxprops={'facecolor': (0.4, 0.8, 0.6, 0.3)})
    # adding transparency to box fill colors
    for patch in ax[i].artists:
        r, g, b, a = patch.get_facecolor()
        patch.set_facecolor((r, g, b, .3))
    # 2) create seaborn strip plot
    sns.stripplot(x='name', y='sol', data=plot_dfs[i], ax=ax[i], 
                  s=3)
    # 3) create seaborn scatter plot (to add markers (red horizontal lines) for start values (pre-optimization) of initial concentations)
    sns.scatterplot(x='name', y='conc', data=pre_opt_dfs[i], ax=ax[i],
                    color='r', s=1000, marker='_')
    # set y-axis limits
    max_conc = max(plot_dfs[i].loc[:,'sol'])
    ax[i].set(ylim=(0, max_conc + max_conc * 0.1))
    # set axes labels (x and y) and x-axis tick labels
    if i == 0: # enzymes
        ax[i].set(xlabel='',
                  ylabel='Concentration [mM] \n')
        ax[i].set_xticklabels(['FKP', 'GMPK', 'PPA', 'PPK3'])
    if i == 1: # substrates
        ax[i].set(xlabel='',
                  ylabel='')
        ax[i].set_xticklabels(['ATP', 'Fucose', 'GMP'])
# apply tight layout to entire figure
plt.tight_layout()

# OUTPUT
# save plot as .pdf
plt.savefig("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt9d_BoxScatterPlot_fig.pdf")
# save plot as .png (for Word)
plt.savefig("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt9d_BoxScatterPlot_fig.png")
# save plot as .svg (for Word)
plt.savefig("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt9d_BoxScatterPlot_fig.svg")