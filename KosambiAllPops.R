##### Script to calculate the recombination rate in cM/Mb for each chromosome of each cacao population
##### This script is made to run in Venezuela (the Cornejo lab workstation)

####

setwd("/media/venezuela2/ejschwarzkopf/cacao/consensus.map")

#### Define the function that applies the kosambi function to each population


kosambi<-function(X){
y=c()
for(i in 1:10){
a=c()
for(j in c(seq(101, nrow(X[which(X[,1]==i),]), 100), nrow(X[which(X[,1]==i),]))){
Xj=X[(j-100):j,]
d=Xj[nrow(Xj),2]-Xj[1,2]
r=mean(Xj[,3])*d
k=.25*log(x=(1+2*r)/(1-2*r), base=exp(1))*100
a=c(a, k)
}
y=c(y, median(a), na.rm=T)
}
return(y)
}

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

#### Use the kosambi function to obtain an average recombination rate in cM/Mb for each population

Ame.cMMb<-kosambi(Ame)
Con.cMMb<-kosambi(Con)
Cri.cMMb<-kosambi(Cri)
Cur.cMMb<-kosambi(Cur)
Gui.cMMb<-kosambi(Gui)
Iqu.cMMb<-kosambi(Iqu)
Mar.cMMb<-kosambi(Mar)
Nac.cMMb<-kosambi(Nac)
Nan.cMMb<-kosambi(Nan)
Pur.cMMb<-kosambi(Pur)

#### Put all kosambi estimates in a single table

cMMb<-data.frame(Amelonado=Ame.cMMb, Contamana=Con.cMMb, Criollo=Cri.cMMb, Curaray=Cur.cMMb, Guianna=Gui.cMMb, Iquitos=Iqu.cMMb, Maranon=Mar.cMMb, Nacional=Nac.cMMb, Nanay=Nan.cMMb, Purus=Pur.cMMb)

#### Add a column of averages per chromosome

cMMb$Mean=apply(cMMb, 1, mean)

#### Save the table to the hard drive

write.table("cM_Mb2.allpops.allchroms.txt", quote=F, row.names=F)

