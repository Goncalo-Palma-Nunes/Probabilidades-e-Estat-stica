install.packages("tidyverse")
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
  return(data.frame(medias=vetor_medias))
}

densidade_n <- function(n) {
  sequencia <- seq(lim_inf, lim_sup, length.out = 200)
  return(dnorm(sequencia, valorEsperado, variancia / n))
}

desenha <- function(n) {
  df <- histograma_n(n)
  ggplot(data=df) +
    geom_histogram(aes(x=medias, colour='aquamarine')) +
    geom_line(aes(x=densidade_n(n)))
  print('aaaa')
}

desenha(5)
#hist(histograma_n(5), xlab = 'Medias das amostras', main='Histograma para n = 5', col = 'aquamarine')
hist(histograma_n(5), xlab = 'Medias das amostras', main='Histograma para n = 5', col = 'aquamarine')
plot(densidade_n(5), colour='red')
points(densidade_n(5))
hist(histograma_n(29), xlab = 'Medias das amostras', main='Histograma para n = 29', col = 'aquamarine')
hist(histograma_n(68), xlab = 'Medias das amostras', main='Histograma para n = 68', col = 'aquamarine')
