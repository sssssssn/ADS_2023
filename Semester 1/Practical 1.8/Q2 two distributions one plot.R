install.packages("ggplot2")
library(ggplot2)


uni.80<-replicate(1000,mean(runif(26,0,80)))
uni.100<-replicate(1000,mean(runif(26,0,100)))
mean(uni.80>uni.100)


data<-data.frame('score' = c(uni.80,uni.100),
                 'student' = rep(c('unlucky','lucky'), each=1000))
  
  ggplot(data)+theme_classic()+
  geom_histogram(aes(x=score, y=..density.., fill=student),
                 bins=40, alpha=0.3,colour='black', position='identity')+
  geom_density(aes(x=score,y=..density..,colour=student),
               size=1, alpha=0)+
  
  labs(x='normative scores', y='frequency')+
  scale_fill_manual(values=c('blue','red'))+
  scale_color_manual(values=c('blue','red'))
  
  
  