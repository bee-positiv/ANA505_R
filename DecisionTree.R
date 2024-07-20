#Bibek Twati
#Week 4 Activity: Decision Tree

# removes alll variables previously stored
rm(list=ls())

# install the ISLR package
install.packages('ISLR')

# load the ISLR library
library(ISLR)

# load rpart libraries
library(rpart)
library(rpart.plot)

# initial decision tree
tree <- rpart(Salary ~ Years + HmRun, data=Hitters, control=rpart.control(cp=.0001))

# best cp value
best <- tree$cptable[which.min(tree$cptable[,"xerror"]),"CP"]

# produce a pruned tree based on the best cp value
pruned_tree <- prune(tree, cp = best)

# plot the tree
prp(pruned_tree)
