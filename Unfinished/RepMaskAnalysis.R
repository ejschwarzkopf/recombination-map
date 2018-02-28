library(ggplot2)
library(reshape)


setwd(dir = "/media/venezuela2/ejschwarzkopf/cacao/")

RepMaskSim<-read.table("rep.masker/RepMaskSim.tbl")

colnames(RepMaskSim)<-c("Retroelemets", "DNA transposons", "Total interspersed repeats")
RepMaskSimFrame<-data.frame(RepMaskSim)


ggRSF<-melt(RepMaskSimFrame)


vl<-data.frame(variable=unique(ggRSF$variable), value=c(2.34, 1.94, 4.28))


ggplot(ggRSF, aes(x=value, fill=variable)) + geom_density(alpha=.3) + facet_grid(variable ~ .) + geom_vline(data=vl, aes(xintercept=value, col=variable))
length(RepMaskSim$Retroelemets[which(RepMaskSim$Retroelemets>2.34)])
length(RepMaskSim$`DNA transposons`[which(RepMaskSim$`DNA transposons`>1.94)])
length(RepMaskSim$`Total interspersed repeats`[which(RepMaskSim$`Total interspersed repeats`>4.28)])
apply(RepMaskSim, MARGIN = 2, FUN = mean)

ggplot(ggRSF, aes(x=value, fill=variable)) + geom_density(alpha=.3) + facet_grid(variable ~ .) + geom_vline(data=vl, aes(xintercept=value, col=variable)) + theme_void()
ggplot(ggRSF, aes(x=value, fill=variable)) + geom_density(alpha=.3) + facet_grid(variable ~ .) + theme_void()
