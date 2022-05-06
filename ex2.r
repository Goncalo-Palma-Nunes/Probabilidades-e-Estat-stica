library(readxl)
library(ggplot2)
library(dplyr)
EsperancaVida <- read_excel("EsperancaVida.xlsx", range="A9:CY69")
#View(EsperancaVida)

dataFrame <- data.frame(EsperancaVida)
dataFrame <- dataFrame[, c('...1','BE...Bélgica...7','BE...Bélgica...75', 
                           'CH...Suíça...69', 'CH...Suíça...103', 
                           'LV...Letónia...56','LV...Letónia...90')]

dataFrame <- dataFrame %>% slice(43:n())

colnames(dataFrame) <- c('Anos', 'Bélgica (Homens)', 'Bélgica (Mulheres)',
                         'Suíça (Homens)', 'Suíça (Mulheres)',
                         'Letónia (Homens)', 'Letónia (Mulheres)')

dataFrame


dataFrame <- tidyr::pivot_longer(dataFrame, cols = c('Bélgica (Homens)', 
                                                     'Bélgica (Mulheres)',
                                                     'Suíça (Homens)', 
                                                     'Suíça (Mulheres)',
                                                     'Letónia (Homens)', 
                                                     'Letónia (Mulheres)'), 
                                   names_to = 'SexoPorPaís',
                                   values_to = 'EsperançaMédiaDeVida')

dataFrame$Sexo <- rep(c("Homem", "Mulher"), length.out=nrow(dataFrame))

dataFrame

dataPlot <- ggplot(data = dataFrame) + 
  geom_freqpoly(stat = 'identity', mapping = aes(x = Anos , 
                                                 y = EsperançaMédiaDeVida, 
                                                 colour = SexoPorPaís)) +
                  geom_jitter(stat = 'identity', 
                              mapping = aes(x = Anos , y = EsperançaMédiaDeVida,
                                            colour = SexoPorPaís))

print(dataPlot + labs(y = "Esperança Média de Vida (anos)", 
                      colour = ("Sexo por País")) +
        ggtitle("Esperança média de vida entre 2002 e 2019"))
