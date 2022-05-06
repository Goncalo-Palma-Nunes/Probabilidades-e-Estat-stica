library(readxl)
library(ggplot2)
library(dplyr)
EsperancaVida <- read_excel("EsperancaVida.xlsx", range="A9:CY69")
#View(EsperancaVida)

dataFrame <- data.frame(EsperancaVida)
dataFrame <- dataFrame[, c('...1','BE...B�lgica...7','BE...B�lgica...75', 
                           'CH...Su��a...69', 'CH...Su��a...103', 
                           'LV...Let�nia...56','LV...Let�nia...90')]

dataFrame <- dataFrame %>% slice(43:n())

colnames(dataFrame) <- c('Anos', 'B�lgica (Homens)', 'B�lgica (Mulheres)',
                         'Su��a (Homens)', 'Su��a (Mulheres)',
                         'Let�nia (Homens)', 'Let�nia (Mulheres)')

dataFrame


dataFrame <- tidyr::pivot_longer(dataFrame, cols = c('B�lgica (Homens)', 
                                                     'B�lgica (Mulheres)',
                                                     'Su��a (Homens)', 
                                                     'Su��a (Mulheres)',
                                                     'Let�nia (Homens)', 
                                                     'Let�nia (Mulheres)'), 
                                   names_to = 'SexoPorPa�s',
                                   values_to = 'Esperan�aM�diaDeVida')

dataFrame$Sexo <- rep(c("Homem", "Mulher"), length.out=nrow(dataFrame))

dataFrame

dataPlot <- ggplot(data = dataFrame) + 
  geom_freqpoly(stat = 'identity', mapping = aes(x = Anos , 
                                                 y = Esperan�aM�diaDeVida, 
                                                 colour = SexoPorPa�s)) +
                  geom_jitter(stat = 'identity', 
                              mapping = aes(x = Anos , y = Esperan�aM�diaDeVida,
                                            colour = SexoPorPa�s))

print(dataPlot + labs(y = "Esperan�a M�dia de Vida (anos)", 
                      colour = ("Sexo por Pa�s")) +
        ggtitle("Esperan�a m�dia de vida entre 2002 e 2019"))
