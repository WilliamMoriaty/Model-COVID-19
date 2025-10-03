# Model-COVID-19
Multiscale Model for SARS-CoV-2 infection
This fold includes the codes for data analysis and numerical simulation of Data-driven multi-scale mathematical modeling of SARS-CoV-2 infection reveals heterogeneity of COVID-19 patients.
1. The document "ModelSimulation" performs single-cell-based stochastic simulation. In this document, we  apply a stochastic simulation to model the progression of patients with COVID-19. SARS-CoV-2 can infect randomly target cells, replicate its RNA in host cell and produce new progeny. However, viral spreading can be stopped by IFN response in host cell and T cell cleaning.
 C++-------MultisViralinfection include all source codes
 |
 |-------- Fig3  includ the script of result in fig3
 |-------- Fig4  includ the script of result in fig4
 |-------- Fig5  includ the script of result in fig5
 |-------- Fig6  includ the script of result in fig6
 |-------- Fig7  includ the script of result in fig7
 |-------- Fig8  includ the script of result in fig8
 |-------- Fig9  includ the script of result in fig9
 |-------- FigS4  includ the script of result in figD
 |-------- FigS5  includ the script of result in figE
 |-------- FigS6 includ the script of result in figF
 |-------- FigS8  includ the script of result in figH
 |-------- FigS12  includ the script of result in figL
 |-------- FigS13  includ the script of result in figM
 |-------- FigS14 includ the script of result in figN
 |-------- FigS16  includ the script of result in figP
Usage:
In the folder, the command "compile.sh" is used to generate the execute file bct_VirusCell
The input files md.in and par.dat are edited to change the control parameter and the parameter values
The command "run.sh" dominates running of the program.
Note: Folders Sens_Model, Symptom,Code, Model and Therapy_model are similar with folder MultisViralinfection. 
Subtle differences are presented in the source codes System.cpp, BCTool.cpp and CCell.cpp.
2. The document "DataAnalysis" includes all code of presenting the figures in result section and Supplimentary documentary.  
Some running codes need data from the C++ codes running. The operating procedures refers to the file "readme.txt".
3. The document "Datasets" includes all real datasets from published literatures. Many details are in the main text.
<img width="10229" height="4733" alt="Fig2" src="https://github.com/user-attachments/assets/5750e5bb-3d6f-494b-8b56-94fb8b88c66b" />

