{Ame<-read.table("Ame")
Con<-read.table("Con")
Cri<-read.table("Cri")
Cur<-read.table("Cur")
Gui<-read.table("Gui")
Iqu<-read.table("Iqu")
Mar<-read.table("Mar")
Nac<-read.table("Nac")
Nan<-read.table("Nan")
Pur<-read.table("Pur")
NE<-read.table("NE_harmonMean.tab", header=T)
ChromSizes<-read.table("ChromSize.txt")

Ame[,3]<-Ame[,3]/(4*NE[1,2])
Con[,3]<-Con[,3]*(4*NE[2,2])
Cri[,3]<-Cri[,3]*(4*NE[3,2])
Cur[,3]<-Cur[,3]*(4*NE[4,2])
Gui[,3]<-Gui[,3]*(4*NE[5,2])
Iqu[,3]<-Iqu[,3]*(4*NE[6,2])
Mar[,3]<-Mar[,3]*(4*NE[7,2])
Nac[,3]<-Nac[,3]*(4*NE[8,2])
Nan[,3]<-Nan[,3]*(4*NE[9,2])
Pur[,3]<-Pur[,3]*(4*NE[10,2])}

AllPopsRates<-list("Ame"=Ame, "Con"=Con, "Cri"=Cri, "Cur"=Cur, "Gui"=Gui, "Iqu"=Iqu, "Mar"=Mar, "Nac"=Nac, "Nan"=Nan, "Pur"=Pur)

Chromosomes<-c()
Positions<-c()
Means<-c()
Medians<-c()
Lbounds<-c()
Ubounds<-c()


for(chr in 1:10){
  for(i in 1:15000){
    maxkb<-sum(ChromSizes[1:i,2])/1000
    minkb<-sum(ChromSizes[0:(i-1),2])/1000
    Values<-c()
    for(j in 1:10){
        Values<-c(Values, mean(AllPopsRates[[j]][which(AllPopsRates[[j]][,1]==i & AllPopsRates[[j]][,2]<maxkb & AllPopsRates[[j]][,2]>=minkb),3]))        
    }
    Chromosomes<-c(Chromosomes, chr)
    Positions<-c(Positions, (maxkb-minkb)/2)
    Means<-c(Means, mean(Values))
    Medians<-c(Medians, median(Values))
    Ubounds<-c(Ubounds, sort(Values)[qbinom(c(.025, .975), length(Values), 0.5)][2])
    Lbounds<-c(Lbounds, sort(Values)[qbinom(c(.025, .975), length(Values), 0.5)][1])
  }
}

ConsensusMap<-matrix(c(Chromosomes, Positions, Means, Medians, Ubounds, Lbounds), ncol=6, byrow=F)

write.table(ConsensusMap, quote=F)




