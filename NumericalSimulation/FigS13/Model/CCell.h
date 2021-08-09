#ifndef CELL_H
#define CELL_H

#include "BCTool.h"
#define tau1 50 // virus replication tau1=0.5h
#define tau2 100 // virus budding tau1=1.0h
struct Cellpara
{
  double beta0,K0,q0;
  double k_in,k_on,k_off;
  double lambda1,lambda2,lambda3;
  double b1,b2;
  double d1,d2,d3;
  double m0,m1,m2;
  double K1,K2;
  double eta0;
};
class CCell
{
private:
  int _cellid;
  double _R;// max receptor number
  int _PQ;// _PQ=1 cell is infected;_PQ=0 cell is not infected
  double X[5];// X[0]:X_ex;X[1]:R;X[2]:X_in;X[3]:IFNs;X[4]:AVPs
  double V1[tau1];// virus replcation tau1=0.5h
  double V2[tau2];// virus budding tau2=1.0h
  Cellpara _par;
public:
  CCell();
  ~CCell();
  Dcell CellfateDesion(float dt,double T1);
  bool UpdateX_in(double t);
  bool Initialized(int k,char fn[]);
  double VirusInitalized(int k);
  void ReadPar(char fpar[]);
  void Outputparameter();
  double fInfectedrate(float virus,float R_max,float dt);
  double fdeathrate(double T1,float dt);
  void UpdateResevior();
  friend class System;
};


#endif