temp <- read.csv("OrionTemp.csv")
#mysample <- sample(temp$Temperature, size = 10)
#t.test(mysample, mu = 37, alternative = "two.sided")

#Q1
# 生成t分布的空分布
#x <- seq(-10,10, by = 0.01) # 在-10到10之间生成 间隔为0.01
#df <- length(mysample)-1 # 自由度为10
#y <- dt(x, df) # 计算概率密度

# 绘制空分布 type=“l"表示绘制线图 lwd=2表示线条宽度为2
#plot(x, y, type = "l", lwd = 2, xlab = "t-value", ylab = "Density", main = "Null Distribution for t-test")

#Q2

smaller_0.05 <- NULL
num_test <- 200
for(i in 1:num_test){
  p.values <- NULL
  for (n in 1:i) {
    mysample <- sample(temp$Temperature, size = 10)
    res <- t.test(mysample, mu = 37, alternative = "two.sided")
    p.values <- c(p.values, res$p.value)
  }
  smaller_0.05 <- c(smaller_0.05, sum(p.values < 0.05)) 
}
plot(1:num_test, smaller_0.05, type = "o", xlab = "Number of tests", ylab = "Num tests with p <= 0.05", main = "One−sample t−test, sample size = 10")





