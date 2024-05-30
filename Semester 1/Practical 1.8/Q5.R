# Set the number of simulations
num_simulations <- 1000
# Simulate class sizes
class_sizes <- replicate(1000, sample(5:40, num_simulations, replace = TRUE))
class_means <- replicate(1000, mean(rnorm(class_sizes,50,5)))
# Simulate raw scores for each class
#class_raws <- matrix(0, nrow = num_simulations, ncol = 26)

for (i in 1:num_simulations) {
  
  class_raw <- rnorm(class_sizes[i], class_means[i], sd = 10)
  class_raws <- c(class_raws, class_raw)
}

# Simulate normative scores for the unlucky class
unlucky_norm_new <- rnorm(num_simulations, mean = mean(class_raws) * 0.8, sd = 8)

# Calculate mean normative scores for each class
#mean_norms_new <- rowMeans(class_raws)

# Plot the distribution of mean normative scores
hist(unlucky_norm_new, main = "Distribution of Mean Normative Scores (New Conditions)", xlab = "Mean Normative Score", col = "lightblue")


