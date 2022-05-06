library(readxl)
library(ggplot2)
library(dplyr)
EsperancaVida <- read_excel("EsperancaVida.xlsx", range="A9:CY69")
#View(EsperancaVida)

dataFrame <- data.frame(EsperancaVida)
dataFrame <- dataFrame[, c('...1','BE...Bélgica...41','BE...Bélgica...75', 
                           'CH...Suíça...69', 'CH...Suíça...103', 
                           'LV...Letónia...56','LV...Letónia...90')]

dataFrame <- dataFrame %>% slice(43:n())

colnames(dataFrame) <- c('Anos', 'Bélgica', 'Bélgica',
                         'Suíça', 'Suíça',
                         'Letónia', 'Letónia')

dataFrame


dataFrame <- tidyr::pivot_longer(dataFrame, cols = c('Bélgica', 
                                                     'Bélgica',
                                                     'Suíça', 
                                                     'Suíça',
                                                     'Letónia', 
                                                     'Letónia'), 
                                   names_to = 'País',
                                   values_to = 'EsperançaMédiaDeVida')

dataFrame$Sexo <- rep(c("Homem", "Mulher"), length.out=nrow(dataFrame))

dataFrame

dataPlot <- ggplot(data = dataFrame) + 
  geom_line(stat = 'identity', mapping = aes(x = Anos , 
                                                 y = EsperançaMédiaDeVida, 
                                                 colour = País, 
                                             linetype = Sexo)) +

                  geom_jitter(stat = 'identity', 
                              mapping = aes(x = Anos , y = EsperançaMédiaDeVida,
                                            colour = País))

print(dataPlot + labs(y = "Esperança Média de Vida (anos)") +
        ggtitle("Esperança média de vida entre 2002 e 2019"))
