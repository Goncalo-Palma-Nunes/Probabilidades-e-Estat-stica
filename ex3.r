library(readxl)
library(ggplot2)

QualidadeAR <- read_excel("QualidadeARO3.xlsx")

dataFrame <- data.frame(QualidadeAR)[, c("Paio.Pires", "Sobreiras.Porto")]

dataFrame <- tidyr::pivot_longer(dataFrame, cols = c('Paio.Pires', 'Sobreiras.Porto'), 
                                   names_to = 'Esta��es',
                                   values_to = 'QualidadeAR',
                                 values_transform = as.numeric)

library(dplyr)
#library(hrbrthemes)

gr�fico <- dataFrame %>%
  ggplot( aes(x=QualidadeAR, fill=Esta��es)) +
  geom_histogram( color="#e9ecef", alpha=0.6, position = 'identity') +
  scale_fill_manual(values=c("#69b3a2", "#404080"))

print(gr�fico + labs(y = "N�mero de observa��es", x = "Qualidade do Ar",
                     fill = "Esta��es") +
        ggtitle("Qualidade do ar registada em 2020 nas esta��es Paio-Pires e Sobreiras-Porto"))


#### Pensar em escolher outras cores
#### Maybe ver um theme para o ggplot
#### Ver oq faz o scale_fill_manual bem como o alpha=0.6