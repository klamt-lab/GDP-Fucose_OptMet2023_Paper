#!/usr/bin/env python
# -*- coding: utf-8 -*-

""" Visualization of the ensemble of estimated parameters via a multiplot of histograms (5 x 6 plots).
"""

import math
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.ticker as tckr
import pandas as pd
import seaborn as sns

# ENSEMBLE DATA
# read the parameter ensemble data
# (the first column is all zeros, parameter columns start at .iloc[:,1])
fits_data = pd.read_csv('sampling_output_EvoStrat_100runs.csv')
# rename and store new column names
repl_dict = {'(FKP (fucokinase)).kcat_F':               'FKP (fk) $k_{cat,F}$',
             '(FKP (fucokinase)).Km_Fuc':               'FKP (fk) $K_{m,Fucose}$',
             '(FKP (fucokinase)).Km_ATP':               'FKP (fk) $K_{m,ATP}$',
             '(FKP (fucokinase)).Km_Fuc1P':             'FKP (fk) $K_{m,Fucose1P}$',
             '(FKP (fucokinase)).Km_ADP':               'FKP (fk) $K_{m,ADP}$',
             '(FKP (guanylyltransferase)).kcat_F':      'FKP (gt) $k_{cat,F}$',
             '(FKP (guanylyltransferase)).Km_Fuc1P':    'FKP (gt) $K_{m,Fucose1P}$',
             '(FKP (guanylyltransferase)).Km_GTP':      'FKP (gt) $K_{m,GTP}$',
             '(FKP (guanylyltransferase)).Km_GDP_Fuc':  'FKP (gt) $K_{m,GDPFucose}$',
             '(FKP (guanylyltransferase)).Km_PP':       'FKP (gt) $K_{m,PP}$',
             '(FKP (guanylyltransferase)).ki_PP':       'FKP (gt) $k_{i,PP}$',
             '(PPA).kcat_F':                            'PPA $k_{cat,F}$',
             '(PPA).Km_PP':                             'PPA $K_{m,PP}$',
             '(GMPK).kcat_F':                           'GMPK $k_{cat,F}$',
             '(GMPK).Km_GMP':                           'GMPK $K_{m,GMP}$',
             '(GMPK).Km_ATP':                           'GMPK $K_{m,ATP}$',
             '(GMPK).Km_GDP':                           'GMPK $K_{m,GDP}$',
             '(GMPK).Km_ADP':                           'GMPK $K_{m,ADP}$',
             '(PPK3_G).kcat_F':                         'PPK3G $k_{cat,F}$',
             '(PPK3_G).Km_GDP':                         'PPK3G $K_{m,GDP}$',
             '(PPK3_G).Km_GTP':                         'PPK3G $K_{m,GTP}$',
             '(PPK3_G).K_eq_PPK3_G':                    'PPK3G $K_{eq}$',
             '(PPK3_A).kcat_F':                         'PPK3A $k_{cat,F}$',
             '(PPK3_A).Km_ADP':                         'PPK3A $K_{m,ADP}$',
             '(PPK3_A).Km_ATP':                         'PPK3A $K_{m,ATP}$',
             '(PPK3_A).K_eq_PPK3_A':                    'PPK3A $K_{eq}$',
             'obj_val':                                 'SSR'}
fits_data.rename(repl_dict, axis=1, inplace=True)
fits_data_cols = fits_data.columns
# create list of literature values (they were used as start values of the fits; if no literature value was available 0.1 was used as start value as it is the COPASI default parameter value)
# same order as columns in fits_data data frame; 0 means no lit. value was available:
# [(FKP (fucokinase)).kcat_F,(FKP (fucokinase)).Km_Fuc,(FKP (fucokinase)).Km_ATP,(FKP (fucokinase)).Km_Fuc1P,(FKP (fucokinase)).Km_ADP,(FKP (guanylyltransferase)).kcat_F,(FKP (guanylyltransferase)).Km_Fuc1P,(FKP (guanylyltransferase)).Km_GTP,(FKP (guanylyltransferase)).Km_GDP_Fuc,(FKP (guanylyltransferase)).Km_PP,(FKP (guanylyltransferase)).ki_PP,(PPA).kcat_F,(PPA).Km_PP,(GMPK).kcat_F,(GMPK).Km_GMP,(GMPK).Km_ATP,(GMPK).Km_GDP,(GMPK).Km_ADP,(PPK3_G).kcat_F,(PPK3_G).Km_GDP,(PPK3_G).Km_GTP,(PPK3_G).K_eq_PPK3_G,(PPK3_A).kcat_F,(PPK3_A).Km_ADP,(PPK3_A).Km_ATP,(PPK3_A).K_eq_PPK3_A,obj_val]; last 0 entry is for obj. value plot
lit_vals = [1404, 0.045, 1.08, 0, 0, 36252, 0.03295, 0.012, 0.12, 0.135, 0, 558000, 0.003, 752400, 0.156, 0.5, 0.097, 0.017, 15048, 1.2, 0, 1, 18780, 2.5, 2, 1, 0]

# MULTIPLOT HISTOGRAMS
# set multiplot size and define layout of subplots (30 subplots: 5 rows, 6 columns)
fig, ax = plt.subplots(5, 6, constrained_layout=True, 
                       figsize=(16, 12), dpi=200)
# define histogram options for each subplot (27 subplots)
# 'log' -> log10(x-axis values), 'binNum' and 'binSize' set to 0 as placeholder value (these options are currently not used for plotting)
hists_opts = [{'id': 'FKPfkkcatF',      'log': True,    'binNum': 0,'binSize': 0},
              {'id': 'FKPfkKmFuc',      'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'FKPfkKmATP',      'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'FKPfkKmFuc1P',    'log': True,    'binNum': 0,'binSize': 0},
              {'id': 'FKPfkKmADP',      'log': True,    'binNum': 0,'binSize': 0},
              {'id': 'FKPgtkcatF',      'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'FKPgtKmFuc1P',    'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'FKPgtKmGTP',      'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'FKPgtKmGDPFuc',   'log': True,    'binNum': 0,'binSize': 0},
              {'id': 'FKPgtKmPP',       'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'FKPgtkiPP',       'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'PPAkcatF',        'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'PPAKmPP',         'log': True,    'binNum': 0,'binSize': 0},
              {'id': 'GMPKkcatF',       'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'GMPKKmGMP',       'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'GMPKKmATP',       'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'GMPKKmGDP',       'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'GMPKKmADP',       'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'PPK3GkcatF',      'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'PPK3GKmGDP',      'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'PPK3GKmGTP',      'log': True,    'binNum': 0,'binSize': 0},
              {'id': 'PPK3GKeq',        'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'PPK3AkcatF',      'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'PPK3KmADP',       'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'PPK3AKmATP',      'log': True,    'binNum': 0,'binSize': 0},
              {'id': 'PPK3AKeq',        'log': False,   'binNum': 0,'binSize': 0},
              {'id': 'SSR',             'log': False,   'binNum': 0,'binSize': 0}]
# set tight layout to avoid overlap of subplot titles and x axis tick lables
#fig.tight_layout()
# draw individual 1D scatter charts
n = 0
for i in range(5):
    for j in range(6):
        # len-2 because two cols in fits_data are no param cols (first and last)
        if n <= len(fits_data.columns)-2:
            # select a parameter column: values and it's name
            # exclude first col in fits_data because it is not a param col;
            vals = list(fits_data.iloc[:,n+1])
            name = fits_data_cols[n+1]
            # plot estimated parameter values as histogram (kde = kernel density estimate, provides information about the shape of the distribution)
            sns.histplot(data=fits_data, x=name, ax=ax[i,j],
                         kde=False, log_scale=hists_opts[n]['log'])
            # draw vertical line for literature value (if one was available)
            if lit_vals[n] != 0:
                ax[i,j].axvline(x=lit_vals[n], ymin=0, ymax=100,
                                color='r', alpha=0.75, linestyle='-')
            # change notation of x axis tick labels to scientific (exponential) notation when the numbers are outsite [1e-5,1e5] AND subplot x-axis is NOT log'ed!
            if hists_opts[n]['log'] != True:
                mf = tckr.ScalarFormatter(useMathText=True)
                mf.set_powerlimits((-5,5))
                ax[i,j].xaxis.set_major_formatter(mf)
            # remove axis labels
            ax[i,j].set(xlabel='',ylabel='')
            # change size of x axis and y axis tick labels
            ax[i,j].tick_params(axis='x', labelsize=12)
            ax[i,j].tick_params(axis='y', labelsize=12)
            # set parameter name as title
            ax[i,j].set_title(name, fontsize=16)
            n = n+1
        else:
            # only use the necessary subplots
            ax[i, j].axis('off')

# OUTPUT
# save plot as .pdf
plt.savefig("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Params_fig.pdf")
# save plot as .png (for Word)
plt.savefig("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Params_fig.png")
# save plot as .svg (for Word)
plt.savefig("GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Params_fig.svg")