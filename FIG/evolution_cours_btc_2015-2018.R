source('./PRE/sort.R')
library(forcats)
library(scales)
library(ggplot2)
library(lubridate)
library(tidyr)

#bitcoin_price_sorted <- bitcoin_price_sorted[order(bitcoin_price_sorted$Day),]
#bitcoin_price_sorted <- bitcoin_price_sorted[order(bitcoin_price_sorted$Month),]
bitcoin_price_sorted$Year <- as.factor(bitcoin_price_sorted$Year)

##### FIN RECUP DATAS

##courbe de l'évolution du cours du bitfocoin en 2016 & 2017 & 2018
##UNIQUE LINE
ggplot(bitcoin_price_sorted, aes(x=as.Date(DateFormat), y=Open, color=Year, group=Year)) +
  #scale_y_continuous(name="Open", limits=c(min(bitcoin_price_sorted$Open), max(bitcoin_price_sorted$Open)))+
  scale_x_date(name="Months", labels = date_format("%b"), breaks = "1 month")+
  geom_line(aes(colour=Year), size=1)

##courbe de l'évolution du cours du bitfocoin en 2016 & 2017 & 2018
##MULTIPLE LINES
bitcoin_price_sorted$Year <- as.factor(bitcoin_price_sorted$Year)

bitcoin_price_sorted2016 <-bitcoin_price_sorted[bitcoin_price_sorted$Year == 2016,]

bitcoin_price_sorted2016 <- bitcoin_price_sorted2016[-60,] # On supprime la 60eme ligne (qui equivaut au 29 juillet)


bitcoin_price_sorted2015 <-bitcoin_price_sorted[bitcoin_price_sorted$Year == 2015,]
bitcoin_price_sorted2017 <-bitcoin_price_sorted[bitcoin_price_sorted$Year == 2017,]

resultats <- data.frame(Val2015= bitcoin_price_sorted2015$Close, Val2016=bitcoin_price_sorted2016$Close, Val2017=bitcoin_price_sorted2017$Close, Moi=bitcoin_price_sorted2015$Month ,Jour=bitcoin_price_sorted2015$DateFormat)

prediction2 <- gather(
  data = resultats,
  key = TYPE,
  value = VAL,
  Val2015,Val2016, Val2017
)

ggplot(
  prediction2,
  aes(x = as.Date(Jour), y = VAL, color = TYPE),
)+scale_x_date(name="Months", labels = date_format("%b"), breaks = "1 month")+
  geom_line()