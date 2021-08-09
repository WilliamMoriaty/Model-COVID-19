#ifndef BCTOOL_H
#define BCTOOL_H

#define Comlength 100
#define Strlength 1024
#define UnitMAX 2147483574
#define NUMVAR 1
#define MaxCellNumber 100000
#define tau3 7200 //72h
#define tau1 100 //0~1.0h
#define tau2 200 //0~2.0h 
struct IMD
{
  float dt;// step time
  float T; // simulation time
  float InitialnCoV;// Initial virus concentration
  int ntpx; // control step
  char mdcrd[Comlength];
  char cellpar[Comlength];
  int seed; //Random seed
  int N0; //simulation cell
  double alpha_0; // GammaDistribution shape parameter
  double alpha_1;// GammaDistribution scale parameter
  float xi;// symptom threshold
  double v_cell;// v_cell/v_ex
  double v_ex;// v_ex
  double K3;// EC50 of cytokine
  double K4;// exhuastion
  double mu_1;// cytokine to T cell
  double mu_2;// Infected cell release cytokine
  double mu_3;//  T cell release cytokine
  double d4;// virus clear
  double d5; // T basic death
  double d6; // cytokine degradation
  double T0;// Naive T cell number
  double m3;// Hill coefficient of cytokine
  double m4; // Hill coefficient of exhaustion
  double rho;// T Cell Exhaustion 
};
struct Dcell
{
  int type;// 0:unchange
            //1: cell Infected
            //2: cell clear
            //3: release virus
  int _PQ;// Infect:1,unInfect:0
  double R_max; //receptor max number
  double X[5];// X[0]:X_ex;X[1]:R;X[2]:X_in;X[3]:IFNs;X[4]:AVPs
  double V1[tau1];
  double V2[tau2];
};
struct ApdatedImmune
{
  double Effector_T;
  double Cytokine;
  double CYT[tau3];//accumulation
  int signal;// 0:adaptive immune + innate immune;1: T exhaustion;2:treatment; 
};

#endif