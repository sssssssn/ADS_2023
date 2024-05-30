getwd()
setwd("/Users/shennuo/ADS_2023/Practical 5")

dragons_data<-read.csv("dragons.csv")

hist(dragons_data$wingspan)

sample_size<-100
sample_mean<-replicate(1000,mean(sample(dragons_data$wingspan,sample_size,replace = TRUE)))
hist(sample_mean)

