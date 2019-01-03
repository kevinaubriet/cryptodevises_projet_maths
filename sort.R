##import librairies
library(readr)

bitcoin_price <- read_csv("data/all/bitcoin_price.csv")
bitcoin_price_sorted <- bitcoin_price[bitcoin_price$Date >= "Jan 01, 2015",]
View(bitcoin_price_sorted)