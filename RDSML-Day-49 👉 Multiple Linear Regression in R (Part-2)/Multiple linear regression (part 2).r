# Importing dataset ----

dataset <- read.csv("50_Startups.csv")

# Encoding the categorical data ----
dataset$State <- factor(dataset$State,
                       levels = c("New York", "California", "Florida"),
                       labels = c(1,2,3))


# Splitting dataset into training set and test set ----

library(caTools)

set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 4/5)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Multiple linear regression model to the training set ----

regressor <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
                data = training_set)
summary(regressor)

# Predicting the test set results

y_pred_test <- predict(regressor, newdata = test_set)
y_pred_test

  # Also checking for the training set

y_pred_training <- predict(regressor, newdata = training_set)
y_pred_training

# Rearranging test set and training set with predicted profit ----

test_set <- test_set %>%
  mutate(Predicted_profit = y_pred_test) %>%
  relocate(Predicted_profit, .after = Profit) %>%
  mutate(Residual_profit = Profit - Predicted_profit, .after = Predicted_profit)

test_set


training_set <- training_set %>%
  mutate(Predicted_profit = y_pred_training) %>%
  relocate(Predicted_profit, .after = Profit) %>%
  mutate(Residual_profit = Profit - Predicted_profit, .after = Predicted_profit)

training_set

# Stepwise backward elimination ----

regressor <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
                data = training_set)
summary(regressor)

# eliminating another variable

regressor <- lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
                data = training_set)
summary(regressor)


# Automated stepwise backward elimination ----

full_model <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
                data = training_set) # same as previous regressor variable
summary(full_model)

final_model <- step(full_model, direction = "backward")
summary(final_model)


# Now, checking predicted profit again

y_pred_test <- predict(final_model, newdata = test_set)
test_set



# Correlation testing
cor(x = training_set$R.D.Spend, y = training_set$Profit, method = "pearson")
# cor is used to check correlation
cor.test(x = training_set$R.D.Spend, y = training_set$Profit, method = "pearson")
# cor.test is used to check correlation with statistical significance

# For Marketing spend predictor
cor.test(x = training_set$Marketing.Spend, y = training_set$Profit, method = "pearson")




# plotting
plot(training_set$R.D.Spend, training_set$Profit)

plot(final_model) # produce residuals vs fitted, QQ plot and other plots




# Checking the independence of errors ----
library(lmtest)

# Do we need to add more variables? Check this by-
dwtest(final_model) # Durbin - Watson test
# DW value should be around 2, p-value should non-significant

#Durbin-Watson test
# data:  final_model
# DW = 1.44, p-value = 0.02253
# alternative hypothesis: true autocorrelation is greater than 0

# So, we need more entries and more independent variables

# checking multicolinearity
  # To check the entries in row of a specific column are not correlated with each other
vif(final_model)

# Homoscedasticity assumption
plot(final_model$fitted.values, rstandard(final_model))
abline(h = 0, col = "red")
bptest(final_model)

# studentized Breusch-Pagan test
# 
# data:  final_model
# BP = 3.1565, df = 2, p-value = 0.2063
