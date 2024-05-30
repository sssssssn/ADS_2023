#Define observed data
Poll_seasons <- data.frame(Spring = 40, Summer = 30, Autumn = 18, Winter = 28)
expected <- data.frame(Spring = 29, Summer = 29, Autumn = 29, Winter = 29)
#Calculate expected values assuming equal preferences
equal_preferences <- sum(Poll_seasons) * 0.25

#calculate the x^2
calculate <- function(observed, expected){
  x <- sum((observed-expected)^2/expected)
  return(x)
}
#use a simulation to get the distribution of χ2
result <- replicate(1000, {
  sampled_data <- sample(c('Spring', 'Summer', 'Fall', 'Winter'),
                         size = 116,
                         replace = TRUE,
                         prob = rep(0.25, 4))
  season_counts <- table(sampled_data)
  observed <- as.data.frame(season_counts)
  x <- calculate(observed$Freq, expected)
  return(x)})
#visualise the distribution of simulated χ2 values
plot(density(result), main = "Density Plot of Simulated Chi-square Values", xlab = "χ2")

chisq.test(Poll_seasons, correct = FALSE, p = rep(1/4,4))







#Chi-square distribution and degree of freedom
# Define degrees of freedom
df <- c(1, 2, 3, 4, 5)
# Number of simulations
num_simulations <- 10000
# Generate random chi-square values for each degree of freedom
chi_square_values <- lapply(df, function(d) {
  rchisq(num_simulations, df = d)
})
# Plot density curves for each degree of freedom
plot(NULL, xlim = c(0, 20), ylim = c(0, 0.5), xlab = "χ^2", ylab = "Density", main = "Density Plot of Chi-square Distribution with Different Degrees of Freedom")
colors <- rainbow(length(df))
for (i in 1:length(df)) {
  lines(density(chi_square_values[[i]]), col = colors[i], lwd = 2)
}
legend("topright", legend = paste("df =", df), col = colors, lwd = 2)






#Chi-square test of homogeneity
Severe <- data.frame(Spring = 5, Summer =1, Fall = 1, Winter = 9, row.names = 'Severe' )
Mild <- data.frame(Spring = 8, Summer = 5, Fall = 2, Winter = 5, row.names = 'Mild' )
Sporadic <- data.frame(Spring = 9, Summer = 8, Fall = 3, Winter = 9, row.names = 'Sporadic' )
Never <- data.frame(Spring = 18, Summer = 16, Fall = 12, Winter = 5, row.names = 'Never' )
two_categories <- rbind(Severe, Mild, Sporadic, Never)

colors <- c("green", "pink", "yellow", "blue")
mosaicplot(two_categories, main = "Favorite season",
           color = colors)




#Chi-square test and Fisher’s exact test
Alive <- data.frame(WT=7, KO=2, row.names= 'Alive')
Dead <- data.frame(WT=3, KO=7, row.names = 'Dead')
mouse <- rbind(Alive, Dead)
chisq.test(mouse, correct = FALSE)
fisher.test(mouse)







