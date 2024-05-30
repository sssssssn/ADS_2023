library(ggplot2)
# import the data
trial <- read.csv("drug_trial.csv")
# read the data
head(trial)
# plot the data
g <- ggplot(data = trial, aes(x = treatment, y = pain, fill = treatment))
  g + geom_boxplot()
# randomly draw two data points

same <- c()
different <- c()
# choose 2 (different) rows from the total number of rows
for(i in 1:100){
  sample_index <- sample(1:nrow(trial),2) 
  samples <- trial[sample_index,]
# read out those two rows from trial
  sample1 <- samples[1, ]
  sample2 <- samples[2, ]
# read out the pain indices and determine their absolute difference
  pain1 <- sample1$pain
  pain2 <- sample2$pain
  abs_differences <- abs(pain1 - pain2)
# decide whether they belong to the same or to different treatment groups
  if (sample1$treatment == sample2$treatment){
    same <- append(same, abs_differences)
  }else{
    different <- append(different, abs_differences)
  }
}
# convert to dataframe
df1 <- data.frame(Group = rep("same", length(same)),
                 Value = same)
df2 <- data.frame(Group = rep("different", length(different)),
                  Value = different)
df <- rbind(df1, df2)
# plot the same and different
p <- ggplot(data = df, aes(x = Group, y = Value, fill = Group)) 
  p + geom_boxplot()
# compare the means
  mean(different) - mean(same)
