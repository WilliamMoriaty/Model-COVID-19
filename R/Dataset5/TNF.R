setwd("/project/wangshun/work/R/COVID-19/")

library(Seurat)

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
Basal <- subset(control, idents = c('Basal'))
a1 <- as.matrix(Basal@assays$RNA@data[gene$gene,]) #gene$gene: get the rowname of variable gene

Secretory <- subset(control, idents = c('Secretory'))
a2 <- as.matrix(Secretory@assays$RNA@data[gene$gene,])

Ionocyte <- subset(control, idents = c('Ionocyte'))
a3 <- as.matrix(Ionocyte@assays$RNA@data[gene$gene,])

Ciliateddiff <- subset(control, idents = c('Ciliated-diff'))
a4 <- as.matrix(Ciliateddiff@assays$RNA@data[gene$gene,])

Secretorydiff <- subset(control, idents = c('Secretory-diff'))
a5 <- as.matrix(Secretorydiff@assays$RNA@data[gene$gene,]) 

Ciliated <- subset(control, idents = c('Ciliated'))
a6 <- as.matrix(Ciliated@assays$RNA@data[gene$gene,])

Squamous <- subset(control, idents = c('Squamous'))
a7 <- as.matrix(Squamous@assays$RNA@data[gene$gene,])

outliersepithelial <- subset(control, idents = c('outliers_epithelial'))
a8 <- as.matrix(outliersepithelial@assays$RNA@data[gene$gene,])

IRC <- subset(control, idents = c('IRC'))
a9 <- as.matrix(IRC@assays$RNA@data[gene$gene,])

newdata=rbind(a1, a2, a3, a4, a5, a6,a7,a8,a9)
write.csv(newdata, "TNF_Normal.csv")


Idents(moderate) <- "celltype"
Basal <- subset(moderate, idents = c('Basal'))
a1 <- as.matrix(Basal@assays$RNA@data[gene$gene,]) #gene$gene: get the rowname of variable gene

Secretory <- subset(moderate, idents = c('Secretory'))
a2 <- as.matrix(Secretory@assays$RNA@data[gene$gene,])

Ionocyte <- subset(moderate, idents = c('Ionocyte'))
a3 <- as.matrix(Ionocyte@assays$RNA@data[gene$gene,])

Ciliateddiff <- subset(moderate, idents = c('Ciliated-diff'))
a4 <- as.matrix(Ciliateddiff@assays$RNA@data[gene$gene,])

Secretorydiff <- subset(moderate, idents = c('Secretory-diff'))
a5 <- as.matrix(Secretorydiff@assays$RNA@data[gene$gene,]) 

Ciliated <- subset(moderate, idents = c('Ciliated'))
a6 <- as.matrix(Ciliated@assays$RNA@data[gene$gene,])

Squamous <- subset(moderate, idents = c('Squamous'))
a7 <- as.matrix(Squamous@assays$RNA@data[gene$gene,])

outliersepithelial <- subset(moderate, idents = c('outliers_epithelial'))
a8 <- as.matrix(outliersepithelial@assays$RNA@data[gene$gene,])

IRC <- subset(moderate, idents = c('IRC'))
a9 <- as.matrix(IRC@assays$RNA@data[gene$gene,])

unknownepithelial <- subset(moderate, idents = c('unknown_epithelial'))
a10 <- as.matrix(unknownepithelial@assays$RNA@data[gene$gene,])

FOXN4 <- subset(moderate, idents = c('FOXN4'))
a11<-  as.matrix(FOXN4@assays$RNA@data[gene$gene,])


newdata=rbind(a1, a2, a3, a4, a5, a6,a7,a8,a9,a10,a11)
write.csv(newdata, "TNF_Moderate.csv")



Idents(critical) <- "celltype"
Basal <- subset(critical, idents = c('Basal'))
a1 <- as.matrix(Basal@assays$RNA@data[gene$gene,]) #gene$gene: get the rowname of variable gene

Secretory <- subset(critical, idents = c('Secretory'))
a2 <- as.matrix(Secretory@assays$RNA@data[gene$gene,])

Ionocyte <- subset(critical, idents = c('Ionocyte'))
a3 <- as.matrix(Ionocyte@assays$RNA@data[gene$gene,])

Ciliateddiff <- subset(critical, idents = c('Ciliated-diff'))
a4 <- as.matrix(Ciliateddiff@assays$RNA@data[gene$gene,])

Secretorydiff <- subset(critical, idents = c('Secretory-diff'))
a5 <- as.matrix(Secretorydiff@assays$RNA@data[gene$gene,]) 

Ciliated <- subset(critical, idents = c('Ciliated'))
a6 <- as.matrix(Ciliated@assays$RNA@data[gene$gene,])

Squamous <- subset(critical, idents = c('Squamous'))
a7 <- as.matrix(Squamous@assays$RNA@data[gene$gene,])

outliersepithelial <- subset(critical, idents = c('outliers_epithelial'))
a8 <- as.matrix(outliersepithelial@assays$RNA@data[gene$gene,])

IRC <- subset(critical, idents = c('IRC'))
a9 <- as.matrix(IRC@assays$RNA@data[gene$gene,])

unknownepithelial <- subset(critical, idents = c('unknown_epithelial'))
a10 <- as.matrix(unknownepithelial@assays$RNA@data[gene$gene,])

FOXN4 <- subset(critical, idents = c('FOXN4'))
a11<-  as.matrix(FOXN4@assays$RNA@data[gene$gene,])


newdata=rbind(a1, a2, a3, a4, a5, a6,a7,a8,a9,a10,a11)
write.csv(newdata, "TNF_Critical.csv")
