library(readxl)
library(ggplot2)
library(dplyr)
EsperancaVida <- read_excel("EsperancaVida.xlsx", range="A9:CY69")
#View(EsperancaVida)

dataFrame <- data.frame(EsperancaVida)
dataFrame <- dataFrame[, c('...1','BE...B�lgica...41','BE...B�lgica...75', 
                           'CH...Su��a...69', 'CH...Su��a...103', 
                           'LV...Let�nia...56','LV...Let�nia...90')]

dataFrame <- dataFrame %>% slice(43:n())

colnames(dataFrame) <- c('Anos', 'B�lgica', 'B�lgica',
                         'Su��a', 'Su��a',
                         'Let�nia', 'Let�nia')

dataFrame


dataFrame <- tidyr::pivot_longer(dataFrame, cols = c('B�lgica', 
                                                     'B�lgica',
                                                     'Su��a', 
                                                     'Su��a',
                                                     'Let�nia', 
                                                     'Let�nia'), 
                                   names_to = 'Pa�s',
                                   values_to = 'Esperan�aM�diaDeVida')

dataFrame$Sexo <- rep(c("Homem", "Mulher"), length.out=nrow(dataFrame))

dataFrame

dataPlot <- ggplot(data = dataFrame) + 
  geom_line(stat = 'identity', mapping = aes(x = Anos , 
                                                 y = Esperan�aM�diaDeVida, 
                                                 colour = Pa�s, 
                                             linetype = Sexo)) +

                  geom_jitter(stat = 'identity', 
                              mapping = aes(x = Anos , y = Esperan�aM�diaDeVida,
                                            colour = Pa�s))

print(dataPlot + labs(y = "Esperan�a M�dia de Vida (anos)") +
        ggtitle("Esperan�a m�dia de vida entre 2002 e 2019"))
