library(readxl)
library(ggplot2)

QualidadeAR <- read_excel("QualidadeARO3.xlsx")

dataFrame <- data.frame(QualidadeAR)[, c("Paio.Pires", "Sobreiras.Porto")]

dataFrame <- tidyr::pivot_longer(dataFrame, cols = c('Paio.Pires', 'Sobreiras.Porto'), 
                                   names_to = 'Estações',
                                   values_to = 'QualidadeAR',
                                 values_transform = as.numeric)

library(dplyr)
#library(hrbrthemes)

gráfico <- dataFrame %>%
  ggplot( aes(x=QualidadeAR, fill=Estações)) +
  geom_histogram( color="#e9ecef", alpha=0.6, position = 'identity') +
  scale_fill_manual(values=c("#69b3a2", "#404080"))

print(gráfico + labs(y = "Número de observações", x = "Qualidade do Ar",
                     fill = "Estações") +
        ggtitle("Qualidade do ar registada em 2020 nas estações Paio-Pires e Sobreiras-Porto"))


#### Pensar em escolher outras cores
#### Maybe ver um theme para o ggplot
#### Ver oq faz o scale_fill_manual bem como o alpha=0.6