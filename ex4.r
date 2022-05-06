library(readxl)
Utentes <- read_excel("Utentes.xlsx")

dataFrame <- data.frame(Utentes)

dataFrame

ggplot(data = dataFrame) +
  geom_jitter(mapping = aes(x=Colesterol, y=TAD, colour = TAD))

ggplot(data = dataFrame) +
  geom_jitter(mapping = aes(x=Colesterol, y=TAD, colour = Colesterol))

ggplot(data = dataFrame) +
  geom_point(mapping = aes(x=Colesterol, y=TAD))

dataFrame <- tidyr::pivot_longer(dataFrame, cols = c('Colesterol','TAD'), 
                                 names_to = 'Vari�veis',
                                 values_to = 'Valores')

ggplot(data = dataFrame) +
  geom_jitter(mapping = aes(x=Vari�veis, y = Valores, colour=Vari�veis, shape=Vari�veis, size = 1))