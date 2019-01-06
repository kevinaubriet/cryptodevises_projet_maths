getLastMarketCap<-function(tab){
  tab$Year <- as.factor(tab$Year)
  col<-tab$Market.Cap
  val<-tail(col,1)
  val <- str_replace_all(val, ",", "")
  res<-as.numeric(val)
  
  return(res)
}

bitcoin_marketcap <- getLastMarketCap(bitcoin_price_sorted)
dash_marketcap <- getLastMarketCap(dash_price_sorted)
ethereum_marketcap <- getLastMarketCap(ethereum_price_sorted)
litecoin_marketcap <- getLastMarketCap(litecoin_price_sorted)
monero_marketcap <- getLastMarketCap(monero_price_sorted)
nem_marketcap <- getLastMarketCap(nem_price_sorted)
ripple_marketcap <- getLastMarketCap(ripple_price_sorted)

tab = c(bitcoin_marketcap,dash_marketcap,ethereum_marketcap,litecoin_marketcap,monero_marketcap,nem_marketcap,ripple_marketcap)

pie(tab,main="Part des crypto-monnaies (en%)",col = c("#FF0101","#4401FF","#01BBFF","#01FF4D","#F7FF01","#EE01FF","#FF9101"),labels = c("bitcoin","dash","ethereum","litecoin","","","ripple"),cex=1.5)


# Calculer pourcentages correspondant à chaque valeurs
total = sum(tab)
pourcentages = tab/total*100 ; cat("Les valeurs en % sont de :",pourcentages,"\n")
# Fonction à coller dans R - cette fonction text_pie permet d'ajouter des étiquettes au centre des quartiers
text_pie = function(vector,labels=c(),cex=1) {
  vector = vector/sum(vector)*2*pi
  temp = c()
  j = 0
  l = 0
  for (i in 1:length(vector)) {
    k = vector[i]/2        
    j =  j+l+k
    l = k
    text(cos(j)/2,sin(j)/2,labels[i],cex=cex)
  }
  vector = temp
}
pourcentage_affichage <- round(pourcentages,2)
# Ajouter les étiquettes
text_pie(pourcentages,c(pourcentage_affichage[1],pourcentage_affichage[2],pourcentage_affichage[3],pourcentage_affichage[4], "", "" ,pourcentage_affichage[6]),cex=1.1) # Ces valeurs en % sont à remplacer manuellement

legend(x="bottomright", legend=c("bitcoin","dash","ethereum","litecoin","monero","nem","ripple"), cex=1,fill=c("#FF0101","#4401FF","#01BBFF","#01FF4D","#F7FF01","#EE01FF","#FF9101"))




