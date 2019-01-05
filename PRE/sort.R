##import librairies

library(readr)
library(stringr)
library(lubridate)


bitcoin_price <- read_csv("data/all/bitcoin_price.csv")
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

##Ajout des colonnes jour, mois et année
##pour faciliter le traitement des données
for (i in 1:nrow(bitcoin_price)) {
  bitcoin_price$Day[i] <- as.numeric(getDay(bitcoin_price$Date[i]))
  bitcoin_price$Month[i] <- match(getMonth(bitcoin_price$Date[i]), month.abb)
  bitcoin_price$Year[i] <- as.numeric(getYear(bitcoin_price$Date[i]))
  
  ##Creation d'une nouvelle colonne Date
  ##Du type date plus exploitable
  date <- paste(bitcoin_price$Year[i], bitcoin_price$Month[i], sep = "-", collapse=NULL)
  date <- paste(date, bitcoin_price$Day[i], sep = "-", collapse=NULL)
  bitcoin_price$DateFormat[i] <- format(as.Date(date))
}

##on ne conserve que les données datant au minimum de 2015
bitcoin_price_sorted <- bitcoin_price[bitcoin_price$Year >= 2015,]

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


