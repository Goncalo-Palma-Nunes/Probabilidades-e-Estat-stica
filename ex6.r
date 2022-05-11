#install.packages("tidyverse")
library(ggplot2)
seed <- 1637
num_amostras <- 500
lim_inf <- 3
lim_sup <- 7
valorEsperado <- (lim_inf + lim_sup) / 2
variancia <- (lim_sup - lim_inf)^2 / 12

histograma_n <- function(n) {
  vetor_medias <- c()
  i = 0
  set.seed(seed)
  while (i < num_amostras) {
    amostra <- runif(n, lim_inf, lim_sup)
    vetor_medias <- append(vetor_medias, mean(amostra))
    i <- i + 1
  }
  return(vetor_medias)
}

densidade_n <- function(n) {
  sequencia <- seq(lim_inf, lim_sup, length.out = 200)
  return(dnorm(sequencia, valorEsperado, variancia / n))
}

desenha <- function(n) {
  #hist(histograma_n(n))
  #plot(densidade_n(n), col=rgb(0,0,1,1/4), add=T)
  med <- histograma_n(n)
  df <- data.frame(medias=med)
  ggplot(df, aes(x = medias)) +
    geom_histogram(aes(y=..density..), colour = 1, fill = 'lightblue') +
    geom_density(colour='blue', fill='lightblue', alpha = 0.7) +
    labs(x='Médias', y='Frequência Relativa')
  
  ################
  #medias <- histograma_n(n)
  #sequencia <- seq(min(medias), max(medias), length.out = 20000)
  ###sequencia <- seq(lim_inf, lim_sup, length.out = 200)
  #curva <- dnorm(sequencia, valorEsperado, variancia / n)
  
  
  #hist(medias, prob=TRUE, col ='lightblue',
  #     main = "Histograma com curva normal",
  #     xlab = "Médias", ylab = "Frequência relativa")
  #lines(sequencia, curva, col = 2, lwd = 2)
#############
  
  
#  hist(histograma_n(n), prob = TRUE, col = "lightblue",
       #ylim = c(0, max(curva)),
#       main = "Histograma com curva normal",
#       xlab = "Médias", ylab = "Frequência relativa")
#  lines(sequencia, curva, col = 2, lwd = 2)
#  labs(x="aaa", y="bbb")
  
  
  
  #ggplot(data=data.frame(medias=histograma_n(n))) +
    #geom_histogram(aes(x=medias),  colour="#e9ecef", alpha=0.6, fill='blue')# +
    #geom_density(aes(x=dens))
    #geom_histogram(aes(x=medias, colour='aquamarine')) +
    #geom_line(aes(x=densidade_n(n)))
  #print('aaaa')
}
#plot(densidade_n(5))
desenha(5)
desenha(29)
desenha(68)

sequencia <- seq(lim_inf, lim_sup, length.out = 20000)
curva <- dnorm(sequencia, valorEsperado, variancia / n)
plot(densidade_n(5))

plot( g3, col=rgb(1,0,0,1/4))  # second
plot( g2, col=rgb(0,0,1,1/4), add=T)  # first histogram
plot( g1, col=rgb(0,1,0,1/4), add=T)  # first histogram


########ATENÇÂO ATENÇÂO ATENÇÂO ATENÇÂO###############
####### Ainda falta parte do exercício,  #############
# Faça o histograma de frequência relativa associado aos valores 
# obtidos da distribuição da média  X¯n
# Sobreponha no gráfico uma curva com a distribuição normal com valor
# esperado E(X) e variância Var(X)/n.
