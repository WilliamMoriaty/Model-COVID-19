setwd("/project/wangshun/work/R/COVID-19/")

library(Seurat)

# data pre-integration
data2.integrated <- readRDS("covid_nbt_main.rds")
data2.list <- SplitObject(data2.integrated, split.by = "patient")

control<-data2.list$`BIH-Con-03`
control
gene<-read.table("coo.txt")

Idents(control) <- "celltype"
Basal <- subset(control, idents = c('Basal'))
a1 <- as.matrix(Basal@assays$RNA@data[gene$gene,]) #gene$gene: get the rowname of variable gene
Basal@assays$RNA@data@Dimnames[[1]]
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
write.csv(newdata, "ACE2_normal.csv")