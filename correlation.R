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

#graphique de corrélation du bitcoin par rapport aux autres crypto
graphs <- read.csv("data/all/final_csv_market_cap.csv")
corr <- correlationTable(graphs)
corrplot(corr, method="circle") #on peut mettre d'autre forme

#rajouter une legende si le temps