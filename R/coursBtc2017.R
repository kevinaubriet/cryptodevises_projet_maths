source('./PRE/sort.R')

##2017

bitcoin_price_sorted_2017 <- bitcoin_price_sorted[bitcoin_price_sorted$Year == 2017,]

##moyenne de 2017
moyBtcMin2017 <- mean(bitcoin_price_sorted_2017$Low)
moyBtcMax2017 <- mean(bitcoin_price_sorted_2017$High)
moyBtcVo2017l <-mean(bitcoin_price_sorted_2017$Volume)

##variance de 2017
varBtcMin2017 <- var(bitcoin_price_sorted_2017$Low)
varBtcMax2017 <- var(bitcoin_price_sorted_2017$High)
varBtcVol2017 <- var(bitcoin_price_sorted_2017$Volume)

##ecrat type de 2017
ecartBtcMin2017 <- sqrt(varBtcMin2017)
ecartBtcMax2017 <- sqrt(varBtcMax2017)
ecartBtcVol2017 <- sqrt(varBtcVol2017)

tabMoyLow2017<-0
tabMoyHigh2017<-0
tabMoyVol2017<-0
tabVarLow2017<-0
tabVarHigh2017<-0
tabVarVol2017<-0
tabEcartLow2017<-0
tabEcartHigh2017<-0
tabEcartVol2017<-0

##boucle permettant de remplir les tableaux de mois
for(i in 1:12){
  ##moyenne pour chaque mois
  tabMoyLow2017[i]<- mean(bitcoin_price_sorted_2017[bitcoin_price_sorted_2017$Month == i,]$Low)
  tabMoyHigh2017[i]<- mean(bitcoin_price_sorted_2017[bitcoin_price_sorted_2017$Month == i,]$High)
  tabMoyVol2017[i]<- mean(bitcoin_price_sorted_2017[bitcoin_price_sorted_2017$Month == i,]$Volume)
  
  ##variance pour chaque mois
  tabVarLow2017[i]<- var(bitcoin_price_sorted_2017[bitcoin_price_sorted_2017$Month == i,]$Low)
  tabVarHigh2017[i]<- var(bitcoin_price_sorted_2017[bitcoin_price_sorted_2017$Month == i,]$High)
  tabVarVol2017[i]<- var(bitcoin_price_sorted_2017[bitcoin_price_sorted_2017$Month == i,]$Volume)
  
  ##ecart type pour chaque mois
  tabEcartLow2017[i] <- sqrt(tabVarLow2017[i])
  tabEcartHigh2017[i] <- sqrt(tabVarHigh2017[i])
  tabEcartVol2017[i] <- sqrt(tabVarVol2017[i])
}