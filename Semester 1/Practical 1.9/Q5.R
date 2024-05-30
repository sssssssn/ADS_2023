#Q5 scale_y_continuous
library(ggplot2)

sampled_diamonds <- diamonds[sample(nrow(diamonds), 100), ]

ggplot(data = sampled_diamonds,aes(x = clarity, y = carat, color = price, size = carat)) +
         geom_boxplot() +
         geom_jitter() +
         scale_y_continuous(limits = c(0.5, 2.0)) +
         scale_color_gradient(limits = c(10000,15000))+
         scale_size_continuous(limits = c(0.5, 2.0))
  
         
         
         


