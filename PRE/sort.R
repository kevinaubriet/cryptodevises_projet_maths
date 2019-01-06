##import librairies

library(readr)
library(stringr)
library(lubridate)

variationBtc <- read_csv("data/bitcoin_variation.csv")

##Extraction de l'année
getYear <- function(str) {
  res <- str_split(str, ", ")[[1]][[length(str_split(str, ", ")[[1]])]]
  return(res)
}
##Extraction du mois
getMonth <- function(str){
  res <- str_split(str, ", ")[[1]][1]
  res <- str_split(res, " ")[[1]][1]
  return(res)
}
##Extraction du jour
getDay <- function(str){
  res <- str_split(str, ", ")[[1]][1]
  res <- str_split(res, " ")[[1]][2]
  return(res)
}

getVariation <- function(str){
  res <- str_replace(str, "%", "")
  return(res)
}

getData2015 <-function(src){
  res <- read.csv(src)
  ##Ajout des colonnes jour, mois et année
  ##pour faciliter le traitement des données
  for (i in 1:nrow(res)) {
    res$Day[i] <- as.numeric(getDay(res$Date[i]))
    res$Month[i] <- match(getMonth(res$Date[i]), month.abb)
    res$Year[i] <- as.numeric(getYear(res$Date[i]))
    
    ##Creation d'une nouvelle colonne Date
    ##Du type date plus exploitable
    date <- paste(res$Year[i], res$Month[i], sep = "-", collapse=NULL)
    date <- paste(date, res$Day[i], sep = "-", collapse=NULL)
    res$DateFormat[i] <- format(as.Date(date))
    
  }
  ##on ne conserve que les données datant au minimum de 2015
  resF<-res[res$Year>=2015,]
  
  ##tri dans l'ordre des années puis des mois
  resF <- resF[order(month(resF$Day)),]
  resF <- resF[order(month(resF$Month)),]
  resF <- resF[order(month(resF$Year)),]
  
  return(resF)
}

#récupération des données
bitcoin_price_sorted<-getData2015("data/all/bitcoin_price.csv")
 #bitconnect_price_sorted<-getData2015("data/all/bitconnect_price.csv")
#dash_price_sorted<-getData2015("data/all/dash_price.csv")
#ethereum_price_sorted<-getData2015("data/all/ethereum_price.csv")
#iota_price_sorted<-getData2015("data/all/iota_price.csv")
#litecoin_price_sorted<-getData2015("data/all/litecoin_price.csv")
#monero_price_sorted<-getData2015("data/all/monero_price.csv")
#nem_price_sorted<-getData2015("data/all/nem_price.csv")
#neo_price_sorted<-getData2015("data/all/neo_price.csv")
#numeraire_price_sorted<-getData2015("data/all/numeraire_price.csv")
#omisego_price_sorted<-getData2015("data/all/omisego_price.csv")
#qtum_price_sorted<-getData2015("data/all/qtum_price.csv")
#ripple_price_sorted<-getData2015("data/all/ripple_price.csv")
#stratis_price_sorted<-getData2015("data/all/stratis_price.csv")
#waves_price_sorted<-getData2015("data/all/waves_price.csv")

##Creation d'une nouvelle colonne Date
##Du type date plus exploitable
for(j in 1:nrow(variationBtc)){
  variationBtc$Year[j] <- as.numeric(year(variationBtc$Date[j]))
  variationBtc$Variation[j] <- as.numeric(getVariation(variationBtc$`Variation 24h`[j]))
}

##on ne conserve que les données datant au minimum de 2015
variationBtc_sorted <- variationBtc[variationBtc$Year >= 2015,]
variationBtc_sorted<- variationBtc_sorted[,-2]
variationBtc_sorted<- variationBtc_sorted[,-2]



