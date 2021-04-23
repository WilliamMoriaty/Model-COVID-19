

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
gene<-read.table("/project/wangshun/work/R/COVID-19/PDCD1.txt")

Idents(moderate) <- "celltype"
Treg <- subset(moderate, idents = c('Treg'))
a2 <- as.matrix(Treg@assays$RNA@data[gene$gene,]) #gene$gene: get the rowname of variable gene
newdata=a2
write.csv(newdata, "PDCD1_Treg_moderate.csv")

Idents(critical) <- "celltype"
Treg <- subset(critical, idents = c('Treg'))
a2 <- as.matrix(Treg@assays$RNA@data[gene$gene,]) #gene$gene: get the rowname of variable gene
newdata=a2
write.csv(newdata, "PDCD1_Treg_critical.csv")
