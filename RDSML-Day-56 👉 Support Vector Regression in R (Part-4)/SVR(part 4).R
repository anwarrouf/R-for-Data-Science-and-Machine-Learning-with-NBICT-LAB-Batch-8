# If the dependent variable is linearly dependent on independent variables (predictors), then we can use linear regression model
  # In case, no linear relationship, then we need to use other models



# Importing dataset ----
dataset <- read.csv("day.csv")

library(ggplot2)
library(dplyr)
library(tidyr)
library(caret)
library(e1071)


# Basic cleaning and feature selection ----

bike <- dataset %>%
  select(cnt,temp,atemp,hum,weathersit,
         windspeed,yr,mnth,holiday,
         workingday,season,weekday)

# Converting categorical variables to factors

bike <- bike %>%
  mutate(season = factor(season),
         yr = factor(yr),
         mnth = factor(mnth),
         holiday = factor(holiday),
         workingday = factor(workingday),
         weathersit = factor(weathersit),
         weekday = factor(weekday))

# Training and test dataset ----


set.seed(123)
row_num <- nrow(bike)
row_num
  # creating indices of the rows
indices <- seq_len(row_num)
  # sampling from indices
train_idx <- sample(indices, size = 0.7 * row_num)
train_idx
  # now extracing train_set according to indices
train_set <- bike[train_idx,]
  # now extracting test_set according to indices
test_set <- bike[-train_idx,]

# feature scaling ----
    # first, Identify numeric predictors
num_cols <- c("temp","atemp","hum","windspeed")
    # Compute scalling parameters on training data
train_means <- sapply(train_set[,num_cols], FUN = mean)
train_sds <- sapply(train_set[,num_cols], FUN = sd)
    # scaling function
scale_num <- function(df){
  df[,num_cols] <- sweep(x = df[,num_cols], MARGIN = 2, STATS = train_means,FUN = "-")
  df[,num_cols] <- sweep(x = df[,num_cols], MARGIN = 2, STATS = train_sds,FUN = "/")
  df
}

train_set_scaled <- scale_num(train_set)

# Now scaling test set
test_set_scaled <- scale_num(test_set)


# Multiple linear regression model ----

lm_model <- lm(cnt ~ ., train_set_scaled)
summary(lm_model)

predict_test <- predict(lm_model, newdata = test_set_scaled)
predict_test

test_set_scaled$predicted <- predict_test
test_set_scaled

# Evaluation matrix, how linear model performs ----

rmse_calculation_1 <- sqrt(mean((test_set_scaled$cnt - test_set_scaled$predicted)^2))
rmse_calculation_1

# library(caret)
RMSE(pred = test_set_scaled$predicted, obs = test_set_scaled$cnt)

# Also can do this by making a function
# rmse <- function(actual, predicted) {
  #sqrt(mean((actual - predicted)^2))
# }

MAE(pred =test_set_scaled$predicted, obs = test_set_scaled$cnt)

# Building SVR model ----

svr <- svm(cnt ~ ., train_set_scaled,kernel = "linear")
svr

predicted_svr <- predict(svr, newdata = test_set_scaled)
predicted_svr

test_set_scaled$predicted_svr <- predicted_svr
test_set_scaled

# Checking RMSE and MAE for support vector machine model
  # Using caret package

RMSE(pred = test_set_scaled$predicted_svr, test_set_scaled$cnt)
MAE(pred = test_set_scaled$predicted_svr, test_set_scaled$cnt)

# Combining the results ----
df_RMSE_MAE <- data.frame(row.names = c("RMSE", "MAE"),
                          "Multiple linear" = c(RMSE(pred =test_set_scaled$predicted, obs = test_set_scaled$cnt),
                                                MAE(pred =test_set_scaled$predicted, obs = test_set_scaled$cnt)),
                          "Support vector" = c(RMSE(pred = test_set_scaled$predicted_svr, test_set_scaled$cnt),
                                               MAE(pred = test_set_scaled$predicted_svr, test_set_scaled$cnt)),
                          check.names = FALSE)

# Non-linear SVR (rbf)

svr_rbf <- svm(cnt ~ .,
               data = train_set_scaled,
               kernel = "radial", # non-linear relationship
               cost = 10,
               gamma = 0.1,
               epsilon = 0.1
               )

predict_svr_rbf <- predict(svr_rbf, newdata = test_set_scaled)
predict_svr_rbf

test_set_scaled$predict_svr_rbf <- predict_svr_rbf
test_set_scaled

RMSE(pred = test_set_scaled$predict_svr_rbf, obs = test_set_scaled$cnt)
MAE(pred = test_set_scaled$predict_svr_rbf, obs = test_set_scaled$cnt)

df_RMSE_MAE <- data.frame(row.names = c("RMSE", "MAE"),
                          "Multiple linear" = c(RMSE(pred =test_set_scaled$predicted, obs = test_set_scaled$cnt),
                                                MAE(pred =test_set_scaled$predicted, obs = test_set_scaled$cnt)),
                          "Support vector_linear" = c(RMSE(pred = test_set_scaled$predicted_svr, test_set_scaled$cnt),
                                               MAE(pred = test_set_scaled$predicted_svr, test_set_scaled$cnt)),
                          "Support vector_radial" = c(RMSE(pred = test_set_scaled$predict_svr_rbf, obs = test_set_scaled$cnt),
                                                      MAE(pred = test_set_scaled$predict_svr_rbf, obs = test_set_scaled$cnt)),
                          check.names = FALSE)
