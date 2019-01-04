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

##courbe de l'évolution du cours du bitcoin en 2016
graph <- ggplot(bitcoin_price_sorted_2016, aes(x=as.Date(DateFormat), y=Open, group=1))
graph <- graph + scale_y_continuous(name="Open", limits=c(min(bitcoin_price_sorted_2016$Open), max(bitcoin_price_sorted_2016$Open)))
graph <- graph + scale_x_date(name="Months", labels = date_format("%b"), breaks = "1 month")
graph <- graph + geom_line(size=1) 

##courbe de l'évolution du cours du bitcoin en 2017
#graph <- ggplot(bitcoin_price_sorted_2017, aes(x=as.Date(DateFormat), y=Open, group=1))

#graph <- graph + geom_line(size=1) 

print(graph)

#View(bitcoin_price_sorted_2016)
#View(bitcoin_price_sorted_2017)