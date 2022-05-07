set.seed(1368)
n = 650
lambda = 0.21
x = 6

##### P(X >= y) = 1 - P(X <= y) (=) P(X <= y) = 1 - P(X >= y)
###Probabilidade pedida P(X > 6) = 1 - P(X <= 6) = 1 - Fx(6) = pexp(6, lambda, lower.tail = FALSE) ----> páginas 33 e 77 dos slides
probabilidadeTeórica = 1 - (1 - exp(-1 * lambda * x))
probabilidadeTeórica

probabilidadeTeórica2 = pexp(6, lambda, lower.tail = FALSE)
probabilidadeTeórica2

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

diferença = abs(probabilidadeTeórica - probabilidadeExperimental)
diferença