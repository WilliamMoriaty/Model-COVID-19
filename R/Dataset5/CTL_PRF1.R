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
gene<-read.table("/project/wangshun/work/R/COVID-19/CTL_PRF1.txt")


Idents(control) <- "celltype"
CTL <- subset(control, idents = c('CTL'))
a1 <- as.matrix(CTL@assays$RNA@data[gene$gene,]) #gene$gene: get the rowname of variable gene
write.csv(a1, "PRF1_normal.csv")

Idents(moderate) <- "celltype"
CTL <- subset(moderate, idents = c('CTL'))
a1 <- as.matrix(CTL@assays$RNA@data[gene$gene,]) #gene$gene: get the rowname of variable gene
write.csv(a1, "PRF1_moderate.csv")

Idents(critical) <- "celltype"
CTL <- subset(critical, idents = c('CTL'))
a1 <- as.matrix(CTL@assays$RNA@data[gene$gene,]) #gene$gene: get the rowname of variable gene
write.csv(a1, "PRF1_critical.csv")