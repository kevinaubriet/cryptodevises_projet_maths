source('./PRE/sort.R')
library(ggplot2)
library(reshape2)
library(tidyr)

variationBtc_sorted_2016 <- variationBtc_sorted[variationBtc_sorted$Year == 2016,]
variationBtc_sorted_2016 <- variationBtc_sorted_2016[-60,]

variationBtc_sorted_2017 <- variationBtc_sorted[variationBtc_sorted$Year == 2017,]

## Création d'un nouveau data frame
## Plus exploitable
df <- data.frame(Val2016 = variationBtc_sorted_2016$Variation, 
                 Val2017 = variationBtc_sorted_2017$Variation, 
                 Month=variationBtc_sorted_2016$Month,
                 Date=variationBtc_sorted_2016$Date)

datas <- gather(
  data = df,
  key = TYPE,
  value = VAL,
  Val2016, Val2017
)

## Variations du cours du bitcoin en 2016 & 2017
## En %

ggplot(
  datas,
  aes(x = as.Date(Date), y = VAL, color = TYPE),)+
  scale_x_date(name="Months", labels = date_format("%b"), breaks = "1 month")+
  geom_line()