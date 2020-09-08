##### Script to calculate the recombination rate in cM/Mb for each chromosome of each cacao population
##### This script is made to run in Venezuela (the Cornejo lab workstation)

#### Set working directory

setwd("/media/venezuela2/ejschwarzkopf/cacao/consensus.map")

#### Import the recomibnation rates for each population

Ame<-read.table("Ame")
Con<-read.table("Con")
Cri<-read.table("Cri")
Cur<-read.table("Cur")
Gui<-read.table("Gui")
Iqu<-read.table("Iqu")
Mar<-read.table("Mar")
Nac<-read.table("Nac")
Nan<-read.table("Nan")
Pur<-read.table("Pur")

#### Import file with effective population sizes

NE<-read.table("NE_harmonMean.tab", header=T)

#### Convert rates to r/kb for each population

Ame[,3]<-Ame[,3]/(4*NE[1,2])
Con[,3]<-Con[,3]/(4*NE[2,2])
Cri[,3]<-Cri[,3]/(4*NE[3,2])
Cur[,3]<-Cur[,3]/(4*NE[4,2])
Gui[,3]<-Gui[,3]/(4*NE[5,2])
Iqu[,3]<-Iqu[,3]/(4*NE[6,2])
Mar[,3]<-Mar[,3]/(4*NE[7,2])
Nac[,3]<-Nac[,3]/(4*NE[8,2])
Nan[,3]<-Nan[,3]/(4*NE[9,2])
Pur[,3]<-Pur[,3]/(4*NE[10,2])

#### Create matrix to save the Wilcoxon signed-rank test results

AllPops.wilcox.test<-matrix(ncol=10, nrow=10)

#### Run the Wilcoxon signed-rank test (unpaired for all population pairings)

AllPops.wilcox.test[1,1]<-wilcox.test(x=Ame[,3], y=Ame[,3], paired=F)$p.value
AllPops.wilcox.test[1,2]<-wilcox.test(x=Ame[,3], y=Con[,3], paired=F)$p.value
AllPops.wilcox.test[1,3]<-wilcox.test(x=Ame[,3], y=Cri[,3], paired=F)$p.value
AllPops.wilcox.test[1,4]<-wilcox.test(x=Ame[,3], y=Cur[,3], paired=F)$p.value
AllPops.wilcox.test[1,5]<-wilcox.test(x=Ame[,3], y=Gui[,3], paired=F)$p.value
AllPops.wilcox.test[1,6]<-wilcox.test(x=Ame[,3], y=Iqu[,3], paired=F)$p.value
AllPops.wilcox.test[1,7]<-wilcox.test(x=Ame[,3], y=Mar[,3], paired=F)$p.value
AllPops.wilcox.test[1,8]<-wilcox.test(x=Ame[,3], y=Nac[,3], paired=F)$p.value
AllPops.wilcox.test[1,9]<-wilcox.test(x=Ame[,3], y=Nan[,3], paired=F)$p.value
AllPops.wilcox.test[1,10]<-wilcox.test(x=Ame[,3], y=Pur[,3], paired=F)$p.value
AllPops.wilcox.test[2,1]<-wilcox.test(x=Con[,3], y=Ame[,3], paired=F)$p.value
AllPops.wilcox.test[2,2]<-wilcox.test(x=Con[,3], y=Con[,3], paired=F)$p.value
AllPops.wilcox.test[2,3]<-wilcox.test(x=Con[,3], y=Cri[,3], paired=F)$p.value
AllPops.wilcox.test[2,4]<-wilcox.test(x=Con[,3], y=Cur[,3], paired=F)$p.value
AllPops.wilcox.test[2,5]<-wilcox.test(x=Con[,3], y=Gui[,3], paired=F)$p.value
AllPops.wilcox.test[2,6]<-wilcox.test(x=Con[,3], y=Iqu[,3], paired=F)$p.value
AllPops.wilcox.test[2,7]<-wilcox.test(x=Con[,3], y=Mar[,3], paired=F)$p.value
AllPops.wilcox.test[2,8]<-wilcox.test(x=Con[,3], y=Nac[,3], paired=F)$p.value
AllPops.wilcox.test[2,9]<-wilcox.test(x=Con[,3], y=Nan[,3], paired=F)$p.value
AllPops.wilcox.test[2,10]<-wilcox.test(x=Con[,3], y=Pur[,3], paired=F)$p.value
AllPops.wilcox.test[3,1]<-wilcox.test(x=Cri[,3], y=Ame[,3], paired=F)$p.value
AllPops.wilcox.test[3,2]<-wilcox.test(x=Cri[,3], y=Con[,3], paired=F)$p.value
AllPops.wilcox.test[3,3]<-wilcox.test(x=Cri[,3], y=Cri[,3], paired=F)$p.value
AllPops.wilcox.test[3,4]<-wilcox.test(x=Cri[,3], y=Cur[,3], paired=F)$p.value
AllPops.wilcox.test[3,5]<-wilcox.test(x=Cri[,3], y=Gui[,3], paired=F)$p.value
AllPops.wilcox.test[3,6]<-wilcox.test(x=Cri[,3], y=Iqu[,3], paired=F)$p.value
AllPops.wilcox.test[3,7]<-wilcox.test(x=Cri[,3], y=Mar[,3], paired=F)$p.value
AllPops.wilcox.test[3,8]<-wilcox.test(x=Cri[,3], y=Nac[,3], paired=F)$p.value
AllPops.wilcox.test[3,9]<-wilcox.test(x=Cri[,3], y=Nan[,3], paired=F)$p.value
AllPops.wilcox.test[3,10]<-wilcox.test(x=Cri[,3], y=Pur[,3], paired=F)$p.value
AllPops.wilcox.test[4,1]<-wilcox.test(x=Cur[,3], y=Ame[,3], paired=F)$p.value
AllPops.wilcox.test[4,2]<-wilcox.test(x=Cur[,3], y=Con[,3], paired=F)$p.value
AllPops.wilcox.test[4,3]<-wilcox.test(x=Cur[,3], y=Cri[,3], paired=F)$p.value
AllPops.wilcox.test[4,4]<-wilcox.test(x=Cur[,3], y=Cur[,3], paired=F)$p.value
AllPops.wilcox.test[4,5]<-wilcox.test(x=Cur[,3], y=Gui[,3], paired=F)$p.value
AllPops.wilcox.test[4,6]<-wilcox.test(x=Cur[,3], y=Iqu[,3], paired=F)$p.value
AllPops.wilcox.test[4,7]<-wilcox.test(x=Cur[,3], y=Mar[,3], paired=F)$p.value
AllPops.wilcox.test[4,8]<-wilcox.test(x=Cur[,3], y=Nac[,3], paired=F)$p.value
AllPops.wilcox.test[4,9]<-wilcox.test(x=Cur[,3], y=Nan[,3], paired=F)$p.value
AllPops.wilcox.test[4,10]<-wilcox.test(x=Cur[,3], y=Pur[,3], paired=F)$p.value
AllPops.wilcox.test[5,1]<-wilcox.test(x=Gui[,3], y=Ame[,3], paired=F)$p.value
AllPops.wilcox.test[5,2]<-wilcox.test(x=Gui[,3], y=Con[,3], paired=F)$p.value
AllPops.wilcox.test[5,3]<-wilcox.test(x=Gui[,3], y=Cri[,3], paired=F)$p.value
AllPops.wilcox.test[5,4]<-wilcox.test(x=Gui[,3], y=Cur[,3], paired=F)$p.value
AllPops.wilcox.test[5,5]<-wilcox.test(x=Gui[,3], y=Gui[,3], paired=F)$p.value
AllPops.wilcox.test[5,6]<-wilcox.test(x=Gui[,3], y=Iqu[,3], paired=F)$p.value
AllPops.wilcox.test[5,7]<-wilcox.test(x=Gui[,3], y=Mar[,3], paired=F)$p.value
AllPops.wilcox.test[5,8]<-wilcox.test(x=Gui[,3], y=Nac[,3], paired=F)$p.value
AllPops.wilcox.test[5,9]<-wilcox.test(x=Gui[,3], y=Nan[,3], paired=F)$p.value
AllPops.wilcox.test[5,10]<-wilcox.test(x=Gui[,3], y=Pur[,3], paired=F)$p.value
AllPops.wilcox.test[6,1]<-wilcox.test(x=Iqu[,3], y=Ame[,3], paired=F)$p.value
AllPops.wilcox.test[6,2]<-wilcox.test(x=Iqu[,3], y=Con[,3], paired=F)$p.value
AllPops.wilcox.test[6,3]<-wilcox.test(x=Iqu[,3], y=Cri[,3], paired=F)$p.value
AllPops.wilcox.test[6,4]<-wilcox.test(x=Iqu[,3], y=Cur[,3], paired=F)$p.value
AllPops.wilcox.test[6,5]<-wilcox.test(x=Iqu[,3], y=Gui[,3], paired=F)$p.value
AllPops.wilcox.test[6,6]<-wilcox.test(x=Iqu[,3], y=Iqu[,3], paired=F)$p.value
AllPops.wilcox.test[6,7]<-wilcox.test(x=Iqu[,3], y=Mar[,3], paired=F)$p.value
AllPops.wilcox.test[6,8]<-wilcox.test(x=Iqu[,3], y=Nac[,3], paired=F)$p.value
AllPops.wilcox.test[6,9]<-wilcox.test(x=Iqu[,3], y=Nan[,3], paired=F)$p.value
AllPops.wilcox.test[6,10]<-wilcox.test(x=Iqu[,3], y=Pur[,3], paired=F)$p.value
AllPops.wilcox.test[7,1]<-wilcox.test(x=Mar[,3], y=Ame[,3], paired=F)$p.value
AllPops.wilcox.test[7,2]<-wilcox.test(x=Mar[,3], y=Con[,3], paired=F)$p.value
AllPops.wilcox.test[7,3]<-wilcox.test(x=Mar[,3], y=Cri[,3], paired=F)$p.value
AllPops.wilcox.test[7,4]<-wilcox.test(x=Mar[,3], y=Cur[,3], paired=F)$p.value
AllPops.wilcox.test[7,5]<-wilcox.test(x=Mar[,3], y=Gui[,3], paired=F)$p.value
AllPops.wilcox.test[7,6]<-wilcox.test(x=Mar[,3], y=Iqu[,3], paired=F)$p.value
AllPops.wilcox.test[7,7]<-wilcox.test(x=Mar[,3], y=Mar[,3], paired=F)$p.value
AllPops.wilcox.test[7,8]<-wilcox.test(x=Mar[,3], y=Nac[,3], paired=F)$p.value
AllPops.wilcox.test[7,9]<-wilcox.test(x=Mar[,3], y=Nan[,3], paired=F)$p.value
AllPops.wilcox.test[7,10]<-wilcox.test(x=Mar[,3], y=Pur[,3], paired=F)$p.value
AllPops.wilcox.test[8,1]<-wilcox.test(x=Nac[,3], y=Ame[,3], paired=F)$p.value
AllPops.wilcox.test[8,2]<-wilcox.test(x=Nac[,3], y=Con[,3], paired=F)$p.value
AllPops.wilcox.test[8,3]<-wilcox.test(x=Nac[,3], y=Cri[,3], paired=F)$p.value
AllPops.wilcox.test[8,4]<-wilcox.test(x=Nac[,3], y=Cur[,3], paired=F)$p.value
AllPops.wilcox.test[8,5]<-wilcox.test(x=Nac[,3], y=Gui[,3], paired=F)$p.value
AllPops.wilcox.test[8,6]<-wilcox.test(x=Nac[,3], y=Iqu[,3], paired=F)$p.value
AllPops.wilcox.test[8,7]<-wilcox.test(x=Nac[,3], y=Mar[,3], paired=F)$p.value
AllPops.wilcox.test[8,8]<-wilcox.test(x=Nac[,3], y=Nac[,3], paired=F)$p.value
AllPops.wilcox.test[8,9]<-wilcox.test(x=Nac[,3], y=Nan[,3], paired=F)$p.value
AllPops.wilcox.test[8,10]<-wilcox.test(x=Nac[,3], y=Pur[,3], paired=F)$p.value
AllPops.wilcox.test[9,1]<-wilcox.test(x=Nan[,3], y=Ame[,3], paired=F)$p.value
AllPops.wilcox.test[9,2]<-wilcox.test(x=Nan[,3], y=Con[,3], paired=F)$p.value
AllPops.wilcox.test[9,3]<-wilcox.test(x=Nan[,3], y=Cri[,3], paired=F)$p.value
AllPops.wilcox.test[9,4]<-wilcox.test(x=Nan[,3], y=Cur[,3], paired=F)$p.value
AllPops.wilcox.test[9,5]<-wilcox.test(x=Nan[,3], y=Gui[,3], paired=F)$p.value
AllPops.wilcox.test[9,6]<-wilcox.test(x=Nan[,3], y=Iqu[,3], paired=F)$p.value
AllPops.wilcox.test[9,7]<-wilcox.test(x=Nan[,3], y=Mar[,3], paired=F)$p.value
AllPops.wilcox.test[9,8]<-wilcox.test(x=Nan[,3], y=Nac[,3], paired=F)$p.value
AllPops.wilcox.test[9,9]<-wilcox.test(x=Nan[,3], y=Nan[,3], paired=F)$p.value
AllPops.wilcox.test[9,10]<-wilcox.test(x=Nan[,3], y=Pur[,3], paired=F)$p.value
AllPops.wilcox.test[10,1]<-wilcox.test(x=Pur[,3], y=Ame[,3], paired=F)$p.value
AllPops.wilcox.test[10,2]<-wilcox.test(x=Pur[,3], y=Con[,3], paired=F)$p.value
AllPops.wilcox.test[10,3]<-wilcox.test(x=Pur[,3], y=Cri[,3], paired=F)$p.value
AllPops.wilcox.test[10,4]<-wilcox.test(x=Pur[,3], y=Cur[,3], paired=F)$p.value
AllPops.wilcox.test[10,5]<-wilcox.test(x=Pur[,3], y=Gui[,3], paired=F)$p.value
AllPops.wilcox.test[10,6]<-wilcox.test(x=Pur[,3], y=Iqu[,3], paired=F)$p.value
AllPops.wilcox.test[10,7]<-wilcox.test(x=Pur[,3], y=Mar[,3], paired=F)$p.value
AllPops.wilcox.test[10,8]<-wilcox.test(x=Pur[,3], y=Nac[,3], paired=F)$p.value
AllPops.wilcox.test[10,9]<-wilcox.test(x=Pur[,3], y=Nan[,3], paired=F)$p.value
AllPops.wilcox.test[10,10]<-wilcox.test(x=Pur[,3], y=Pur[,3], paired=F)$p.value

#### Name rows of Wilcoxon results matrix

rownames(AllPops.wilcox.test)<-c("Amelonado", "Contamana", "Criollo", "Curaray", "Guianna", "Iquitos", "Maranon", "Nacional", "Nanay", "Purus")
colnames(AllPops.wilcox.test)<-c("Amelonado", "Contamana", "Criollo", "Curaray", "Guianna", "Iquitos", "Maranon", "Nacional", "Nanay", "Purus")

#### Save results to file

write.table(AllPops.wilcox.test, "AllPops_wilcox_test.tbl", quote=F)