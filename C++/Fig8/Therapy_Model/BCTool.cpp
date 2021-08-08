#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "string.h"
#include "time.h"
#include "iostream"

using namespace std;

#include "System.h"
#include "BCTool.h"
#include "Random.h"

struct IMD _MD;
CRandom Rand;

void ReadIPF(char *fn);
void SetParVal(char *str, char const *conststr, char val[]);
void help();
void OutputParameter();
int main(int argc,char *argv[])
{
  System *sys;
  	if (argc<2)
  	{
  		help();
		exit(0);
  	}
	
	ReadIPF(argv[1]);
	if(_MD.seed > 0) Rand.Initialized(_MD.seed);

    sys = new System(_MD.N0);
    if(sys->Initialized())
    {
        sys->Run();
				//OutputParameter();
        return(1);
    }
    else
    {
        return(0);
    }
}
void help()
{
	cout<<"Usage: "<<endl;
	cout<<"bct_VirusCell inputfile"<<endl;
	cout<<"inputfile: The name of input file."<<endl;
	cout<<" For example: bct md.in."<<endl;
}
void SetParVal(char *str, char const *conststr, char val[])
{
	char *pst;
	if((pst=strstr(str,conststr))!=NULL)
	{
		strcpy(val,pst+strlen(conststr));
		if((pst = strstr(val,"\""))!=NULL)
		{
			val[pst - val] = '\0';
		}			
	}
	return;
}
void ReadIPF(char *fn)
{
	FILE *fp;
	char str[Strlength], *pst;
	if((fp = fopen(fn,"r"))==NULL)
	{
		cout<<"Cannot open the input file."<<endl;
		exit(0);
	}
	rewind(fp);
	while(!feof(fp))
	{
		fgets(str,Strlength,fp);
		if(str[0]=='#'){ continue;}
		SetParVal(str, "mdcrd=\"", _MD.mdcrd);
		SetParVal(str, "cellpar=\"",_MD.cellpar);
    if((pst=strstr(str,"dt="))!=NULL)
		{
			_MD.dt=atof(pst+3);
		}
		if((pst=strstr(str,"T="))!=NULL)
		{
			_MD.T=atof(pst+2);
		}
    if((pst=strstr(str,"ntpx="))!=NULL)
		{
      _MD.ntpx=atoi(pst+5);
    }
    if((pst=strstr(str,"InitialnCoV="))!=NULL)
		{
      _MD.InitialnCoV=atof(pst+12);
    }
		if((pst=strstr(str,"seed="))!=NULL)
		{
			_MD.seed=atoi(pst+5);
		}
    if((pst=strstr(str,"N0="))!=NULL)
    {
     _MD.N0=atoi(pst+3);
    }
		if((pst=strstr(str,"alpha_0="))!=NULL)
		{
			_MD.alpha_0=atof(pst+8);
		}
		if((pst=strstr(str,"alpha_1="))!=NULL)
		{
			_MD.alpha_1=atof(pst+8);
		}
		if((pst=strstr(str,"v_cell="))!=NULL)
		{
			_MD.v_cell=atof(pst+7);
		}
		if((pst=strstr(str,"v_ex="))!=NULL)
		{
			_MD.v_ex=atof(pst+5);
		}
		if((pst=strstr(str,"K3="))!=NULL)
		{
			_MD.K3=atof(pst+3);
		}
		if((pst=strstr(str,"K4="))!=NULL)
		{
			_MD.K4=atof(pst+3);
		}
		if((pst=strstr(str,"xi="))!=NULL)
		{
			_MD.xi=atof(pst+3);
		}
		if((pst=strstr(str,"mu_1="))!=NULL)
		{
			_MD.mu_1=atof(pst+5);
		}
		if((pst=strstr(str,"mu_2="))!=NULL)
		{
			_MD.mu_2=atof(pst+5);
		}
		if((pst=strstr(str,"mu_3="))!=NULL)
		{
			_MD.mu_3=atof(pst+5);
		}
		if((pst=strstr(str,"d4="))!=NULL)
		{
			_MD.d4=atof(pst+3);
		}
		if((pst=strstr(str,"d5="))!=NULL)
		{
			_MD.d5=atof(pst+3);
		}
		if((pst=strstr(str,"d6="))!=NULL)
		{
			_MD.d6=atof(pst+3);
		}
		if((pst=strstr(str,"T0="))!=NULL)
		{
			_MD.T0=atof(pst+3);
		}
		if((pst=strstr(str,"m3="))!=NULL)
		{
			_MD.m3=atof(pst+3);
		}
		if((pst=strstr(str,"m4="))!=NULL)
		{
			_MD.m4=atof(pst+3);
		}
		if((pst=strstr(str,"rho="))!=NULL)
		{
			_MD.rho=atof(pst+4);
		}
		if((pst=strstr(str,"omega1="))!=NULL)
		{
			_MD.omega1=atof(pst+7);
		}
		if((pst=strstr(str,"eps_1="))!=NULL)
		{
			_MD.eps_1=atof(pst+6);
		}
		if((pst=strstr(str,"eps_2="))!=NULL)
		{
			_MD.eps_2=atof(pst+6);
		}
		if((pst=strstr(str,"eps_3="))!=NULL)
		{
			_MD.eps_3=atof(pst+6);
		}
		if((pst=strstr(str,"eps_4="))!=NULL)
		{
			_MD.eps_4=atof(pst+6);
		}
		if((pst=strstr(str,"eps_5="))!=NULL)
		{
			_MD.eps_5=atof(pst+6);
		}
	}
	fclose(fp);
	return ;
}
void OutputParameter()
{
	printf("%f %f %f %f %f %f %f\n",_MD.eps_1,_MD.eps_2,_MD.eps_3,_MD.eps_4,_MD.eps_5,_MD.rho,_MD.omega1);
	return ;
}