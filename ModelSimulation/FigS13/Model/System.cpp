#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "string.h"
#include "time.h"
#include "iostream"
using namespace std;

#include "BCTool.h"
#include "CCell.h"
#include "Random.h"
#include "System.h"

extern struct IMD _MD;
extern CRandom Rand;
System::System()
{
}

System::~System()
{
}
System::System(int N0)
{
  NumPoolCell=N0;
  nCoV=_MD.InitialnCoV;
  _cell=new CCell[MaxCellNumber];
  AI.Cytokine=0;
  AI.Effector_T=0;
  AI.signal=0;
  memset(AI.CYT,0,sizeof(AI.CYT));
}
bool System::Initialized()
{
  int k;
  k=1;
  do
  {
    if((*this)(k).Initialized(k,_MD.cellpar))
    {
      k++;
    }
    else
    {
    }
  } while (k<=MaxCellNumber);
  return (1);
}
void System::Run()
{
  double t;
  int step;
  int k;
  FILE *fmdsysm;
  char fn[Comlength];
  sprintf(fn,"%s.dat",_MD.mdcrd);
  if((fmdsysm=fopen(fn,"w"))==NULL)
  {
    cout<<"Cannot open the input file"<<endl;
    exit(0);
  }
  step=0;omega1=720.0;t1=-1; //30 day=720h t1:characterize incubation
  //omega=Rand.Value(120.0,240.0);// period after T exhaustion 5~10 day
  OutPutSys(step);
  _N0=NumPoolCell;_N1=0;_N2=0;_N3=0;
  for(t=0;t<=_MD.T;t=t+_MD.dt)
  {
    step=step+1;
    fprintf(fmdsysm,"%6.4f %6.4f %6.4f %6.4f %d %d %d %d\n",t,nCoV,AI.Cytokine,AI.Effector_T/pow(10,5),_N0,_N1,_N2,_N3); //output system result
    if(SystemUpdate(_MD.dt))
    {
      Accumulate_CYT(AI.signal,tau);// accumulate cytokine effect
      UpdateX_ex(_MD.dt); // Update X_ex
      Update_ApdatImmune(_N3,_MD.dt); // Update immune environment
      nCoV=(*this)(1).X[0];// number of cell from 1 to NumberPoolcell
      if((_MD.ntpx>0)&&(step%_MD.ntpx==0))
      {
        //OutPutSys(step);// output intracelluar virus
        //fprintf(fmdsysm,"%f %f %f %f %d %d %d\n",t,nCoV,AI.IL6,AI.T1/100000.0,_N0,_N1,_N2); //output system result
      }
      if(nCoV<0){break;}

      if(AI.signal==0&&t1>0)
      {
        AI.signal=1;// begining of T exhaustion
      }
      else if(AI.signal==0) //xi symptom presentation
      {
       if(_N3>=(int)NumPoolCell*_MD.xi)
       {
         t1=t;
       }
      }
      else if(AI.signal==1)
      {
       if((step*_MD.dt)>omega1)
       {
        AI.signal=2;// begining of treatment
       }
      }
    }
  }
  fclose(fmdsysm);
  return ; 
}

bool System::SystemUpdate(double dt)
{
  int k;
  int *PQ;
  double *R;// ACE2
  double *Y1; // X_ex
  double *Y2; //R 
  double *Y3;//X_in
  double *Y4;// IFNs
  double *Y5;// AVPs

  int Ntemp;

  R=new double[NumPoolCell+1];
  PQ=new int[NumPoolCell+1];
  Y1=new double[NumPoolCell+1];
  Y2=new double [NumPoolCell+1];
  Y3=new double [NumPoolCell+1];
  Y4=new double [NumPoolCell+1];
  Y5=new double [NumPoolCell+1];
  
  double (*Y6)[tau1]=new double [NumPoolCell+1][tau1];// (*this)(k).V1
  double (*Y7)[tau2]=new double [NumPoolCell+1][tau2]; // (*this)(k).V2
  Ntemp=0;
  _N0=0; // normal cell
  _N1=0; // infected cell
  _N2=0;// cleared cell
  _N3=0;// release virus
  for(k=1;k<=NumPoolCell;k++)
  {
    nextcell=(*this)(k).CellfateDesion(dt,AI.Effector_T);
    switch(nextcell.type)
    {
      case 0: //normal cell
        Ntemp++;
        _N0++;
        break;
      case 1: //cell is infected
        _N1++;
        Ntemp++;
        break; 
      case 2: // cell clear and replaced new normal cell
        Ntemp++;
        _N2++;
        break;
      case 3: // cell release virus
        Ntemp++;
        _N3++;
        break;
    }
    R[Ntemp]=nextcell.R_max;
    PQ[Ntemp]=nextcell._PQ;
    Y1[Ntemp]=nextcell.X[0];
    Y2[Ntemp]=nextcell.X[1];
    Y3[Ntemp]=nextcell.X[2];
    Y4[Ntemp]=nextcell.X[3];
    Y5[Ntemp]=nextcell.X[4];
    for(int i=0;i<tau1;i++){Y6[Ntemp][i]=nextcell.V1[i];}
    for(int j=0;j<tau2;j++){Y7[Ntemp][j]=nextcell.V2[j];}
  }
  for(k=1;k<=Ntemp;k++)
  {
    (*this)(k)._PQ=PQ[k];
    (*this)(k)._R=R[k];
    (*this)(k).X[0]=Y1[k];
    (*this)(k).X[1]=Y2[k];
    (*this)(k).X[2]=Y3[k];
    (*this)(k).X[3]=Y4[k];
    (*this)(k).X[4]=Y5[k];
    for(int i=0;i<tau1;i++){(*this)(k).V1[i]=Y6[k][i];}
    for(int j=0;j<tau2;j++){(*this)(k).V2[j]=Y7[k][j];}
  }

  delete R;
  delete PQ;

  delete Y1;
  delete Y2;
  delete Y3;
  delete Y4;
  delete Y5;
  delete Y6;
  delete Y7;
  return 1;
}
void System::OutPutSys(int step)
{
  FILE *fp;
  int k;
  char fnc[Strlength];
  sprintf(fnc,"%s-%d.dat",_MD.mdcrd,step);

  if((fp=fopen(fnc,"w"))==NULL)
  {
    cout<<"Cannot open the fmdy file"<<endl;
    exit(0);
  }
  for(int k=1;k<=NumPoolCell;k++)
  {
    fprintf(fp,"%d %d %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f\n",k,(*this)(k)._PQ,(*this)(k)._R/pow(10,-11),(*this)(k).X[0],(*this)(k).X[1]/pow(10,-11),(*this)(k).X[2],(*this)(k).X[3],(*this)(k).X[4]);
  }
  fclose(fp);
}
void  System::UpdateX_ex(double dt)// DDE23
{
  double *y,*yp,*yc;
  double kon,koff,q0;
  y=new double [1];yp=new double [1];yc=new double [1];
  y[0]=(*this)(1).X[0];// X_ex 
  kon=(*this)(1)._par.k_on;koff=(*this)(1)._par.k_off;q0=(*this)(1)._par.q0;// par kon koff q0
  double sum1_1,sum2_1,sum3_1,sum1_2,sum2_2,sum3_2;//sum1:q(X^i_in),sum3:k_off*R^i;sum2:kon*(R_max-R^i)
  sum1_1=0;sum2_1=0;sum3_1=0;
  for(int k=1;k<=NumPoolCell;k++)
  {
    if((*this)(k)._PQ==1)
    {
      sum1_1=sum1_1+q0*(*this)(k).V2[0];
      sum2_1=sum2_1+kon*((*this)(k)._R-(*this)(k).X[1])*y[0];
      sum3_1=sum3_1+koff*(*this)(k).X[1];
    }
  }
  yp[0]=y[0]+dt*(_MD.v_cell*sum1_1*1.0/(_MD.N0*_MD.v_ex)+sum3_1*1.0/(_MD.v_ex*_MD.N0)-sum2_1*1.0/(_MD.v_ex*_MD.N0)-_MD.d4*y[0]);

  sum1_2=0;sum2_2=0;sum3_2=0;
  for(int k=1;k<=NumPoolCell;k++)
  {
    if((*this)(k)._PQ==1)
    {
      sum1_2=sum1_2+q0*(*this)(k).V2[1];
      sum2_2=sum2_2+kon*((*this)(k)._R-(*this)(k).X[1])*yp[0];
      sum3_2=sum3_2+koff*(*this)(k).X[1];
    }
  }
  yc[0]=y[0]+dt*(_MD.v_cell*sum1_2*1.0/(_MD.N0*_MD.v_ex)+sum3_2*1.0/(_MD.v_ex*_MD.N0)-sum2_2*1.0/(_MD.v_ex*_MD.N0)-_MD.d4*yp[0]);


  for(int k=1;k<=NumPoolCell;k++)
  {
    (*this)(k).X[0]=0.5*(yc[0]+yp[0]);
  }
  //PureEx=dt*(_MD.gamma_1*sum1_2*1.0/_MD.N0+_MD.gamma_1*sum1_1*1.0/_MD.N0);
  delete y;
  delete yp;
  delete yc;
  return ;
}
ApdatedImmune System::Update_ApdatImmune(int N00,double dt) //ODE23 
{
  double *y,*yp,*yc;
  double mu1,mu2,mu3,delta1,delta2;
  delta1=delta_exhaust(AI.signal);
  mu1=_MD.mu_1,mu2=_MD.mu_2,mu3=_MD.mu_3,delta2=_MD.d6;
  y=new double [2];yp=new double [2];yc=new double [2];
  y[1]=AI.Cytokine;y[0]=AI.Effector_T;

  yp[0]=y[0]+dt*(mu1*_MD.T0*pow(y[1],_MD.m3)/(pow(y[1],_MD.m3)+pow(_MD.K3,_MD.m3))-delta1*y[0]);
  yp[1]=y[1]+dt*(mu2*N00*1.0/NumPoolCell+mu3*y[1]-delta2*y[1]);

  yc[0]=y[0]+dt*(mu1*_MD.T0*pow(yp[1],_MD.m3)/(pow(yp[1],_MD.m3)+pow(_MD.K3,_MD.m3))-delta1*yp[0]);
  yc[1]=y[1]+dt*(mu2*N00*1.0/NumPoolCell+mu3*yp[1]-delta2*yp[1]);

  AI.Effector_T=0.5*(yc[0]+yp[0]);
  AI.Cytokine=0.5*(yc[1]+yp[1]);
  delete y;
  delete yp;
  delete yc;
  return AI;
}

double System::delta_exhaust(int signal)// T cell exhaustion
{
  double delta,T_exhaust;
  if (signal>0) // syptom presentation
  {
    //T_exhaust=NumerialIntegrate(tau);
    T_exhaust=pow(AI.Cytokine,_MD.m4)/(pow(_MD.K4,_MD.m4)+pow(AI.Cytokine,_MD.m4));
    delta=_MD.d5+_MD.rho*T_exhaust;
  }
  else
  {
    delta=_MD.d5;
  }
  return delta;
}
double System::NumerialIntegrate(int length)//tau=7200*dt=72hr,
{
  double result,*Y;
  Y=new double [length];
  for(int i=0;i<length;i++)
  { 
    Y[i]=pow(AI.CYT[i],_MD.m4)/(pow(_MD.K4,_MD.m4)+pow(AI.CYT[i],_MD.m4));
  }
  result=_MD.dt*(Y[0]+Y[length-1])/2;
  for (int i=1;i<length-1;i++){result+=Y[i]*_MD.dt;}
  delete Y;
  return result;
}
ApdatedImmune System ::Accumulate_CYT(int signal,int length) // Accumulating Cytokine
{
  if(signal>=0)
  {
    double *K;
    K=new double[length];
    for (int i=0;i<length-1;i++)
    {
       K[i]=AI.CYT[i+1];
    }// replace CTY[1]~CTY[length-2]
    K[length-1]=AI.Cytokine;
    for(int i=0;i<length;i++)
    {
      AI.CYT[i]=K[i];
    }
    delete K;
  }
  return AI;
}
CCell&System ::operator()(int index)
{
  if(index>=0&&index<=MaxCellNumber)
  {
    return *(_cell+(index-1));
  }
  else
  {
    cout<<"Err<< CSystem () >>Dimensional error"<<endl;
	  exit(0);
  }
  
}
