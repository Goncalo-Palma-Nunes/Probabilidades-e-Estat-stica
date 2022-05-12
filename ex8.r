library('EnvStats')

seed = 194
m = 500
n = 609
lambda = 0.57
valorEsperado = 1 / lambda
set.seed(seed)
confianca = 0.99

set.seed(seed)
i = 0
amplitudes <- c()
while (i < m) {
  amostra <- rexp(n, lambda)
  aaa <- eexp(amostra, ci=TRUE, conf = confianca)

  lim_inf <- unname((aaa$interval$limits)[1])
  lim_sup <- unname((aaa$interval$limits)[2])
  amplitudes <- append(amplitudes, (lim_sup - lim_inf))
  i = i + 1
}
mean(amplitudes)
