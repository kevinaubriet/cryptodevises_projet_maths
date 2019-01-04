##import librairies
library(readr)
library(stringr)


bitcoin_price <- read_csv("data/all/bitcoin_price.csv")

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

##Ajout des colonnes jour, mois et année
##pour faciliter le traitement des données
for (i in 1:nrow(bitcoin_price)) {
  bitcoin_price$Day[i] <- as.numeric(getDay(bitcoin_price$Date[i]))
  bitcoin_price$Month[i] <- match(getMonth(bitcoin_price$Date[i]), month.abb)
  bitcoin_price$Year[i] <- as.numeric(getYear(bitcoin_price$Date[i]))
}

##on ne conserve que les données datant au minimum de 2015
bitcoin_price_sorted <- bitcoin_price[bitcoin_price$Year >= 2015,]
View(bitcoin_price_sorted)


library(ggplot2)

p1 <- ggplot() + 
  geom_line(aes(y = Open, x = Date), data = bitcoin_price_2016) +
  theme(text=element_text(family="Tahoma"))

p1 + labs(title = "Venezuela's collapsing car sales", x = "Year", y = "Thousands of units", caption = "Data: Cavenez.com")
