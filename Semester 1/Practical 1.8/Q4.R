unlucky_score<-pnorm(replicate(1000,mean(runif(26,0,80))),40,8)*100

library(ggplot2)
ggplot()+
geom_histogram(aes(x=unlucky_score, y=..density..))
              
#why not normal distribution?

unlucky_mean<-replicate(10,pnorm(replicate(10,mean(runif(runif(26,5,40),0,80))),40,8)*100)
lucky_mean<-replicate(10,pnorm(replicate(10,mean(runif(runif(26,5,40),0,80))),50,10)*100)
mean(unlucky_mean>lucky_mean)


