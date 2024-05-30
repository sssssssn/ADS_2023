install.packages("dplyr")
install.packages("tidyr")
library(dplyr)
library(tidyr)

getwd()
setwd("/Users/shennuo/ADS_2023/Practical 7")
data<-read.csv("Week_7_WNV_mosquito_test_results.csv")
head(data,10)
tail(data,10)
nrow(data)
attributes(data)
str(data)
class(data)

data <- data %>% rename(YEAR = SEASON.YEAR)

missing_data<-anyNA(data)
print(missing_data)

duplicates <- duplicated(data)
print(duplicates)

# Create a histogram of a numeric variable
#my_breaks<-data$YEAR
#hist(data$NUMBER.OF.MOSQUITOES, breaks = my_breaks, col = "blue", main = "Histogram")

dat1 <- as.POSIXct(data$TEST.DATE, format = "%m/%d/%Y %H:%M:%S", tz = "America/Chicago")

data <- data %>%
  mutate(LOCATION = gsub(" ", "", LOCATION)) %>%
  separate(LOCATION, into = c("LATITUDE", "LONGITUDE"), sep = ",", convert = TRUE)

