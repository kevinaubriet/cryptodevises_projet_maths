#on charge tous les csv 
bitcoin_cash <- read.csv("data/all/bitcoin_cash_price.csv")
bitcoin <- read.csv('data/all/bitcoin_price.csv')
bitconnect <- read.csv('data/all/bitconnect_price.csv')
dash <- read.csv('data/all/dash_price.csv')
ethereum_classic <- read.csv('data/all/ethereum_classic_price.csv')
ethereum <- read.csv('data/all/ethereum_price.csv')
iota <- read.csv('data/all/iota_price.csv')
litecoin <- read.csv('data/all/litecoin_price.csv')
nem <- read.csv('data/all/nem_price.csv')
monero <- read.csv('data/all/monero_price.csv')
numeraire <- read.csv('data/all/numeraire_price.csv')
omisego <- read.csv('data/all/omisego_price.csv')
neo <- read.csv('data/all/neo_price.csv')
ripple <- read.csv('data/all/ripple_price.csv')
stratis <- read.csv('data/all/stratis_price.csv')
qtum <- read.csv('data/all/qtum_price.csv')
waves <- read.csv('data/all/waves_price.csv')

# On les stocke dans un list, ainsi que les noms correspondants
list_crypto <- list(bitcoin_cash, bitcoin, bitconnect, dash, ethereum_classic, ethereum, iota,
          litecoin, nem, monero, numeraire, omisego, neo, ripple, stratis, qtum, waves)

list_crypto_name <- list("bitcoin_cash", "bitcoin", "bitconnect", "dash", "ethereum_classic", "ethereum", "iota",
          "litecoin", "nem", "monero", "numeraire", "omisego", "neo", "ripple", "stratis", "qtum", "waves")

#Construit une table contenant les 17 cryptos, avec le field correspondant
c1 <- list_crypto[[1]]$Open[1:213]
c2 <- list_crypto[[2]]$Open[1:213]
finalCO <- paste(c1,c2, sep=",")
for(i in 3:length(list_crypto))
{
	c <- list_crypto[[1]]$Open[1:213]
	finalCO <- paste(finalCO ,c, sep=",")
}
# On lance la fonction et on enregistre le csv
write.csv(finalCO , "final_csv_open.csv", na="", row.names = FALSE)

c3 <- list_crypto[[1]]$Close[1:213]
c4 <- list_crypto[[2]]$Close[1:213]
finalC <- paste(c3,c4, sep=",")
for(i in 3:length(list_crypto))
{
  c <- list_crypto[[1]]$Close[1:213]
  finalC <- paste(finalC ,c, sep=",")
}
# On lance la fonction et on enregistre le csv
write.csv(finalC , "final_csv_close.csv", na="", row.names = FALSE)

c5 <- list_crypto[[1]]$MarketCap[1:213]
c6 <- list_crypto[[2]]$MarketCap[1:213]
finalCM <- paste(c5,c6, sep=",")
for(i in 3:length(list_crypto))
{
  c <- list_crypto[[1]]$Close[1:213]
  finalCM <- paste(finalCM ,c, sep=",")
}
# On lance la fonction et on enregistre le csv
write.csv(finalCM , "final_csv_market_cap.csv", na="", row.names = FALSE)