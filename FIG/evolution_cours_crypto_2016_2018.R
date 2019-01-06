library(forcats)
library(scales)
library(ggplot2)
library(lubridate)
library(tidyr)

getData2016 <-function(tab){
  tab$Year <- as.factor(tab$Year)
  res <- subset(tab, tab$Year != 2015)
  return(res)
}

bitcoin_price_sorted_all <- getData2016(bitcoin_price_sorted)
dash_price_sorted_all <- getData2016(dash_price_sorted)
ethereum_price_sorted_all <- getData2016(ethereum_price_sorted)
litecoin_price_sorted_all <- getData2016(litecoin_price_sorted)
monero_price_sorted_all <- getData2016(monero_price_sorted)
nem_price_sorted_all <- getData2016(nem_price_sorted)
ripple_price_sorted_all <- getData2016(ripple_price_sorted)

resultats <- data.frame(bitcoin= bitcoin_price_sorted_all$Close, dash=dash_price_sorted_all$Close, etherum=ethereum_price_sorted_all$Close,litecoin= litecoin_price_sorted_all$Close, monero=monero_price_sorted_all$Close, nem=nem_price_sorted_all$Close,ripple=ripple_price_sorted_all$Close, Moi=bitcoin_price_sorted_all$Month ,Jour=bitcoin_price_sorted_all$DateFormat)

prediction2 <- gather(
  data = resultats,
  key = TYPE,
  value = VAL,
  bitcoin, dash, etherum, litecoin, monero, nem, ripple
)

ggplot(
  prediction2,
  aes(x = as.Date(Jour), y = VAL, color = TYPE),
)+scale_x_date(name="Years", labels = date_format("%Y"), breaks = "1 year")+
geom_line()