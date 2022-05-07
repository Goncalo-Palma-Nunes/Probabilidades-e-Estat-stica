seed <- 1637
num_amostras <- 500
lim_inf <- 3
lim_sup <- 7

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

hist(histograma_n(5), xlab = 'Médias das amostras', main='Histograma para n = 5', col = 'aquamarine')
hist(histograma_n(29), xlab = 'Médias das amostras', main='Histograma para n = 29', col = 'aquamarine')
hist(histograma_n(68), xlab = 'Médias das amostras', main='Histograma para n = 68', col = 'aquamarine')