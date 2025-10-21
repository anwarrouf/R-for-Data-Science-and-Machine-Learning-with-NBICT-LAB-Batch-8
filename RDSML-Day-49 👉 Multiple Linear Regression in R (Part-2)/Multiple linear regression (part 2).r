# Importing dataset

dataset <- read.csv("50_Startups.csv")

# In this daatset, state is a categorical variable
# Regression model works on numerical values.
# That's why, we have convert categorical value to numerical value

# Encoding the caterogical data
dataset$stat <- factor(dataset$State,
                       levels = c("New York", "California", "Florida"),
                       labels = c(1,2,3))
dataset


# Splitting dataset into training set and test set

library(caTools)

set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 4/5) # for training set
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# fitting the multiple linear regression model to the training set

regressor <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
                data = training_set) # যে কয়টি independent variable দিতে চাই, সেগুলো + দিয়ে লিখতে হবে,
# যে কয়টি independent variable সে কয়টি লিখতে হবে।
# সবগুলো লেখার ক্ষেত্রে শুধুমাত্র . লিখলেই হবে
summary(regressor)

# predicting the test set results

y_predict <- predict(regressor, training_set)
y_predict

# Stepwise backward elimination

regressor <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
                data = training_set)
summary(regressor)

# eliminating another variable

regressor <- lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
                data = training_set)
summary(regressor)


# automated stepwise backward elimination

regressor <- lm(formula = Profit ~ .,
                data = training_set)
summary(regressor)

automated_regressor <- step(regressor, direction = "backward")
summary(automated_regressor)













install.packages("lmtest")
library(lmtest)


dwtest <- 
  
  
# normality of residuals

  
# checking multicolinearity bt variance inflation ratio
install.packages("car")
library(car)
