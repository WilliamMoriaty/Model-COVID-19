Readme:
 This fold includes the codes (Matlab, C++，Mathematica and R programing) used for data analysis and numerical simulation of Data-driven multi-scale mathematical modeling of SARS-CoV-2 infection reveals heterogeneity of COVID-19 patients.
1. The C++ code to perform single-cell-based stochastic simulation. In this code, we  apply a stochastic simulation to model the progression of patients with COVID-19. SARS-CoV-2 can infect randomly target cells, replicate its RNA in host cell and produce new progeny. However, viral spreading can be stopped by IFN response in host cell and T cell cleaning.
 C++-------MultisViralinfection include all source codes
 |
 |-------- Fig4  includ the script of result in fig4
 |-------- Fig5  includ the script of result in fig5
 |-------- Fig6  includ the script of result in fig6
 |-------- Fig7  includ the script of result in fig7
 |-------- Fig8  includ the script of result in fig8
Usage:
In the folder MultisViralinfection use the command sh compile.sh to generate the execute file bct_VirusCell
In the folders Fig4, Fig5, Fig6, Fig7 and Fig8, edit the input files md.in and par.dat to change the control parameter and the parameter values, and use run.sh to run the program.
Note: Folders Sens_Model Symptom and Therapy_model are similar with folder MultisViralinfection. Subtle differences are presented in the source codes System.cpp and CCell.cpp.
2. The Matlabe code to present the figures in result section and Supplimentary documentary.  Some running codes need data from the C++ codes running. The other is in Datasets.
3. The R code to analyze the single-cell mRNA expression levels (Dataset 5).
Note:
In the folder Dataset 5, the need for running code is the data covid_nbt_main.rds (Download https://figshare.com/articles/COVID-19_severity_correlates_with_airway_epithelium-immune_cell_interactions_identified_by_single-cell_analysis/12436517)  
4. The Mathematica code to present the threshold effect between infection rate and receptor proteins.

