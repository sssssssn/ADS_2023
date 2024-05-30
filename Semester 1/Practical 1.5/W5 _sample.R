population <- rnorm(1e6,100,5)

sample_mean_std <- function(sample_size) {
  sample_means <- replicate(1000, mean(sample(population, sample_size)))
                            return(sd(sample_means))
}

sample_size<-5:100
sample_std_distribution<-sapply(sample_size, sample_mean_std)
plot(sample_size, sample_std_distribution, type = "p", xlab = "Sample Size", ylab = "Standard Deviation")
