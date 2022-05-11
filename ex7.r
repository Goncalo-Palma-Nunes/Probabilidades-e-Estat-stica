seed <- 1836
num_amostras <- 9855
size <- 40

i <- 0
set.seed(seed)
vetor_medias <- c()
while (i < num_amostras) {
  amostra <- rbinom(size, 46, 0.04)
  vetor_medias <- append(vetor_medias, mean(amostra))
  i <- i + 1
}

output <- abs(mean(vetor_medias) - 46 * 0.04)
output
