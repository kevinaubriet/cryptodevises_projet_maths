library(corrplot)

#calcule de la matrice de corrélation
correlationTable <- function(graphs) {
  #matrice de corrélation
  cross <- matrix(nrow = length(graphs), ncol = length(graphs))
  for(graph1Id in 1:length(graphs)){
    graph1 <- graphs[[graph1Id]]
    print(graph1Id)
    for(graph2Id in 1:length(graphs)) {
      graph2 <- graphs[[graph2Id]]
      if(graph1Id == graph2Id){
        break;
      } else {
        correlation <- ccf(graph1, graph2, lag.max = 0)
        cross[graph1Id, graph2Id] <- correlation$acf[1]
      }
    }
  }
  cross
}

#graphs de corrélation des open (bitcoin par rapport aux autres crypto)
corrO <- correlationTable(graphsO)
#renommage des colnames et rownames
colnames(corrO) <- c("bitcoin_cash", "bitcoin", "bitconnect", "dash", "ethereum_classic", "ethereum", "iota",
                    "litecoin", "nem", "monero", "numeraire", "omisego", "neo", "ripple", "stratis", "qtum", "waves")
rownames(corrO) <- c("bitcoin_cash", "bitcoin", "bitconnect", "dash", "ethereum_classic", "ethereum", "iota",
                    "litecoin", "nem", "monero", "numeraire", "omisego", "neo", "ripple", "stratis", "qtum", "waves")

#Corrélogramme : visualisation de la matrice de corrélation des open
corrplot(corrO, method="ellipse",type="lower")

#graphs de corrélation des close (bitcoin par rapport aux autres crypto)
corrC <- correlationTable(graphsC)
colnames(corrC) <- c("bitcoin_cash", "bitcoin", "bitconnect", "dash", "ethereum_classic", "ethereum", "iota",
                    "litecoin", "nem", "monero", "numeraire", "omisego", "neo", "ripple", "stratis", "qtum", "waves")
rownames(corrC) <- c("bitcoin_cash", "bitcoin", "bitconnect", "dash", "ethereum_classic", "ethereum", "iota",
                    "litecoin", "nem", "monero", "numeraire", "omisego", "neo", "ripple", "stratis", "qtum", "waves")

#graphs de corrélation des market cap (bitcoin par rapport aux autres crypto)
corrM <- correlationTable(graphsM)
colnames(corrM) <- c("bitcoin_cash", "bitcoin", "bitconnect", "dash", "ethereum_classic", "ethereum", "iota",
                    "litecoin", "nem", "monero", "numeraire", "omisego", "neo", "ripple", "stratis", "qtum", "waves")
rownames(corrM) <- c("bitcoin_cash", "bitcoin", "bitconnect", "dash", "ethereum_classic", "ethereum", "iota",
                    "litecoin", "nem", "monero", "numeraire", "omisego", "neo", "ripple", "stratis", "qtum", "waves")


