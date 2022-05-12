library(ggplot2)
seed <- 1637
num_amostras <- 500
lim_inf <- 3
lim_sup <- 7
valorEsperado <- (lim_inf + lim_sup) / 2

histograma_n <- function(n) {
  vetor_medias <- c()
  i = 0
  set.seed(seed)
  while (i < num_amostras) {
    amostra <- runif(n, min = lim_inf, max = lim_sup)
    vetor_medias <- append(vetor_medias, mean(amostra))
    i <- i + 1
  }
  return(vetor_medias)
}


desenha <- function(n) {
  Vx <- (16 / 12) / n
  desvio <- sqrt(Vx)
  medias <- histograma_n(n)

  hist(medias, col ='lightblue', freq = FALSE,
       main = "Histograma com curva normal",
       xlab = "Médias", ylab = "Frequência relativa")
  curve(dnorm(x, mean = valorEsperado, sd = desvio), add = TRUE, col = "darkblue")
}

desenha(5)
desenha(29)
desenha(68)
