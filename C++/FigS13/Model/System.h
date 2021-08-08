#ifndef SYSTEM_H
#define SYSTEM_H
#include "CCell.h"
#include "BCTool.h"


class System
{
private:
  int NumPoolCell; //simulation cell number
  double nCoV;// virus concentration
  double t1;// time of symptom presentation 
  double omega;//the beginning of T exhaustion
  double omega1;//the end of T exhaustion
  int _N0,_N1,_N2,_N3;//_N0:normal cell;_N1:infected cell;_N2:cleared cell;_N3:cell releasing virus
  CCell *_cell;
  ApdatedImmune AI; //Adapated Immune to virus
public:
  System();
  ~System();
  System(int N0); //Initialized system
  CCell& operator()(int indx); // Edit to return the type of your own class.
  bool Initialized();// Initialize parameter
  void OutPutCells(double t); // output cell result
	void OutPutSys(int step); // output system result
	void Run();
  void UpdateX_ex(double dt);// Update X_ex
  Dcell nextcell;
  bool SystemUpdate(double dt);// Update system
  ApdatedImmune Update_ApdatImmune(int N0,double dt);// Update IL6,activated T cell
  double delta_exhaust(int signal);// exhaustion rate
  ApdatedImmune Accumulate_CYT(int signal,int length);// CYT(tau)
  double NumerialIntegrate(int length); // 
  friend class CCell;

};




#endif