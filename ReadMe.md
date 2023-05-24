# Model-based Optimization of Cell-free Enzymatic Cascades Under Uncertainty Exemplified for the Production of GDP-Fucose - Data Repository

## Introduction
This repository contains all files necessary to reproduce the findings of the publication [Model-based Optimization of Cell-free Enzymatic Cascades Under Uncertainty Exemplified for the Production of GDP-Fucose](https://github.com/klamt-lab/GDP-Fucose_OptMet2023_Paper#publication) and is organized according to the structure of the presented results: (1) model building including the creation of an ensemble of kinetic model parameters via repeated global parameter estimation and model-based optimization in order to (2) maximize the product titer (objective O1), (3) minimize the enzyme load (objective O3), and (4) minimize the normalized process costs (objective O6).

All relevant files for each result (1 - 4) are stored in separate directories with the following contents: [COPASI](https://copasi.org) files (.cps) which contain the model description and also define the specific task to be calculated (such as parameter estimations or other optimizations), experimental data files (.txt) of time course measurements, Python scripts (.py) for the calculation and visualization of the specified tasks, comma-separated value (.csv) or Python-specific pickle (.pkl) files for storing calculation results, and files of the resulting figures stored as PDF, PNG, and as vector graphics (.svg).

## Requirements
The script files have been written and tested using Python 3.8.3 as well as the following additional packages: [numpy](https://numpy.org/install/) 1.24.2, [pandas](https://pandas.pydata.org/pandas-docs/stable/getting_started/install.html) 1.5.3, [copasi-basico](https://github.com/copasi/basico#installation) 0.47, [tqdm](https://tqdm.github.io/) 4.47.0, [matplotlib](https://pypi.org/project/matplotlib/) 3.7.0, and [seaborn](https://seaborn.pydata.org/installing.html) 0.12.2. [Installing COPASI](http://copasi.org/Download/) is not necessary to reproduce the results of this work since its Python API *basiCO* is handeling all calculations. However, COPASI can be used as a convenient tool for inspecting the model files.

## The COPASI File Format
COPASI model files (.cps) can be regarded as extended [SBML](https://sbml.org) files since they contain all information of a standard SBML file (basic model properties) while also including additional information on specified tasks, plots, and report files. COPASI files can be opened with a text editor to reveal the underlying SBML-like tree structre and every .cps file can be saved as an SBML file which will then contain all defining properties of the model but not any task or plotting information. More information on the compatibility between the COPASI and SBML file formats can be found [here](http://copasi.org/Support/User_Manual/Importing_and_Exporting/Importing_and_Exporting_SBML_Files/).

## Notes on the Python Script Files
All python scripts make use of [basiCO](https://github.com/copasi/basico), a simplified COPASI Python API, which requires each task to be set in a model file. Therefore, separate COPASI model files were created for each task. However, they *only* differ in the specific task that they define. The basic model with respect to all of its defining properties (species, reactions, rate laws, and events) is the same in all COPASI files. Furthermore, any initial concentrations of substrates and enzymes which are set in the model files are overwritten by the respective calculation scripts which redefine them according to the specifications of the given task. Each Python script is only reliant on the packages which are imported at the beginning of the file (no additional custom functions) and all scripts are designed to be run from top to bottom. The order of execution for the different script files in each directory as well as the interdependency between them is denoted via their alphabetical identifiers detailed in the sections below.

## Result Directories
In order to reproduce the output files navigate to the directories described below and use the installed Python interpreter to run the script files in the designated order.

### 1. Generation of an Ensemble of Kinetic Model Parameter Sets
The global parameter estimation is set in the COPASI model file and includes all experimental data files in the directory (experiments 1-5). The *calculation script a* repeats the parameter estimation 100 times. The resulting 100 parameter sets are stored in a .csv file which is read by the *visualization script a* to generate the histogram multiplot figure. *Calculation script b* also reads the parameter estimation output and uses the model file set to baseline initial concentrations to create time course simulations for each parameter set. The time courses are then visualized together with data of the baseline experiment via *visualization script b*.

| File Type                 | File Name                                                                                                                                                           |
|---------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| COPASI model file:        | [GDP-Fucose_v7XGSK_with_PE9XGSK_setup.cps](parameter_ensemble/GDP-Fucose_v7XGSK_with_PE9XGSK_setup.cps)                                                             |
| Experimental data file 1: | [2022_11_08_FE13_for_model_fiting.txt](parameter_ensemble/2022_11_08_FE13_for_model_fiting.txt)                                                                     |
| Experimental data file 2: | [2022_11_17_FE17_for_model_fiting_1FKP.txt](parameter_ensemble/2022_11_17_FE17_for_model_fiting_1FKP.txt)                                                           |
| Experimental data file 3: | [2022_11_17_FE17_for_model_fiting_07FKP.txt](parameter_ensemble/2022_11_17_FE17_for_model_fiting_07FKP.txt)                                                         |
| Experimental data file 4: | [2022_11_24_FE18_for_model_fiting_1FKP.txt](parameter_ensemble/2022_11_24_FE18_for_model_fiting_1FKP.txt)                                                           |
| Experimental data file 5: | [2022_11_24_FE18_for_model_fiting_07FKP.txt](parameter_ensemble/2022_11_24_FE18_for_model_fiting_07FKP.txt)                                                         |
| Calculation script a):    | [rand_param_sampling.py](parameter_ensemble/rand_param_sampling.py)                                                                                                 |
| Calculation script b):    | [calc_time_courses_InitFE18_07FKP.py](parameter_ensemble/calc_time_courses_InitFE18_07FKP.py)                                                                       |
| Calculation output a):    | [sampling_output_EvoStrat_100runs.csv](parameter_ensemble/sampling_output_EvoStrat_100runs.csv)                                                                     |
| Calculation output b):    | [GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCSimResults_InitFE18_07FKP.pkl](parameter_ensemble/GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCSimResults_InitFE18_07FKP.pkl) |
| Visualization script a):  | [visualize_params.py](parameter_ensemble/visualize_params.py)                                                                                                       |
| Visualization script b):  | [visualize_time_courses_InitFE18_07FKP.py](parameter_ensemble/visualize_time_courses_InitFE18_07FKP.py)                                                             |
| Visualization output a):  | [GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Params_fig](parameter_ensemble/GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Params_fig.svg)                                       |
| Visualization output b):  | [GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCs_InitFE18_07FKP_fig](parameter_ensemble/GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCs_InitFE18_07FKP_fig.svg)               |

### 2. Model-based Optimization According to Objective O1 (Maximize Titer)
The optimization is set in the COPASI model file. The *calculation script a* sets the model to the parameter sets of the ensemble and repeats the optimization for each set (100 optimization runs in total). The result is stored in a pickle file which is read by the *visualization script a* to create the box plot / scatterplot figure. *Calculation script b* reads the model file, the optimization output, and the parameter ensemble in order to perform the cross-validation and subsequent scoring. The result of the cross-validation is stored in a pickle file and read by *visualization script b* to produce the heatmap figure. *Calculation script c* compares the validation experiment to simulations of the model ensemble and the simulation result is stored in a pickle file which is read by *visualization script c* to create the validation time courses figure.

| File Type                 | File Name                                                                                                                                                                          |
|---------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| COPASI model file:        | [GDP-Fucose_v7XGSK_PE9XGSK_with_Opt7b_setup.cps](optimization_O1/GDP-Fucose_v7XGSK_PE9XGSK_with_Opt7b_setup.cps)                                                                   |
| Calculation script a):    | [Opt7b_calc.py](optimization_O1/Opt7b_calc.py)                                                                                                                                     |
| Calculation script b):    | [select_best_Opt7b_for_all_param_sets_calc.py](optimization_O1/select_best_Opt7b_for_all_param_sets_calc.py)                                                                       |
| Calculation script c):    | [calc_time_courses_InitFE20_Val1_Opt7b_O53.py](optimization_O1/calc_time_courses_InitFE20_Val1_Opt7b_O53.py)                                                                       |
| Calculation output a):    | [GDP-Fucose_v7XGSK_PE9XGSK_Opt7b_RandParamSampl_EvoStrat100x_list_res_stats.pkl](optimization_O1/GDP-Fucose_v7XGSK_PE9XGSK_Opt7b_RandParamSampl_EvoStrat100x_list_res_stats.pkl)   |
| Calculation output b):    | [GDP-Fucose_v7XGSK_PE9XGSK_Opt7b_SlctBestOptAllParams_EvoStrat_100x_allTit.pkl](optimization_O1/GDP-Fucose_v7XGSK_PE9XGSK_Opt7b_SlctBestOptAllParams_EvoStrat_100x_allTit.pkl)     |
| Calculation output c):    | [GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCSimResults_InitFE20_Val1_Opt7b_O53.pkl](optimization_O1/GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCSimResults_InitFE20_Val1_Opt7b_O53.pkl) |
| Visualization script a):  | [Opt7b_vis.py](optimization_O1/Opt7b_vis.py)                                                                                                                                       |
| Visualization script b):  | [select_best_Opt7b_for_all_param_sets_vis.py](optimization_O1/select_best_Opt7b_for_all_param_sets_vis.py)                                                                         |
| Visualization script c):  | [visualize_time_courses_InitFE20_Val1_Opt7b_O53.py](optimization_O1/visualize_time_courses_InitFE20_Val1_Opt7b_O53.py)                                                             |
| Visualization output a):  | [GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt7b_BoxScatterPlot_fig](optimization_O1/GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt7b_BoxScatterPlot_fig.svg)                             |
| Visualization output b):  | [GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt7b_TiterHeatmap_fig](optimization_O1/GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt7b_TiterHeatmap_fig.svg)                                 |
| Visualization output c):  | [GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCs_InitFE20_Val1_fig](optimization_O1/GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCs_InitFE20_Val1_fig.svg)                                   |

### 3. Model-based optimization according to objective O3 (Minimize Enzyme Load)
The optimization is set in the COPASI model file. The *calculation script a* sets the model to the parameter sets of the ensemble and repeats the optimization for each set (100 optimization runs in total). The result is stored in a pickle file which is read by the *visualization script a* to create the box plot / scatterplot figure. *Calculation script b* reads the model file, the optimization output, and the parameter ensemble in order to perform the cross-validation and subsequent scoring. The result of the cross-validation is stored in two pickle files (b1 and b2) and both are read by *visualization script b* to produce the heatmap figure. *Calculation script c* compares the validation experiment to simulations of the model ensemble and the simulation result is stored in a pickle file which is read by *visualization script c* to create the validation time courses figure.

| File Type                   | File Name                                                                                                                                                                      |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| COPASI model file:          | [GDP-Fucose_v7XGSK_PE9XGSK_with_Opt8bMW_setup.cps](optimization_O3/GDP-Fucose_v7XGSK_PE9XGSK_with_Opt8bMW_setup.cps)                                                           |
| Calculation script a):      | [Opt8bMW_calc.py](optimization_O3/Opt8bMW_calc.py)                                                                                                                             |
| Calculation script b):      | [select_best_Opt8bMW_for_all_param_sets_calc.py](optimization_O3/select_best_Opt8bMW_for_all_param_sets_calc.py)                                                               |
| Calculation script c):      | [calc_time_courses_InitFE20_Val2_Opt8bMW_O88.py](optimization_O3/calc_time_courses_InitFE20_Val2_Opt8bMW_O88.py)                                                               |
| Calculation output a):      | [GDP-Fucose_v7XGSK_PE9XGSK_Opt8bMW_EvoStrat100x_res_stats.pkl](optimization_O3/GDP-Fucose_v7XGSK_PE9XGSK_Opt8bMW_EvoStrat100x_res_stats.pkl)                                   |
| Calculation output b1):     | [GDP-Fucose_v7XGSK_PE9XGSK_Opt8bMW_SlctBstOptAllPar_EvoStrat100x_allEtotMW.pkl](optimization_O3/GDP-Fucose_v7XGSK_PE9XGSK_Opt8bMW_SlctBstOptAllPar_EvoStrat100x_allEtotMW.pkl) |
| Calculation output b2):     | [GDP-Fucose_v7XGSK_PE9XGSK_Opt8bMW_SlctBstOptAllPar_EvoStrat100x_allTit.pkl](optimization_O3/GDP-Fucose_v7XGSK_PE9XGSK_Opt8bMW_SlctBstOptAllPar_EvoStrat100x_allTit.pkl)       |
| Calculation output c):      | [GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCSRes_InitFE20_Val2_Opt8bMW_O88.pkl](optimization_O3/GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCSRes_InitFE20_Val2_Opt8bMW_O88.pkl)     |
| Visualization script a):    | [Opt8bMW_vis.py](optimization_O3/Opt8bMW_vis.py)                                                                                                                               |
| Visualization script b):    | [select_best_Opt8bMW_for_all_param_sets_vis.py](optimization_O3/select_best_Opt8bMW_for_all_param_sets_vis.py])                                                                |
| Visualization script c):    | [visualize_time_courses_InitFE20_Val2_Opt8bMW_O88.py](optimization_O3/visualize_time_courses_InitFE20_Val2_Opt8bMW_O88.py)                                                     |
| Visualization output a):    | [GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt8bMW_BoxScatterPlot_fig](optimization_O3/GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt8bMW_BoxScatterPlot_fig.svg)                     |
| Visualization output b):    | [GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt8bMW_EtotMWTiterHM_fig](optimization_O3/GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt8bMW_EtotMWTiterHM_fig.svg)                       |
| Visualization output c):    | [GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCs_InitFE20_Val2_fig](optimization_O3/GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_TCs_InitFE20_Val2_fig.svg)                               |

### 4. Model-based optimization according to objective O6 (Minimize Normalized Costs)
The optimization is set in the COPASI model file. The *calculation script a* sets the model to the parameter sets of the ensemble and repeats the optimization for each set (100 optimization runs in total). The result is stored in a pickle file which is read by the *visualization script a* to create the box plot / scatterplot figure. *Calculation script b* reads the model file, the optimization output, and the parameter ensemble in order to perform the cross-validation and subsequent scoring. The result of the cross-validation is stored in a pickle file and read by *visualization script b* to produce the heatmap figure.

| File Type                 | File Name                                                                                                                                                                          |
|---------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| COPASI model file:        | [GDP-Fucose_v7XGSK_PE9XGSK_with_Opt9d_setup.cps](optimization_O6/GDP-Fucose_v7XGSK_PE9XGSK_with_Opt9d_setup.cps)                                                                   |
| Calculation script a):    | [Opt9d_calc.py](optimization_O6/Opt9d_calc.py)                                                                                                                                     |
| Calculation script b):    | [select_best_Opt9d_for_all_param_sets_calc.py](optimization_O6/select_best_Opt9d_for_all_param_sets_calc.py)                                                                       |
| Calculation output a):    | [GDP-Fucose_v7XGSK_PE9XGSK_Opt9d_RandParamSampl_EvoStrat100x_list_res_stats.pkl](optimization_O6/GDP-Fucose_v7XGSK_PE9XGSK_Opt9d_RandParamSampl_EvoStrat100x_list_res_stats.pkl)   |
| Calculation output b):    | [GDP-Fucose_v7XGSK_PE9XGSK_Opt9d_SlctBestOptAllParams_EvoStrat_100x_allCPerP.pkl](optimization_O6/GDP-Fucose_v7XGSK_PE9XGSK_Opt9d_SlctBestOptAllParams_EvoStrat_100x_allCPerP.pkl) |
| Visualization script a):  | [Opt9d_vis.py](optimization_O6/Opt9d_vis.py)                                                                                                                                       |
| Visualization script b):  | [select_best_Opt9d_for_all_param_sets_vis.py](optimization_O6/select_best_Opt9d_for_all_param_sets_vis.py)                                                                         |
| Visualization output a):  | [GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt9d_BoxScatterPlot_fig](optimization_O6/GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt9d_BoxScatterPlot_fig.svg)                             |
| Visualization output b):  | [GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt9d_CostPerProdHeatmap_fig](optimization_O6/GDP-Fucose_v7XGSK_PE9XGSK_EvoStrat100x_Opt9d_CostPerProdHeatmap_fig.svg)                     |

TODO: add validation data to this optimization once it's available

## Publication
Huber, Alcalá-Orozco, Rexer, Reichl, Klamt (2023), *not yet submitted*