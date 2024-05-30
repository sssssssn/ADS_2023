library(ggplot2)

#Drug trial dataset
drug <- read.csv("drug_trial.csv")

#ANOVA assumptions
#H0:There is no effect of treatment types on pain
#HA:At least one of those factors (placebo or drugA or drugB) influences pain.

#1.Independent random sampling
#2.Normality of residuals:yes
drugmodel = aov(pain~treatment, data = drug)
hist(resid(drugmodel))
plot(drugmodel, 2)
shapiro.test(resid(drugmodel))
#3.Equality of Variances:yes
plot(drugmodel, 1) #“Residuals vs Fitted” plot, looking for similar heights of “columns”

#perform ANOVA
summary(drugmodel)
#Run a post-hoc test
TukeyHSD(drugmodel)




#Weight loss in mice
mouse <- read.csv("mouse_experiment(1).csv")

#visualise
p <- ggplot(data = mouse, aes(x = genotype, y = weight_gain, fill = diet)) 
p + geom_boxplot()

#H0:There is no effect of genotypes on weight_gain
#HA:At least one of those genotypes (AA or AB or BB) influences weight_gain
mousemodel = aov(weight_gain~genotype * diet, data = mouse)
#check normality of residuals:yes
shapiro.test(resid(mousemodel))
#check Equality of Variances:yes
plot(mousemodel, 1)

#perform ANOVA
summary(mousemodel)
#Run a post-hoc test
TukeyHSD(mousemodel)

#AB and BB genotypes are related to weight_gain





