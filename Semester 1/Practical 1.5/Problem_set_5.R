# Set the number of layers and trials
num_layers <- 8  # Number of layers in the bean machine
num_trials <- 1000  # Number of trials to simulate

# Initialize an empty vector to store the final positions of the beads
final_positions <- numeric(0)

# Simulate the bean machine for each trial
for (trial in 1:num_trials) {
  position <- 0  # Starting position at the top
  for (layer in 1:num_layers) {
    # Make a left (0) or right (1) decision randomly
    decision <- sample(0:1, 1)
    
    # Update the position based on the decision
    if (decision == 0) {
      position <- position  # Move left
    } else {
      position <- position + 1  # Move right
    }
  }
  # Append the final position to the results vector
  final_positions <- c(final_positions, position)
}

# Create a histogram to visualize the final positions
hist(final_positions, breaks = seq(-0.5, num_layers + 0.5, by = 1),
     main = "Bean Machine Simulation Results",
     xlab = "Final Position",
     ylab = "Frequency")

# Print the summary statistics of the final positions
summary(final_positions)

