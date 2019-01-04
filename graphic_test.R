# Create the data for the chart.
v <- c(7,12,28,3,41)
t <- c(14,7,6,19,3)

# Give the chart file a name.
png(file = "graphic_test.jpg")

# Plot the bar chart.
plot(v,type = "o",col = "red", xlab = "Month", ylab = "Rain fall", 
     main = "Rain fall chart")

lines(t, type = "o", col = "blue")

# Save the file.
dev.off()

##import librairies
library(readr)
library(stringr)



getAnnee <- function(str) {
  res <- str_split(str, ", ")[[1]][[length(str_split(str, ", ")[[1]])]]
  return(res)
}


bitcoin_price <- read_csv("data/all/bitcoin_price.csv")
##bitcoin_price_sorted <- bitcoin_price[sapply(strsplit(bitcoin_price$Date, ","), tail, 1) >= "2015",]
bitcoin_price_sorted <- bitcoin_price[bitcoin_price$Date > "2015",]
getAnnee(bitcoin_price$Date)