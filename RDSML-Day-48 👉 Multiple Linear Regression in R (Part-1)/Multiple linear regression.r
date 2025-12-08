# Multiple linear regression ----
    # Dependent variable is dependent on two or more independent variables
    # For simple regression : y = bo + b1x1
    # y = dependent variable, x1 = independent, bo = intercept, b1 = slope
    # slope and intercept are known as regression coefficient
    
    # For multiple regression: y = bo + b1x1 + b2x2 + ......+bnxn

# Importing dataset ----

dataset <- read.csv("50_Startups.csv")

# In this dataset, state is a categorical variable
# Regression model works on numerical values.
# That's why, we have to convert categorical value to numerical value

# Encoding the categorical data (if any) ----
dataset$State_number <- factor(dataset$State,
                       levels = c("New York", "California", "Florida"),
                       labels = c(1,2,3))
dataset

suppressPackageStartupMessages({library(ggplot2); library(dplyr); library(tidyr)})

dataset <- dataset %>%
  relocate(State_number, .before = Profit)

# Splitting dataset into training set and test set ----

library(caTools)

set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 4/5)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting the multiple linear regression model to the training set ----

regressor <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State_number,
                data = training_set) 
# যে কয়টি independent variable দিতে চাই, সেগুলো + দিয়ে লিখতে হবে,
# যে কয়টি independent variable সে কয়টি লিখতে হবে । যদি আমরা কোন variable না নিতে চাই, তবে সেটি লিখবো না
# সবগুলো লেখার ক্ষেত্রে শুধুমাত্র . লিখলেই হবে

summary(regressor)