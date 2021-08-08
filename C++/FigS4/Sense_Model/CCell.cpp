#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "string.h"
#include "time.h"
#include "iostream"

using namespace std;

#include "CCell.h"
#include "System.h"
#include "BCTool.h"
#include "Random.h"

extern CRandom Rand;
extern struct IMD _MD;
CCell::CCell()
{
}
CCell::~CCell()
{
}
void CCell::UpdateResevior()
{
  double *K11,*K21;
  //tau1
  K11=new double [tau1];
  for(int i=0;i<(_par.Tau1-1);i++)
  {
    K11[i]=V1[i+1];
  }
  K11[_par.Tau1-1]=X[2];// X_in
  for (int i = 0; i < _par.Tau1; i++)
  {
    V1[i]=K11[i];
  }
  delete K11;
  // tau2
  K21=new double [tau2];
  for (int i = 0; i < (_par.Tau2-1); i++)
  {
    K21[i]=V2[i+1];
  }
  K21[_par.Tau2-1]=X[2]; //X_in
  for(int i=0;i<_par.Tau2;i++)
  {
    V2[i]=K21[i];
  }
  delete K21;
  return ;
}
bool CCell::UpdateX_in(double dt)// Update intracelluar virus
{
  double *y,*yc,*yp;
  y=new double [5];yc=new double [5];yp=new double [5];
  for(int i=0;i<5;i++){y[i]=X[i];}

  yp[0]=y[0];
  yp[1]=y[1]+dt*(_par.k_on*(_R-y[1])*y[0]-_par.k_off*y[1]-_par.k_in*y[1]);
  yp[2]=y[2]+dt*(_par.k_in*y[1]/(_MD.v_cell)+_par.lambda1*V1[0]*_par.b1*pow(_par.K1,_par.m1)/(pow(_par.K1,_par.m1)+pow(y[4],_par.m1))-_par.q0*V2[0]-_par.d1*y[2]);
  yp[3]=y[3]+dt*(_par.lambda2*y[2]+_par.b2*pow(y[3],_par.m2)/(pow(_par.K2,_par.m2)+pow(y[3],_par.m2))-_par.d2*y[3]);
  yp[4]=y[4]+dt*(_par.lambda3*y[3]-_par.d3*y[4]);
  
  yc[0]=y[0];
  yc[1]=y[1]+dt*(_par.k_on*(_R-yp[1])*yp[0]-_par.k_off*yp[1]-_par.k_in*yp[1]);
  yc[2]=y[2]+dt*(_par.k_in*yp[1]/(_MD.v_cell)+_par.lambda1*V1[1]*_par.b1*pow(_par.K1,_par.m1)/(pow(_par.K1,_par.m1)+pow(yp[4],_par.m1))-_par.q0*V2[1]-_par.d1*yp[2]);
  yc[3]=y[3]+dt*(_par.lambda2*yp[2]+_par.b2*pow(yp[3],_par.m2)/(pow(_par.K2,_par.m2)+pow(yp[3],_par.m2))-_par.d2*yp[3]);
  yc[4]=y[4]+dt*(_par.lambda3*yp[3]-_par.d3*yp[4]);

  for(int i=0;i<5;i++){X[i]=0.5*(yc[i]+yp[i]);}
  UpdateResevior();// Update resevior
  delete y;
  delete yc;
  delete yp;
  return 1;
}
bool CCell::Initialized(int k,char fn[])
{
  ReadPar(fn);
  _cellid=k;
  _PQ=0;
  _R=Rand.GammaDistribution(_MD.alpha_0,_MD.alpha_1)*pow(10,-11);// *10^-11 nmol
  X[0]=_MD.InitialnCoV;
  X[1]=0; // initial receptpr binded with virus =0.0
  X[2]=0; // initial viral RNA=0.0
  X[3]=0.0; //initial [IFNs]=0.0
  X[4]=0.0; // initial [AVPs]=0.0
  memset(V1,0,sizeof(V1));
  memset(V2,0,sizeof(V2));
  return true;
}
Dcell CCell::CellfateDesion(float dt,double T1)
{
  double beta,eta;
  double _rand;
  _rand=Rand.Value(0,1);
  Dcell nextcell;
  beta=fInfectedrate(X[0],_R,dt);
  eta=fdeathrate(T1,dt);
  nextcell.R_max=_R;
  nextcell._PQ=_PQ;
  nextcell.X[0]=X[0];
  if(_PQ==0)
  {
    if(_rand<beta)// cell is infected
    {
      nextcell.type=1;// infected cell
      nextcell._PQ=1;
      for(int i=1;i<5;i++){nextcell.X[i]=X[i];}
      for(int i=0;i<tau1;i++){nextcell.V1[i]=V1[i];} //resevior
      for(int i=0;i<tau2;i++){nextcell.V2[i]=V2[i];}
    }
    else // cell is normal
    {
      nextcell.type=0;
      nextcell._PQ=0;
      for(int i=1;i<5;i++){nextcell.X[i]=X[i];}
      for(int i=0;i<tau1;i++){nextcell.V1[i]=V1[i];} //resevior
      for(int i=0;i<tau2;i++){nextcell.V2[i]=V2[i];}
    }
  }
  else if(_PQ==1)
  {
    if((_rand<eta))// infected cell is cleared
    {
     nextcell.type=2; //cell clear
     nextcell._PQ=0;
     nextcell.R_max=Rand.GammaDistribution(_MD.alpha_0,_MD.alpha_1)*pow(10,-11);// *10^-11 nmol
     nextcell.X[1]=0; // R^i=0
     nextcell.X[2]=0; // Viral RNA=0
     nextcell.X[3]=0.0;// IFNs=0.0nM
     nextcell.X[4]=0.0; // AVPs=0.0nM
     for(int i=0;i<tau1;i++){nextcell.V1[i]=0;} //resevior
     for(int i=0;i<tau2;i++){nextcell.V2[i]=0;}
    }
    else if(UpdateX_in(dt))
    {
      nextcell.type=3;// release virus
      nextcell._PQ=1;
      for(int i=1;i<5;i++){nextcell.X[i]=X[i];}
      for(int i=0;i<tau1;i++){nextcell.V1[i]=V1[i];} //resevior
      for(int i=0;i<tau2;i++){nextcell.V2[i]=V2[i];}
    }
  }
  return (nextcell);
}

double CCell::fInfectedrate(float virus,float R_max,float dt)
{
  double beta,theta,A;
  A=_par.k_off/_par.k_on;
  theta=pow(virus*R_max,_par.m0)/(pow(virus*R_max,_par.m0)+pow(_par.K0*(A+virus),_par.m0));
  beta=_par.beta0*theta*dt;
  return (beta);
}
double CCell::fdeathrate(double T1,float dt)
{
  double eta;
  eta=_par.eta0*T1*dt;// abnormal cell is cleared
  return eta;
}

void CCell::ReadPar(char fpar[])
{
  FILE *fp;
  char str[Strlength],*pst;
  if((fp=fopen(fpar,"r"))==NULL)
  {
    cout<<"Cannot open the cell parameter file"<<endl;
    exit(0);
  }
  rewind(fp);
  while(!feof(fp))
  {
    fgets(str,Strlength,fp);
    if(str[0]=='#'){continue;}

    if((pst=strstr(str,"lambda1="))!=NULL)
    {
      _par.lambda1=atof(pst+8);
    }
    if((pst=strstr(str,"lambda2="))!=NULL)
    {
      _par.lambda2=atof(pst+8);
    }
    if((pst=strstr(str,"lambda3="))!=NULL)
    {
      _par.lambda3=atof(pst+8);
    }
    if((pst=strstr(str,"K0="))!=NULL) 
    {
      _par.K0=atof(pst+3);
    }
    if((pst=strstr(str,"K1="))!=NULL)
    {
      _par.K1=atof(pst+3);
    }
    if((pst=strstr(str,"K2="))!=NULL)
    {
      _par.K2=atof(pst+3);
    }
    if((pst=strstr(str,"k_in="))!=NULL)
    {
      _par.k_in=atof(pst+5);
    }
    if((pst=strstr(str,"k_on="))!=NULL)
    {
      _par.k_on=atof(pst+5);
    }
    if((pst=strstr(str,"k_off="))!=NULL)
    {
      _par.k_off=atof(pst+6);
    }
    if((pst=strstr(str,"b1="))!=NULL)
    {
      _par.b1=atof(pst+3);
    }
    if((pst=strstr(str,"b2="))!=NULL)
    {
      _par.b2=atof(pst+3);
    }
    if((pst=strstr(str,"beta0="))!=NULL)
    {
      _par.beta0=atof(pst+6);
    }
    if((pst=strstr(str,"eta0="))!=NULL)
    {
      _par.eta0=atof(pst+5);
    }
    if((pst=strstr(str,"d1="))!=NULL)
    {
      _par.d1=atof(pst+3);
    }
    if((pst=strstr(str,"d2="))!=NULL)
    {
      _par.d2=atof(pst+3);
    }
    if((pst=strstr(str,"d3="))!=NULL)
    {
      _par.d3=atof(pst+3);
    }
    if((pst=strstr(str,"q0="))!=NULL)
    {
      _par.q0=atof(pst+3);
    }
    if((pst=strstr(str,"m0="))!=NULL)
    {
      _par.m0=atof(pst+3);
    }
    if((pst=strstr(str,"m1="))!=NULL)
    {
      _par.m1=atof(pst+3);
    }
    if((pst=strstr(str,"m2="))!=NULL)
    {
      _par.m2=atof(pst+3);
    }
    if((pst=strstr(str,"Tau1="))!=NULL)
    {
      _par.Tau1=atoi(pst+5);
    }
    if((pst=strstr(str,"Tau2="))!=NULL)
    {
      _par.Tau2=atoi(pst+5);
    }
  }
   fclose(fp);
}
void CCell::Outputparameter()
{
  printf("k_in=%f k_off=%f k_on=%f\n",_par.k_in,_par.k_off,_par.k_on);
  printf("lambda1=%f lambda2=%f lambda3=%f\n",_par.lambda1,_par.lambda2,_par.lambda3);
  printf("K1=%f K2=%f q0=%f\n",_par.K1,_par.K2,_par.q0);
  printf("beta0=%f K0=%f \n",_par.beta0,_par.K0);
  printf("d1=%f d2=%f d3=%f\n",_par.d1,_par.d2,_par.d3);
  printf("m1=%f m2=%f\n",_par.m1,_par.m2);
  printf("b1=%f b2=%f eta0=%f\n",_par.b1,_par.b2,_par.eta0);
}
