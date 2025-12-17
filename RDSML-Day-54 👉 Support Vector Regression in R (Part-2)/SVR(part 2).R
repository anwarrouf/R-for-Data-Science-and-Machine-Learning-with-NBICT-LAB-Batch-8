# Importing dataset ----
dataset <- read.csv("day.csv")

suppressPackageStartupMessages({library(ggplot2)
                               library(dplyr)
                               library(tidyr)})


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

str(bike)

 # install.packages("e1071")
library(caTools)
library(e1071)

# Training and test dataset ----

# Using 'sample' function

set.seed(123)
  # first checking the row number in data
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

train_scaled <- train_set %>%
  mutate(temp = scale(temp),
        atemp = scale(atemp),
        hum = scale(hum),
        windspeed = scale(windspeed))

  # Another way to do feature scaling
    # first, Identify numeric predictors
num_cols <- c("temp","atemp","hum","windspeed")
    # Compute scalling parameters on training data
train_means <- sapply(x = train_set[,num_cols], FUN = mean)
train_sds <- sapply(x = train_set[,num_cols], FUN = sd)

    # scaling function

scale_num <- function(df){
  df[,num_cols] <- sweep(x = df[,num_cols], MARGIN = 2, STATS = train_means,FUN = "-")
  df[,num_cols] <- sweep(x = df[,num_cols], MARGIN = 2, STATS = train_sds,FUN = "/")
  df
}

train_set_scaled <- scale_num(train_set)

# Now scaling test set
test_set_scaled <- scale_num(test_set)

# Now, doing scaling of test set by dplyr scale function
test_scaled <- test_set %>%
  mutate(temp = scale(temp),
         atemp = scale(atemp),
         hum = scale(hum),
         windspeed = scale(windspeed))


  # Here, 👉 We scale the test set using the training set mean and standard deviation to -
            # avoid data leakage and to ensure a fair evaluation.

  # That's why, we did not use scale() from dplyr because scale() will calculate their respective means and sds
