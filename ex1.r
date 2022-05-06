library(readxl)
library(ggplot2)
library(tidyr)
library(dplyr)
library(stringr)

ResiduosPerCapitaData <- read_excel("ResiduosPerCapita.xlsx", range="A13:C43",
                                    col_names = FALSE)

dframe <- data.frame(Países = ResiduosPerCapitaData$...1, 
                     '...2004' = ResiduosPerCapitaData$...2, 
                     '...2018' = ResiduosPerCapitaData$...3)

dframe <- dframe %>% dplyr::filter(str_detect(Países, 'RO|IS|BG'))

dframe


dframe_tidy <- tidyr::pivot_longer(dframe, cols = c('...2004', '...2018'), 
                                   names_to = 'Anos',
                                   values_to = 'ResiduosPerCapita')

ggplot(data = dframe_tidy) + 
  geom_bar(stat = "identity", mapping = aes(x = Países , 
                                            y = ResiduosPerCapita, fill = Anos),
           position = "dodge")
