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

for(chr 1:10){
  for(i in 1:15000){
    maxkb<-sum(ChromSizes[1:i,2])/1000
    minkb<-sum(ChromSizes[0:(i-1),2])/1000
    Mean<-c()
    Median<-c()
    LBound<-c()
    UBound<-c()
      for(j in 1:10){
        Mean<-c(Mean, mean(AllPopsRates[[j]][which(AllPopsRates[[j]][,1]==i & AllPopsRates[[j]][,2]<maxkb & AllPopsRates[[j]][,2]>=minkb),3]))
        Median<-c(Median, median(AllPopsRates[[j]][which(AllPopsRates[[j]][,1]==i & AllPopsRates[[j]][,2]<maxkb & AllPopsRates[[j]][,2]>=minkb),3]))
        
      }
  }
}
