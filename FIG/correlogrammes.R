#source("./R/correlation.R")

#Corrélogramme : visualisation de la matrice de corrélation des open
corrplot(corrO, type="lower",title = "Open")

#Corrélogramme : visualisation de la matrice de corrélation des close
corrplot(corrC, type="lower",title = "Close")

#Corrélogramme : visualisation de la matrice de corrélation des marketCap
corrplot(corrM, type="lower",title = "MarketCap")
