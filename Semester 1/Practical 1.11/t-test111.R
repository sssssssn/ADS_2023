data<-data("ToothGrowth")
#Q1
vitaminC <- ToothGrowth$len[ToothGrowth$supp == "VC"]
result1<-t.test(x = vitaminC, mu = 8.5, alternative = "two.sided")
print(result1)
#Q2
deliverymethod<-t.test(len ~ supp, data = ToothGrowth)

dosechoose <- subset(ToothGrowth, dose %in% c(2, 0.5))
dosage<-t.test(len ~ dose, data = dosechoose)

pt_value1<-2*pt(result1$statistic, df = length(ToothGrowth$len)-1)
cat("双侧p值 (code):", result1$p.value, "\n")
cat("双侧p值 (pt函数):", pt_value1, "\n")

