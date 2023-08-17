#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Visualize cross-validation of optimization results with all parameter sets of
the ensemble as heat map.

Approach: Import a pickled object that contains the simulation results of all 
possible combinations of i parameter sets p and j optimization results O (i x j 
matrix = rows: parameter sets, columns: optimization results). Then, visualize 
simulation results as heat map.

Package: basiCO - simplified Copasi Python API
         <https://github.com/copasi/basico>"""

import sys
if '../..' not in sys.path:
    sys.path.append('../..')

from basico import *
import pandas as pd
from tqdm import tqdm
import string
import pickle
import matplotlib.pyplot as plt
from mpl_toolkits.axes_grid1.inset_locator import inset_axes
import seaborn as sns

# DATA IMPORT
# result structure:
# outer list: elements are lists of titers [ inner lists: elements are float titers]
# indexing:  all_titers[0]           -> first list of titers (for all different optimization 
#                                       results and for one parameter set)
#            all_titers[0][0]        -> first titer of the inner list
# import an opt_results list object via pickle (allEtotMW)
pickle_file = open("GDP-Fucose_v7XGSK_PE9XGSK_Opt8bMW_SlctBstOptAllPar_EvoStrat100x_allEtotMW.pkl", "rb")
all_E_tot_MW = pickle.load(pickle_file)
pickle_file.close()
# create pandas data frame from all titers list of lists
# each sublist should be one row of the resulting df
df_E_tot_MW = pd.DataFrame(all_E_tot_MW)
# column names: optimization result sets O1 ... Oi
df_E_tot_MW.columns = ['O{}'.format(i+1) for i in df_E_tot_MW.columns]
# row names: parameter sets p1 ... pj
df_E_tot_MW.index = ['p{}'.format(i+1) for i in df_E_tot_MW.index]
# import an opt_results list object via pickle (alltiters)
pickle_file = open("GDP-Fucose_v7XGSK_PE9XGSK_Opt8bMW_SlctBstOptAllPar_EvoStrat100x_allTit.pkl", "rb")
all_titers = pickle.load(pickle_file)
pickle_file.close()
# create pandas data frame from all titers list of lists
# each sublist should be one row of the resulting df
df_titers = pd.DataFrame(all_titers)
# column names: optimization result sets O1 ... Oi
df_titers.columns = ['O{}'.format(i+1) for i in df_titers.columns]
# row names: parameter sets p1 ... pj
df_titers.index = ['p{}'.format(i+1) for i in df_titers.index]
# import a data frame of heat map column scores via pickle
pickle_file = open("GDP-Fucose_v7XGSK_PE9XGSK_Opt8bMW_SlctBstOptAllPar_EvoStrat100x_score_df.pkl", "rb")
df_scores = pickle.load(pickle_file)
pickle_file.close()

# PLOTTING
# create multi plot of 3 subplots (3 rows, 1 column) that combines all three heat maps with a height ratio of 1:20:1
fig, ax = plt.subplots(3, 1, figsize=(7, 7),
                       gridspec_kw={'height_ratios': [1, 20, 1]})
# set global font scale
sns.set(font_scale=1.2)
# adjust whitespace around subplots
fig.subplots_adjust(bottom=-0.05, top=0.9, wspace=0, hspace=-0.65)
# 1) TOTAL SCORES HEATMAP: the total score is a function of column enzyme loads and column titer minima across all parameter sets, therefore there's only one total score value per column
# set color map (reverse default color scheme: higher values => darker color)
cmap = sns.cm.rocket_r
# specify color bar options
cax = inset_axes(ax[0],
                 width="100%",  # width: 100% of parent_bbox width
                 height="100%",  # height: 100% of parent_bbox height
                 loc='upper center',
                 bbox_to_anchor=(0, 10, 1, 1), # anchor point 10 pt above heat map upper border
                 bbox_transform=ax[0].transAxes,
                 borderpad=0,
                 )
# draw heat map
sns.heatmap(df_scores.T.iloc[2:3,:], robust=True,
            cmap=cmap, square=True, ax=ax[0],
            cbar_ax=cax, cbar_kws={'orientation': 'horizontal'})
# overwrite axes tick labels with empty lists to hide them
ax[0].set_xticklabels([])
ax[0].set_yticklabels([])
# annotate first heat map with capital A
ax[0].text(-0.15, 10, string.ascii_uppercase[0], transform=ax[0].transAxes, 
           size=20, weight='bold')
# 2) TITER HEATMAP: visualize pandas data frame df_titers as heat map 
# set color map (reverse default color scheme: higher values => darker color)
cmap = sns.cm.mako_r
# specify color bar options
cax = inset_axes(ax[1],
                 width="1%",  # width: 1% of parent_bbox width
                 height="100%",  # height: 100% of parent_bbox height
                 loc='lower left',
                 bbox_to_anchor=(1.05, 0., 1, 1), # anchor point 1.05 pt right of heat map right border
                 bbox_transform=ax[1].transAxes,
                 borderpad=0,
                 )
# define axes tick labels:
#   -> indeces [0,99] shifted to [1,100]
#   -> for display tick labels: start with 1 (old 0), then 10 (old 9), 20 (old 19), 
#      etc. till 100 (old 99)
#   -> these display tick labels correspond to row ('pX') and column names ('OX') in df which 
#      are used for .loc[] based indexing (whereas .iloc[] is based on [0,99] python indeces)
xticks = ['1', '', '', '', '', '', '', '', '', '10', 
          '' , '', '', '', '', '', '', '', '', '20',
          '' , '', '', '', '', '', '', '', '', '30',
          '' , '', '', '', '', '', '', '', '', '40',
          '' , '', '', '', '', '', '', '', '', '50',
          '' , '', '', '', '', '', '', '', '', '60',
          '' , '', '', '', '', '', '', '', '', '70',
          '' , '', '', '', '', '', '', '', '', '80',
          '' , '', '', '', '', '', '', '', '', '90',
          '' , '', '', '', '', '', '', '', '', '100']
yticks = ['1', '', '', '', '', '', '', '', '', '10', 
          '' , '', '', '', '', '', '', '', '', '20',
          '' , '', '', '', '', '', '', '', '', '30',
          '' , '', '', '', '', '', '', '', '', '40',
          '' , '', '', '', '', '', '', '', '', '50',
          '' , '', '', '', '', '', '', '', '', '60',
          '' , '', '', '', '', '', '', '', '', '70',
          '' , '', '', '', '', '', '', '', '', '80',
          '' , '', '', '', '', '', '', '', '', '90',
          '' , '', '', '', '', '', '', '', '', '100']
# draw heat map
sns.heatmap(df_titers, robust=True,
            xticklabels = xticks,
            yticklabels = yticks,
            cmap=cmap, square=True, ax=ax[1],
            cbar_ax=cax, cbar_kws={'orientation': 'vertical'})
ax[1].set(xlabel='\n Optimization Result Set ID',
          ylabel='Parameter Set ID \n')
# annotate second heat map with capital B
ax[1].text(-0.15, 0.95, string.ascii_uppercase[1], transform=ax[1].transAxes, 
           size=20, weight='bold')
# add rectangle to highlight best column
labels = list(df_titers.columns)
N = len(labels)
wanted_label = best_total_score_index   # 'O88'
wanted_index = labels.index(wanted_label)
ax[1].add_patch(Rectangle((wanted_index, 0), 1, N,
                          fill=False, edgecolor='crimson',
                          lw=1, clip_on=False))
ax[1].tick_params(length=0)
# 3) E_TOT_MW HEATMAP: the enzyme load (E_tot_MW) is the same across all parameter sets, therefore we only need the first row of the df_E_tot_MW matrix
# set color map (default color scheme: lower values => darker color)
cmap = sns.cm.rocket
# specify color bar options
cax = inset_axes(ax[2],
                 width="100%",  # width: 100% of parent_bbox width
                 height="100%",  # height: 100% of parent_bbox height
                 loc='upper center',
                 bbox_to_anchor=(0, -10, 1, 1), # anchor point 10 pt below heat map upper border
                 bbox_transform=ax[2].transAxes,
                 borderpad=0,
                 )
# draw heat map
sns.heatmap(df_E_tot_MW.iloc[0:1,:], robust=True,
            cmap=cmap, square=True, ax=ax[2],
            cbar_ax=cax, cbar_kws={'orientation': 'horizontal'})
# overwrite axes tick labels with empty lists to hide them
ax[2].set_xticklabels([])
ax[2].set_yticklabels([])
# annotate third heat map with capital C
ax[2].text(-0.15, 0.025, string.ascii_uppercase[2], transform=ax[2].transAxes, 
           size=20, weight='bold')

# OUTPUT
# save plot as .pdf
plt.savefig("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt8bMW_EtotMWTiterHM_fig.pdf",
            bbox_inches='tight')
# save plot as .png (for Word)
plt.savefig("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt8bMW_EtotMWTiterHM_fig.png",
            bbox_inches='tight')
# save plot as .svg (for Word)
plt.savefig("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt8bMW_EtotMWTiterHM_fig.svg",
            bbox_inches='tight')