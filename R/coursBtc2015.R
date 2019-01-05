source('./PRE/sort.R')

##2015
View(bitcoin_price_sorted)
bitcoin_price_sorted_2015 <- bitcoin_price_sorted[bitcoin_price_sorted$Year == 2015,]

##moyenne de 2015
moyBtcMin2015 <- mean(bitcoin_price_sorted_2015$Low)
moyBtcMax2015 <- mean(bitcoin_price_sorted_2015$High)
moyBtcVol2015 <-mean(bitcoin_price_sorted_2015$Volume)

##variance de 2015
varBtcMin2015 <- var(bitcoin_price_sorted_2015$Low)
varBtcMax2015 <- var(bitcoin_price_sorted_2015$High)
varBtcVol2015 <- var(bitcoin_price_sorted_2015$Volume)

##ecrat type de 2015
ecartBtcMin2015 <- sqrt(varBtcMin2015)
ecartBtcMax2015 <- sqrt(varBtcMax2015)
ecartBtcVol2015 <- sqrt(varBtcVol2015)

tabMoyLow2015<-0
tabMoyHigh2015<-0
tabMoyVol2015<-0
tabVarLow2015<-0
tabVarHigh2015<-0
tabVarVol2015<-0
tabEcartLow2015<-0
tabEcartHigh2015<-0
tabEcartVol2015<-0

##boucle permettant de remplir les tableaux de mois
for(i in 1:12){
  ##moyenne pour chaque mois
  tabMoyLow2015[i]<- mean(bitcoin_price_sorted_2015[bitcoin_price_sorted_2015$Month == i,]$Low)
  tabMoyHigh2015[i]<- mean(bitcoin_price_sorted_2015[bitcoin_price_sorted_2015$Month == i,]$High)
  tabMoyVol2015[i]<- mean(bitcoin_price_sorted_2015[bitcoin_price_sorted_2015$Month == i,]$Volume)
  
  ##variance pour chaque mois
  tabVarLow2015[i]<- var(bitcoin_price_sorted_2015[bitcoin_price_sorted_2015$Month == i,]$Low)
  tabVarHigh2015[i]<- var(bitcoin_price_sorted_2015[bitcoin_price_sorted_2015$Month == i,]$High)
  tabVarVol2015[i]<- var(bitcoin_price_sorted_2015[bitcoin_price_sorted_2015$Month == i,]$Volume)
  
  ##ecart type pour chaque mois
  tabEcartLow2015[i] <- sqrt(tabVarLow2015[i])
  tabEcartHigh2015[i] <- sqrt(tabVarHigh2015[i])
  tabEcartVol2015[i] <- sqrt(tabVarVol2015[i])
}




