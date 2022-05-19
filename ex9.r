library('EnvStats')
library(ggplot2)

seed <- 846
m <- 1450
n <- seq(from=100, to=5000, by=100)
lambda = 0.62
confianca = 0.9
MA <- c()


set.seed(seed)
for (val in n) {
  i = 0
  amplitudes <- c()
  while (i < m) {
    amostra <- rexp(val, lambda)
    aaa <- eexp(amostra, ci=TRUE, conf = confianca)
    
    lim_inf <- unname((aaa$interval$limits)[1])
    lim_sup <- unname((aaa$interval$limits)[2])
    amplitudes <- append(amplitudes, (lim_sup - lim_inf))
    i = i + 1
  }
  MA <- append(MA, mean(amplitudes))
}
print('aaaaaa')
dados <- data.frame(xax=n, yax=MA)
dados

ggplot(data = dados) + 
  geom_point(aes(x=xax, y=yax))