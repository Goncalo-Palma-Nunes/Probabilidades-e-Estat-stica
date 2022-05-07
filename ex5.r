set.seed(1368)
n = 650
lambda = 0.21
x = 6

##### P(X >= y) = 1 - P(X <= y) (=) P(X <= y) = 1 - P(X >= y)
###Probabilidade pedida P(X > 6) = 1 - P(X <= 6) = 1 - Fx(6) = pexp(6, lambda, lower.tail = FALSE) ----> p�ginas 33 e 77 dos slides
probabilidadeTe�rica = 1 - (1 - exp(-1 * lambda * x))
probabilidadeTe�rica

probabilidadeTe�rica2 = pexp(6, lambda, lower.tail = FALSE)
probabilidadeTe�rica2

amostra <- rexp(n, lambda)
amostra

numMaioresQueX = 0
for (val in amostra) {
  if (val > 6) {
    numMaioresQueX = numMaioresQueX + 1
  }
}
numMaioresQueX
probabilidadeExperimental = numMaioresQueX / n
probabilidadeExperimental

diferen�a = abs(probabilidadeTe�rica - probabilidadeExperimental)
diferen�a