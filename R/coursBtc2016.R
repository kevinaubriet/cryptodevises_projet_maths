##2016
bitcoin_price_sorted_2016 <- bitcoin_price_sorted[bitcoin_price_sorted$Year == 2016,]

##moyenne de 2016
moyBtcMin2016 <- mean(bitcoin_price_sorted_2016$Low)
moyBtcMax2016 <- mean(bitcoin_price_sorted_2016$High)
moyBtcVol2016 <-mean(bitcoin_price_sorted_2016$Volume)

##variance de 2016
varBtcMin2016 <- var(bitcoin_price_sorted_2016$Low)
varBtcMax2016 <- var(bitcoin_price_sorted_2016$High)
varBtcVol2016 <- var(bitcoin_price_sorted_2016$Volume)

##ecrat type de 2016
ecartBtcMin2016 <- sqrt(varBtcMin2016)
ecartBtcMax2016 <- sqrt(varBtcMax2016)
ecartBtcVol2016 <- sqrt(varBtcVol2016)

tabMoyLow2016<-0
tabMoyHigh2016<-0
tabMoyVol2016<-0
tabVarLow2016<-0
tabVarHigh2016<-0
tabVarVol2016<-0
tabEcartLow2016<-0
tabEcartHigh2016<-0
tabEcartVol2016<-0

##boucle permettant de remplir les tableaux de mois
for(i in 1:12){
  ##moyenne pour chaque mois
  tabMoyLow2016[i]<- mean(bitcoin_price_sorted_2016[bitcoin_price_sorted_2016$Month == i,]$Low)
  tabMoyHigh2016[i]<- mean(bitcoin_price_sorted_2016[bitcoin_price_sorted_2016$Month == i,]$High)
  tabMoyVol2016[i]<- mean(bitcoin_price_sorted_2016[bitcoin_price_sorted_2016$Month == i,]$Volume)
  
  ##variance pour chaque mois
  tabVarLow2016[i]<- var(bitcoin_price_sorted_2016[bitcoin_price_sorted_2016$Month == i,]$Low)
  tabVarHigh2016[i]<- var(bitcoin_price_sorted_2016[bitcoin_price_sorted_2016$Month == i,]$High)
  tabVarVol2016[i]<- var(bitcoin_price_sorted_2016[bitcoin_price_sorted_2016$Month == i,]$Volume)

  ##ecart type pour chaque mois
  tabEcartLow2016[i] <- sqrt(tabVarLow2016[i])
  tabEcartHigh2016[i] <- sqrt(tabVarHigh2016[i])
  tabEcartVol2016[i] <- sqrt(tabVarVol2016[i])
}




