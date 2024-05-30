simulation_times <- 1000
below_40_count <- 0  # Initialize a counter for scores below 40

for (i in 1:simulation_times) {
  scores <- runif(26, 0, 100)
  mean_score <- mean(scores)
  
  if (mean_score < 40) {
    below_40_count <- below_40_count + 1
  }
}

probability <- below_40_count / simulation_times









