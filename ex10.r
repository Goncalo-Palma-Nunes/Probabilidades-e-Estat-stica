library('EnvStats')
library(ggplot2)

seed <- 600
m <- 1300
n <- seq(from=100, to=2500, by=100)
lambda = 0.35
lambda_outlier = 0.08
confianca = 0.92
MA <- c()
MAc <- c()


set.seed(seed)
for (val in n) {
  i = 0
  amplitudes <- c()
  amplitudes_c <- c()
  while (i < m) {
    percentagem_contam = val * 0.25
    amostra <- rexp(val, lambda)
    amostra_contaminada <- sample(amostra, (val * 0.75))
    contaminacao <- rexp(percentagem_contam, lambda_outlier)
    amostra_contaminada <- c(amostra_contaminada, contaminacao)
    aaa <- eexp(amostra, ci=TRUE, conf = confianca)
    bbb <- eexp(amostra_contaminada, ci=TRUE, conf = confianca)
    
    lim_inf <- unname((aaa$interval$limits)[1])
    lim_sup <- unname((aaa$interval$limits)[2])
    lim_sup_c <- unname((bbb$interval$limits[2]))
    lim_inf_c <- unname((bbb$interval$limits[1]))
    amplitudes <- append(amplitudes, (lim_sup - lim_inf))
    amplitudes_c <- append(amplitudes_c, (lim_sup_c - lim_inf_c))
    i = i + 1
  }
  MA <- append(MA, mean(amplitudes))
  MAc <- append(MAc, mean(amplitudes_c))
}

dados <- data.frame(n=n, MA=MA, MAc=MAc)

dados <- tidyr::pivot_longer(dados, cols = c('MA', 'MAc'), 
                             names_to = 'TipoDeAmostra',
                             values_to = 'MédiadeAmplitudes')

ggplot(data = dados) + 
  geom_jitter(aes(x=n, y=MédiadeAmplitudes, colour=TipoDeAmostra))
