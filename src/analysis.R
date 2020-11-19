# Date: 30 Oct 2020
# Lab06: Analysis of the relationships in Psychology data

# YourName: Kate Folkenroth

# Add your code below this line.

rm(list= ls())
library(tidyverse)

# make sure psych is installed
###install.packages("psych")
library(psych)


#Grab the data: data.csv 
psychFile <- file.choose()
data <- read.csv(psychFile)

# View the data
View(data)

# Smaller data set, just Score, gender, and age
generalData <- select(data, score, gender, age)

# Data without outliers
generalData2 <- generalData %>% filter(age <= 100, gender >= 1) 


#### Correlations (pairs.panel)
pairs.panels(generalData2)


#T Tests
t.test(generalData2$score,generalData2$age) #pvalue = 2.2e
t.test(generalData2$score~generalData2$gender)
t.test(generalData2$age~generalData2$gender)



#Linear Models
 ## Score vs Age
generalData2 %>% ggplot(aes(x = score, y = age, color = gender)) + geom_point(alpha = I(1/4)) + geom_smooth(method = lm)
generalData2 %>% ggplot(aes(x = age, y = score, color = gender)) + geom_point(alpha = I(1/4)) + geom_smooth(method = lm)

lm(generalData2$score~generalData2$age)


 ## Score vs gender
generalData2 %>% ggplot(aes(x = score, y = gender)) + geom_point(alpha = I(1/4)) + geom_smooth(method = lm)
generalData2 %>% ggplot(aes(x = gender, y = score)) + geom_point(alpha = I(1/4)) + geom_smooth(method = lm)

lm(generalData2$score~generalData2$gender)

 ## Age vs gender
generalData2 %>% ggplot(aes(x = age, y = gender)) + geom_point(alpha = I(1/4)) + geom_smooth(method = lm)
generalData2 %>% ggplot(aes(x = gender, y = age)) + geom_point(alpha = I(1/4)) + geom_smooth(method = lm)

lm(generalData2$age~generalData2$gender)

#New Approach
?violinBy

violinBy(generalData2)

