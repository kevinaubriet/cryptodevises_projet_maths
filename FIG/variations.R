library(ggplot2)
library(reshape2)
variationBtc_sorted_2016 <- variationBtc_sorted[variationBtc_sorted$Year == 2016,]
#variationBtc_sorted_2016$Date <- as.yearmon(variationBtc_sorted_2016$Date)

variationBtc_sorted_2017 <- variationBtc_sorted[variationBtc_sorted$Year == 2017,]
#variationBtc_sorted_2017$Date <- as.yearmon(variationBtc_sorted_2017$Date)

#variationBtc_sorted$Year <- as.factor(variationBtc_sorted$Year)


plot(variationBtc_sorted_2016$Variation ~ variationBtc_sorted_2016$Date, main="Titre", ylab="Axe y", xlab="Axe x", type="l",
     col="blue")
lines(variationBtc_sorted_2017$Variation ~ variationBtc_sorted_2016$Date, col="red", type="l")
legend("topleft", c("Courbe 1", "Courbe 2"), fill=c("blue","red"))

variationBtc_sorted_melt <- melt(variationBtc_sorted, id.vars='Date', variable.name = 'Variation')
ggplot(variationBtc_sorted_melt, aes(Date, Variation))+
  geom_line(aes(colour = year(Date)))

ggplot(rbind(variationBtc_sorted_2016, variationBtc_sorted_2017), 
       aes(month(Date, label=TRUE, abbr=TRUE), 
           Variation, 
           group=factor(year(Date)),
           colour=factor(year(Date)))) +
  geom_line() +
  labs(x="Month", colour="Year") +
  theme_classic()

#ggplot(variationBtc_sorted, aes(x=Date, y=Variation, group=year(as.Date(Date)))) +
  #scale_x_date(name="Months", labels = date_format("%b"), breaks = "1 month")+
  #geom_line(aes(colour=Year), size=1)