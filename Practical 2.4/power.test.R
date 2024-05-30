#Task 1. Calculate a one-sample test power with similation in R.
# If you set a cutoff of 0.05, what is the percentage of simulations that you get the pvalue larger than 0.05? What does this number mean? What is the power?
stu <- replicate(1e5, t.test(rnorm(10, 178, 10), mu = 175, alternative = 'greater')$p.value) 
per <- length(which(stu>0.05))
power.stu <- length(which(stu <= 0.05))/1e5
# If you measure 50 students instead of 10 students, then does the power change?
stu.50 <- replicate(1e5, t.test(rnorm(50, 178, 10), mu = 175, alternative = 'greater')$p.value) 
per.50 <- length(which(stu.50>0.05))
power.stu.50 <- length(which(stu.50 <= 0.05))/1e5
#The cheating way is to use the command power.t.test. Try it out to calculate the power number with different Ns (5, 10, 15, 20. . . .100). Try to plot the power versus N. You should see a plot like this:
n <- seq(5, 100, by = 5)
power_values <- numeric(length(n))
for (i in seq_along(n)){
  power_values[i]<-power.t.test(n=n[i], delta=3, sd=10, sig.level=0.05, 
                                type="one.sample", alternative = 'one.sided')$power
  }
plot(n, power_values, type="b", xlab='Ns', ylab='Pows' )


#Task 2. Choose the right sample size.
#1. If the drug is indeed effective as showed on the animal model, then what is the probability that they do not see a significant effect of the drug (p-value cutoff = 0.05)? Please perform a simulation as you did before to give an answer.
animal <- replicate(1e5, t.test(rnorm(10, 117, 30),mu = 130, alternative = 'less')$p.value)
per.animal <- length(which(animal>0.05))/1e5
#2. Do you think the power is good enough? If the company truly believes the effect of the drug and want to be sure that they will not largely miss the effect in the trial (type II error rate < 0.2), then how many volunteers do they need to recruit?
power.t.test(power = 0.8, delta = 13, sd=30, sig.level=0.05, type="two.sample", alternative = 'one.sided')
#3. If the company changes their strategy, asking all the volunteers to take the pills and measuring their weights before and afterward, how many volunteers do they need?
power.t.test(power = 0.8, delta = 13, sd=30, sig.level=0.05, type="paired", alternative = 'one.sided')
#4. Manipulate the p-value cutoff or power to see the change of the needed sample size. You could also plot them out. The output should be similar to these.
alpha <- seq(0.01,0.05, by = 0.01)
power_values_pills <- numeric(length(alpha))
for(i in seq_along(alpha)){
  power_values_pills[i]<-power.t.test(power = 0.8, delta = 13, sd=30, 
                                      sig.level=alpha[i], type="one.sample", alternative = 'one.sided')$n}
plot(alpha, power_values_pills, type="b", xlab='alphas', ylab='Ns')

pows <- seq(0.5,0.9, by = 0.1)
power_values_pows <- numeric(length(pows))
for(i in seq_along(pows)){
  power_values_pows[i]<-power.t.test(power = pows[i], delta = 13, sd=30, 
                                      sig.level=0.05, type="one.sample", alternative = 'one.sided')$n}
plot(pows, power_values_pows, type="b", xlab='Pows', ylab='Ns2')



