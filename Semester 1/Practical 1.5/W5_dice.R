one_dice<-sample(1:6,1000,replace = TRUE)
hist(one_dice, breaks = 0.5:6.5, main = "Single Die Roll Histogram", xlab = "Outcome",col = "blue")

double_dices<-replicate(1000,sum(sample(1:6,2,replace = TRUE)))
hist(double_dices, breaks = 1:12, main = "Double Dies Roll Histogram", xlab = "Outcome",col = "yellow")

