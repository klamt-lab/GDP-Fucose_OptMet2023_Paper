#!/usr/bin/env python
# -*- coding: utf-8 -*-

""" Visualize cross-validation of optimization results with all parameter sets of the ensemble as heatmap.
    
    Approach: Import a pickled object that contains the simulation results of all 
    possible combinations of i parameter sets p and j optimization results O (i x j 
    matrix = rows: parameter sets, columns: optimization results). Then, visualize 
    simulation results as heatmap.
    
    Package: basiCO - simplified Copasi Python API
             <https://github.com/copasi/basico>"""

import sys
if '../..' not in sys.path:
    sys.path.append('../..')

from basico import *
import numpy as np
import pandas as pd
from tqdm import tqdm
import pickle
import matplotlib.pyplot as plt
import seaborn as sns

# DATA IMPORT
# result structure:
# outer list: elements are lists of costs per product [ inner lists: elements are float costs per product]
# indexing:  all_CostPerProd[0]           -> first list of costs per product (for all 
#                                            different optimization results and for one 
#                                            parameter set)
#            all_CostPerProd[0][0]        -> first cost per product of the inner list
# import an opt_results list object via pickle
pickle_file = open("GDP-Fucose_v7XGSK_PE9XGSK_Opt9d_SlctBestOptAllParams_EvoStrat_100x_allCPerP.pkl", "rb")
all_CostPerProd = pickle.load(pickle_file)
pickle_file.close()
# create pandas data frame from all costs per product list of lists
# each sublist should be one row of the resulting df
df = pd.DataFrame(all_CostPerProd)
# column names: optimization result sets O1 ... Oi
df.columns = ['O{}'.format(i+1) for i in df.columns]
# row names: parameter sets p1 ... pj
df.index = ['p{}'.format(i+1) for i in df.index]

# PLOTTING
plt.figure(figsize=(12, 9))
sns.set(font_scale=1.2)
# visualize 'df' (pandas dataframe created from 'all_CostPerProd' list of lists) as heatmap 
# (reverse default color scheme: higher values => darker color)
#cmap = sns.cm.rocket_r
#cmap = 'YlGnBu'
cmap = sns.cm.mako_r
# define axes tick labels:
#   -> indeces [0,99] shifted to [1,100]
#   -> for display tick labels: start with 1 (old 0), then 10 (old 9), 20 (old 19), 
#      etc. till 100 (old 99)
#   -> these display tick labels correspond to row ('pX') and column names ('OX') in df which 
#      are used for .loc[] based indexing (whereas .iloc[] is bosed on [0,99] python indeces)
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
snsHM = sns.heatmap(df, robust=True,
                    xticklabels = xticks,
                    yticklabels = yticks,
                    cmap=cmap)
snsHM.set(xlabel='\n Optimization Result Set ID',
          ylabel='Parameter Set ID \n')
# apply tight layout
plt.tight_layout()

# OUTPUT
# save plot as .pdf
plt.savefig("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt9d_CostPerProdHeatmap_fig.pdf")
# save plot as .png (for Word)
plt.savefig("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt9d_CostPerProdHeatmap_fig.png")
# save plot as .svg (for Word)
plt.savefig("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt9d_CostPerProdHeatmap_fig.svg")