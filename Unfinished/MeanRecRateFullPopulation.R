pops<-c("Purus")#, "Amelonado", "Contamana", "Criollo", "Curaray" , "Guianna", "Iquitos", "Maranon", "Nacional", "Nanay", "Purus")

ChromSizes<-read.table("/data/cornejo/projects/e.jimenezschwarzkop/Cacao/ChromSize.txt")


for(chr in c(1:10)){
  file1<-paste("/data/cornejo/projects/e.jimenezschwarzkop/Cacao/export/cacao.phased.chr", chr, ".vcf.", pop, ".ids.ldhat.ldhat.rates.txt", sep="")
  file2<-paste("/data/cornejo/projects/e.jimenezschwarzkop/Cacao/data/", pop, "/chr", chr, "/cacao.phased.chr", chr, ".vcf.", pop, ".ids.ldhat.ldhat.locs", sep="")
  
  rates<-read.table(file1)
  locs <-read.table(file2, skip=1)
  
  rates<-as.matrix(rates)
  rates<-rates[5001:10000,]
  
  means<-apply(rates, 2, mean)
  
  if(chr==1){
    d<-cbind(locs, means)
    dp<-cbind(rep(chr,nrow(d)),d)
    colnames(dp)<-c("chr", "locs", "means")
  }
  else{
    d<-cbind(locs,means)
    colnames(d)<-c("locs", "means")
    d<-cbind(rep(chr,nrow(d)),d$locs+(sum(ChromSizes[1:(chr-1),2])/1000), d$means)
    colnames(d)<-c("chr", "locs", "means")
    dp<-rbind(dp,d)
  }
  cat(chr)
  rm(rates)
  rm(locs)
}


head(dp)

dp$chr<-factor(dp$chr)

Purus <- dp

write.table(Pur, "/data/cornejo/projects/e.jimenezschwarzkop/Cacao/export/Pur", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
