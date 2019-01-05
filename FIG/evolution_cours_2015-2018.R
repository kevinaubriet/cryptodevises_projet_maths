source('./PRE/sort.R')
library(forcats)
library(scales)
library(ggplot2)
library(lubridate)

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
ggplot(bitcoin_price_sorted, aes(x=Date, y=Open, color=Year, group=Year)) +
  #scale_y_continuous(name="Open", limits=c(min(bitcoin_price_sorted$Open), max(bitcoin_price_sorted$Open)))+
  #scale_x_date(name="Months", labels = date_format("%b"), breaks = "1 month")+
  geom_line(aes(colour=Year), size=1)