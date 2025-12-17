# What is support vector machine regression (SVR) ----

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

install.packages("e1071")
library(caTools)
library(e1071)

# Training and test dataset ----

# split <- sample.split(Y = bike$cnt, SplitRatio = 0.75)

# We can do in another way using 'sample' function

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