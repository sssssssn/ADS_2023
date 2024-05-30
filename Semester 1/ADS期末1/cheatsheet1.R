# week1 recalling R
# Data frames
thymocytes <- data.frame(
  genotype = c("KO", "KO"),
  DN = c(13, 15.54),
  DP = c(54, 42),
  SP = c(NA, NA),
  Pathology = c(NA, NA)
)
# Modifying the data frame
thymocytes <- rbind(thymocytes, c("WT", 8.67, 85.4, NA, NA), 
                    c("WT", 7.87, 77.45, NA, NA), 
                    c("WT", 9.5, 80.21, NA, NA))

#week2 Intuition and Probability
unique()#移除重复
summary()#最大最小值...
rnorm()#生成正态分布群

#week4 Sampling
sampling error: The difference between sample and population is called sampling error
sampling bias:  If some parts of the population have a higher chance of being sampled than others

#week5 Sampling Distribution & The Central Limit Theorem
 The 68 - 95 - 99.7 Rule
 how good a guess our sample mean is for the true population mean:  Standard Error of the Mean (SEM)
 The central limit theorem: Even if a population is not normally distributed, the sampling distribution (for large enough samples) will tend to be normal


#week6 Hypothesis testing
P-value: Probability of observing a value as or more extreme as the one you observed if the null hypothesis were true.

#week7 Getting and cleaning data
library(tidyr)

语言中的gather()和group()函数分别是用于数据整理和数据分组的函数。
gather()函数： gather()函数用于将数据从宽格式转换为长格式。它可以将多个列合并成一个列，并根据指定的变量进行标识。具体用法如下：
gather(数据集, 新列名, 列1:列n, key = "变量名", value = "值")
其中，数据集是要进行转换的数据集，新列名是合并后的新列名，列1:列n是要合并的列范围，key是新列中存储变量名的列名，value是新列中存储值的列名。
group()函数： group()函数用于对数据进行分组。它可以根据指定的变量对数据进行分组，并对每个组进行相应的计算。具体用法如下：
group_by(数据集, 变量1, 变量2, ...)
其中，数据集是要进行分组的数据集，变量1、变量2等是要进行分组的变量。

#week8 Comparing two means
What will it depend on:
- Effect size (distribution-based) e.g. r2, Cohen’s d = (m1 – m2)/s 
- Sample size n s.e.m. = s / sqrt(n)

#week10 t-test
#A t-test is a statistical test used to determine if there is a significant difference between the means of two groups. It is commonly used when comparing the means of a sample to a known or hypothesized population mean. The t-test calculates the t-value, which is then compared to a critical value to determine if the difference between the means is statistically significant.
#There are two types of t-tests: the one-tailed test and the two-tailed test.
#A one-tailed test is used when the researcher is interested in determining if the means of the two groups are significantly different in only one direction. For example, if the researcher wants to determine if Group A has a significantly higher mean than Group B, a one-tailed test would be appropriate.
#A two-tailed test, on the other hand, is used when the researcher is interested in determining if the means of the two groups are significantly different in either direction. It does not specify a particular direction of difference. For example, if the researcher wants to determine if there is a significant difference between the means of Group A and Group B, a two-tailed test would be appropriate.
#In a t-test, the null hypothesis assumes that there is no significant difference between the means of the two groups. The alternative hypothesis states that there is a significant difference. The t-value is calculated based on the sample data and the standard error of the means. If the t-value falls within the critical region, the null hypothesis is rejected, indicating that there is a significant difference between the means.