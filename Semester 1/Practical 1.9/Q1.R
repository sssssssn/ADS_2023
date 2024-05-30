#Q1 overplotting
install.packages("tidyverse")
library(tidyverse)
plot(price ~ carat,
     data = diamonds,
     col = cut,# the color of the point depends on "cut"
     pch = 18,#set the shape of points
     cex = 0.4,#size of points
     bg = alpha("white", 1/5)#Set the background color with transparency
     )
legend("right",
       legend = unique(diamonds$cut), 
       col = unique(diamonds$cut), 
       pch = 1)






     