source('./sort.R')
library(forcats)
library(scales)

##datas 2016
bitcoin_price_sorted_2016 <- bitcoin_price_sorted[bitcoin_price_sorted$Year == 2016,]
bitcoin_price_sorted_2016 <- bitcoin_price_sorted_2016[order(bitcoin_price_sorted_2016$Day),]
bitcoin_price_sorted_2016 <- bitcoin_price_sorted_2016[order(bitcoin_price_sorted_2016$Month),]

##datas 2017
bitcoin_price_sorted_2017 <- bitcoin_price_sorted[bitcoin_price_sorted$Year == 2017,]
bitcoin_price_sorted_2017 <- bitcoin_price_sorted_2017[order(bitcoin_price_sorted_2017$Day),]
bitcoin_price_sorted_2017 <- bitcoin_price_sorted_2017[order(bitcoin_price_sorted_2017$Month),]

##### FIN RECUP DATAS

##courbe de l'évolution du cours du bitcoin en 2016 & 2017
ggplot(bitcoin_price_sorted, aes(x=as.Date(DateFormat), y=Open, color=factor(Year))) +
  #scale_y_continuous(name="Open", limits=c(min(bitcoin_price_sorted$Open), max(bitcoin_price_sorted$Open)))+
  scale_x_date(name="Months", labels = date_format("%b"), breaks = "1 month")+
  geom_line(aes(group=factor(Year)), size=1)