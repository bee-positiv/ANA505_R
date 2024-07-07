#Bibek Twati / Linear Regression R Activity
# removes alll variables previously stored
rm(list=ls())

# load libraries
library(caTools)

# create dataset
df <- data.frame(yearsExperienced=c(1.1,1.3,1.5,2.0,2.2,2.9,3.0,3.2,3.2,3.7),
                salary=c(39343.00,46205.00,37731.00,43525.00,39891.00,56642.00,60150.00,54445.00,64445.00,57189.00))

# view first six rows of dataset
head(df)

# generating train and test data
# Splitting the original data frame
split_ratio <- sample.split(salary, SplitRatio = 0.70)

train_dataset <- subset(df, split_ratio == TRUE)
train_dataset

test_dataset <- subset(df, split_ratio == FALSE)
test_dataset

# fit simple linear regression model
# salary: dependent variable
# yearsExperienced: independent variable
lm.r = lm(formula = salary ~ yearsExperienced, data = train_dataset)

# view model summary
summary(lm.r)

# Call:
#   lm(formula = salary ~ yearsExperienced, data = train_dataset)
# 
# Residuals:
#   1       3       4       5       6       7      10 
# 3392.2 -2027.4  -992.9 -6530.7  3557.0  6113.1 -3511.2 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)   
# (Intercept)         25480       5504   4.629  0.00569 **
#   yearsExperienced     9519       2210   4.306  0.00767 **
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 4932 on 5 degrees of freedom
# Multiple R-squared:  0.7876,	Adjusted R-squared:  0.7451 
# F-statistic: 18.54 on 1 and 5 DF,  p-value: 0.00767

# Linear model for the training set: salary = 25480 + 9519 * yearsExperienced

