source('./sort.R')
library(forcats)


bitcoin_price_sorted_2016 <- bitcoin_price_sorted[bitcoin_price_sorted$Year == 2016,]
bitcoin_price_sorted_2016 <- bitcoin_price_sorted_2016[order(bitcoin_price_sorted_2016$Day),]
bitcoin_price_sorted_2016 <- bitcoin_price_sorted_2016[order(bitcoin_price_sorted_2016$Month),]

##courbe de l'évolution du cours du bitcoin en 2016
graph <- ggplot(bitcoin_price_sorted_2016, aes(x=fct_inorder(Date), y=Low, colour="blue", shape="square", group=1))
graph <- graph + geom_line(size=1)
print(graph)
##View(bitcoin_price_sorted_2016)

catin<-summary(bitcoin_price_sorted$Year)
compte <- table(bitcoin_price_sorted$Year)
print(catin)
barplot(compte)

