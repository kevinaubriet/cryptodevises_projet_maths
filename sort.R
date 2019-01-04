##import librairies
library(readr)
library(stringr)



getYear <- function(str) {
  res <- str_split(str, ", ")[[1]][[length(str_split(str, ", ")[[1]])]]
  return(res)
}

getMonth <- function(str){
  res <- str_split(str, ", ")[[1]][1]
  res <- str_split(res, " ")[[1]][1]
  return(res)
}

getDay <- function(str){
  res <- str_split(str, ", ")[[1]][1]
  res <- str_split(res, " ")[[1]][2]
  return(res)
}

bitcoin_price <- read_csv("data/all/bitcoin_price.csv")

test1 <- getMonth(bitcoin_price[1,1])

View(test1)
View(bitcoin_price_sorted)



