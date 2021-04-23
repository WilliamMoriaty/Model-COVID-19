setwd("/project/wangshun/work/R/COVID-19/")

library(Seurat)

data2.integrated <- readRDS("/project/wangshun/work/R/COVID-19/covid_nbt_main.rds")
#data2.list <- SplitObject(data2.integrated, split.by = "patient")
data2.list <- SplitObject(data2.integrated, split.by = "severity")

control<-data2.list$`control`
#control<-data2.list$`BIH-Con-03`
control
moderate<-data2.list$`moderate`
#moderate<-data2.list$`BIH-CoV-15`
moderate
#critical<-data2.list$`BIH-CoV-07`
critical<-data2.list$`critical`
critical
gene<-read.table("/project/wangshun/work/R/COVID-19/TNF.txt")


Idents(control) <- "celltype"
rMa <- subset(control, idents = c('rMa'))
a1 <- as.matrix(rMa@assays$RNA@data[gene$gene,]) #gene$gene: get the rowname of variable gene

moDC <- subset(control, idents = c('moDC'))
a2 <- as.matrix(moDC@assays$RNA@data[gene$gene,])

nrMa <- subset(control, idents = c('nrMa'))
a3 <- as.matrix(nrMa@assays$RNA@data[gene$gene,])

Treg <- subset(control, idents = c('Treg'))
a4 <- as.matrix(Treg@assays$RNA@data[gene$gene,])

CTL <- subset(control, idents = c('CTL'))
a5 <- as.matrix(CTL@assays$RNA@data[gene$gene,]) 

NKT <- subset(control, idents = c('NKT'))
a6 <- as.matrix(NKT@assays$RNA@data[gene$gene,])

NKTP <- subset(control, idents = c('NKT-p'))
a7 <- as.matrix(NKTP@assays$RNA@data[gene$gene,])

Bcell <- subset(control, idents = c('B cell'))
a8 <- as.matrix(Bcell@assays$RNA@data[gene$gene,])

MC <- subset(control, idents = c('MC'))
a9 <- as.matrix(MC@assays$RNA@data[gene$gene,])

MoDMa <- subset(control, idents = c('MoD-Ma'))
a10 <- as.matrix(MoDMa@assays$RNA@data[gene$gene,])

pDC<- subset(control, idents = c('pDC'))
a11 <- as.matrix(pDC@assays$RNA@data[gene$gene,])

newdata=rbind(a1, a2, a3, a4, a5, a6,a7,a8,a9,a10,a11)
write.csv(newdata, "Immune_TNF_Normal.csv")


Idents(moderate) <- "celltype"
rMa <- subset(moderate, idents = c('rMa'))
a1 <- as.matrix(rMa@assays$RNA@data[gene$gene,]) #gene$gene: get the rowname of variable gene

Neu <- subset(moderate, idents = c('Neu'))
a2 <- as.matrix(Neu@assays$RNA@data[gene$gene,])

nrMa <- subset(moderate, idents = c('nrMa'))
a3 <- as.matrix(nrMa@assays$RNA@data[gene$gene,])

Treg <- subset(moderate, idents = c('Treg'))
a4 <- as.matrix(Treg@assays$RNA@data[gene$gene,])

CTL <- subset(moderate, idents = c('CTL'))
a5 <- as.matrix(CTL@assays$RNA@data[gene$gene,]) 

NKT <- subset(moderate, idents = c('NKT'))
a6 <- as.matrix(NKT@assays$RNA@data[gene$gene,])

NKTP <- subset(moderate, idents = c('NKT-p'))
a7 <- as.matrix(NKTP@assays$RNA@data[gene$gene,])

Bcell <- subset(moderate, idents = c('B cell'))
a8 <- as.matrix(Bcell@assays$RNA@data[gene$gene,])

MC <- subset(moderate, idents = c('MC'))
a9 <- as.matrix(MC@assays$RNA@data[gene$gene,])

MoDMa <- subset(moderate, idents = c('MoD-Ma'))
a10 <- as.matrix(MoDMa@assays$RNA@data[gene$gene,])

NK <- subset(moderate, idents = c('NK'))
a11<- as.matrix(NK@assays$RNA@data[gene$gene,])

pDC<- subset(moderate, idents = c('pDC'))
a12 <- as.matrix(pDC@assays$RNA@data[gene$gene,])

moDC<- subset(moderate, idents = c('moDC'))
a13 <- as.matrix(moDC@assays$RNA@data[gene$gene,])

newdata=rbind(a1, a2, a3, a4, a5, a6,a7,a8,a9,a10,a11,a12,a13)
write.csv(newdata, "Immune_TNF_Moderate.csv")



Idents(critical) <- "celltype"
rMa <- subset(critical, idents = c('rMa'))
a1 <- as.matrix(rMa@assays$RNA@data[gene$gene,]) #gene$gene: get the rowname of variable gene

Neu <- subset(critical, idents = c('Neu'))
a2 <- as.matrix(Neu@assays$RNA@data[gene$gene,])

nrMa <- subset(critical, idents = c('nrMa'))
a3 <- as.matrix(nrMa@assays$RNA@data[gene$gene,])

Treg <- subset(critical, idents = c('Treg'))
a4 <- as.matrix(Treg@assays$RNA@data[gene$gene,])

CTL <- subset(critical, idents = c('CTL'))
a5 <- as.matrix(CTL@assays$RNA@data[gene$gene,]) 

NKT <- subset(critical, idents = c('NKT'))
a6 <- as.matrix(NKT@assays$RNA@data[gene$gene,])

NKTP <- subset(critical, idents = c('NKT-p'))
a7 <- as.matrix(NKTP@assays$RNA@data[gene$gene,])

Bcell <- subset(critical, idents = c('B cell'))
a8 <- as.matrix(Bcell@assays$RNA@data[gene$gene,])

MC <- subset(critical, idents = c('MC'))
a9 <- as.matrix(MC@assays$RNA@data[gene$gene,])

MoDMa <- subset(critical, idents = c('MoD-Ma'))
a10 <- as.matrix(MoDMa@assays$RNA@data[gene$gene,])

NK <- subset(critical, idents = c('NK'))
a11<- as.matrix(NK@assays$RNA@data[gene$gene,])

moDC <- subset(critical, idents = c('moDC'))
a12 <- as.matrix(moDC@assays$RNA@data[gene$gene,])

pDC<- subset(critical, idents = c('pDC'))
a13 <- as.matrix(pDC@assays$RNA@data[gene$gene,])

newdata=rbind(a1, a2, a3, a4, a5, a6,a7,a8,a9,a10,a11,a12,a13)
write.csv(newdata, "Immune_TNF_Critical.csv")
