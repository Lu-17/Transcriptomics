if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.15")
BiocManager::install("DESeq2")
BiocManager::install("edgeR")
BiocManager::install("tidyverse")
BiocManager::install("reshape2")
BiocManager::install("dendextend")

library(DESeq2)
library(edgeR)
library(tidyverse)
library(reshape2)
library(dendextend)

#Importing metadata from table
SraRunTable <- read.csv("C:/Users/luisa/Desktop/hackbio/Transcriptomics/Stage3/SraRunTableMetadata.txt")
#cleaning the columnnames
colnames(SraRunTable) = gsub("\\(exp\\)", "",colnames(SraRunTable))

#swaping out "-" and "+" for "minus" and "plus" because it will show errors otherwise
SraRunTable$Cell_type = gsub("-","_minus",SraRunTable$Cell_type)
SraRunTable$Cell_type = gsub("\\+","_plus",SraRunTable$Cell_type)

#import counts
library(readr)
counts <- read_delim("C:/Users/luisa/Desktop/hackbio/Transcriptomics/Stage3/counts.txt", 
                     delim = "\t", escape_double = FALSE, 
                     trim_ws = TRUE)
View(counts)


dgList <- DGEList(counts=counts[,-1],
                  genes=counts$SYMBOL,
                  group = SraRunTable$source_name
                  )
#normalize the counts per million
countsPerMillion <- cpm(dgList)
summary(countsPerMillion)

countCheck <- countsPerMillion > 1
head(countCheck)

#Filter based on counts per million
keep <- which(rowSums(countCheck) >= 10)
length(keep)
dgList <- dgList[[c(keep)]] ###********
dim(dgList)
genes.filt <- genes[keep]
length(genes.filt)
dgList.counts=dgList[[1]][c(keep),]
dgList.counts
class(dgList.counts)

## Differential expression analysis
## switching over to deseq2
counts_filt =dgList$counts
dds <- DESeqDataSetFromMatrix(countData = counts_filt,
                              colData = SraRunTable,
                              design = ~ Cell_type + treatment)
dds <- DESeq(dds)

#Visualizing normalizing counts

vsd <- vst(dds, blind =FALSE)
mat <- assay(vsd)
head(as.data.frame(mat))

dend = t(mat) %>%
  scale %>%
  dist %>%
  hclust %>%
  as.dendrogram

l = SraRunTable$treatment[SraRunTable$GEO_Accession..exp. %in% labels(dend)]
dend %>%
  set("labels", l) %>%
  plot

#PCA

mat.pca<-prcomp(t(mat)) #perform pca
summary(mat.pca)

#Extract PCA scores
scores <- as.data.frame(mat.pca$x)
scores

#scores %>%
 # mutate(GEO_Accession = rownames(scores)) %>%
  #left_join(SraRunTable,  ) %>%
scores$rownames<-rownames(scores)
dat1<- merge(x=scores,y=SraRunTable,by.x="rownames",by.y="Sample.Name") 

 ggplot(data=dat1,aes(PC1, PC2, color = treatment))+
  geom_point()

#scores %>%
 # mutate(GEO_Accession = rownames(scores)) %>%
  #left_join(SraRunTable,by="Sample.Name") %>%
  ggplot(data=dat1,aes(PC1, PC2, color = Cell_type))+
  geom_point()



#Getting deseq results
HomeCagevNonShock = results(dds,contrast = c("treatment", "HomeCage", "Non Shock"), tidy = TRUE)
FearCondvNonShock = results(dds,contrast = c("treatment", "Fear Conditioned", "Non Shock"), tidy = TRUE)
FearCondvHomeCage = results(dds,contrast = c("treatment", "Fear Conditioned", "HomeCage"), tidy = TRUE)
dds
#Non shock v Fear conditioned
#FearCondvNonShock <- FearCondvNonShock %>%
 # mutate(sig = ifelse(log2FoldChange > 15 & padj < 0.01, "UP",(ifelse(log2FoldChange < -15 & padj < 0.01, "DOWN", "not sig")) ))%>%
 # mutate(SYMBOL=genes.filt)

plot(HomeCagevNonShock$log2FoldChange,-log10(HomeCagevNonShock$padj))
pval=0.05
lfc=10
Up<-subset(HomeCagevNonShock,log2FoldChange > lfc & padj < pval)
Down<-subset(HomeCagevNonShock,log2FoldChange < -10 & padj < pval)
normal<-subset(HomeCagevNonShock,log2FoldChange >-lfc & log2FoldChange <lfc)
normal

points(Up$log2FoldChange,-log10(Up$padj),col="red")
points(Down$log2FoldChange,-log10(Down$padj),col="blue")
points(normal$log2FoldChange,-log10(normal$padj),col="yellow",labels="normal")
legend(1, 95, legend=c("Up", "Down", "Normal"),
       col=c("red", "blue","yellow"), lty=1:2, cex=0.8)

table(HomeCagevNonShock$sig)

#FearCondvHomeCage <- FearCondvHomeCage %>%
#  mutate(sig = ifelse(log2FoldChange > lfc & padj < pval, "UP",(ifelse(log2FoldChange < -lfc & padj < pval, "DOWN", "not sig")) ))%>%
 # mutate(SYMBOL=genes.filt)

#table(FearCondvNonShock$sig)

#plot(HomeCagevNonShock$log2FoldChange,-log10(HomeCagevNonShock$padj))

#Volcano plot
#FearCondvHomeCage %>%
 # filter(!(sig %in% NA))
  #ggplot(aes(x=log2foldChange,y=-log(padj))color=sig))+
  #geom_point()












