# Simple linear regression ----
# importing dataset

dataset <- read.csv("Salary_Data.csv")
# এই dataset দুটি variable আছে- salary and yearsExperience. কোন কর্মীর salary অনেক factor এর উপার নির্ভর করে
# factor গুলোর মধ্যে salary একটা factor. ফলে, salary হচ্ছে dependent variable আর yearsExperience হচ্ছে independent variable
# একটি independent variable এর উপর ভিত্তি করে কোন dependent variable কে predict করাই হচ্ছে simple linear regression এর মূল কথা
# এজন্য একটা বড় dataset নিতে হবে। সেই dataset দিয়ে machine কে trained করা হবে
# এজন্য প্রথমে dataset কে দুটো subset এ ভাগ করতে হবে- training subset & test subset
# training subset দিয়ে machine কে train করা হবে । এর পর তা test subset এ apply করে দেখতে হবে কতটা নির্ভূল value সে predict করতে পারে
# তারপর মূল value এর সাথে মিলিয়ে accuracy score বের করা যায়

# Splitting the dataset into the Training set and Test set ----

# We want to select randomly 20 values from the dataset. This will work as training set.
# For random selection, we will use caTools package

install.packages("caTools")
library(caTools)

training_set_1 <- sample.split(Y = dataset$Salary, SplitRatio = 2/3)

# normally we plot dependent variable in Y axis. That's why, Y is written. We do not need to write Y.
training_set_1
# Each time running the code  will produce a new combination
training_set_2 <- sample.split(Y= dataset$Salary, SplitRatio = 2/3)
training_set_2 

# We got a combination of TRUE and FALSE data.
# TRUE means the value selected for training set
# FALSE means the values not selected for training set. These not selected values will be used as test set

# This phenomenon will create a problem


# That's why, we want a definite set of random values for training set
set.seed(67) # I randomly select the value
training_set <- sample.split(Y = dataset$Salary, SplitRatio = 2/3)
training_set

# After seeding, I will get same combination even after repeatedly running the code


# Creating the training subset by combining all TRUE values
training_set <- subset(dataset, training_set == TRUE)

test_set <- subset(dataset, training_set == FALSE)
test_set

# Fitting Simple Linear Regression model to the Training set

# Simple linear regression কিভাবে কাজ করে, তা আগামী ক্লাসে আলোচনা করে হবে ইনশাল্লাহ
# Lets create a model named 'regressor' to be trained with training set

regressor <- lm(formula = Salary ~ YearsExperience,
                data = training_set_final)
# In formula, কে dependent আর কে independent variable, তা বলে দিতে হবে

regressor # আমাদের model তৈরি করা হয়ে গেছে। আজ ক্লাস এ পর্যন্তই।

# Checking the summary of regressor
summary(regressor)
coef(regressor)

# predicting the test set results

y_pred_test <- predict(regressor, newdata = test_set_final)

y_pred_training <- predict(regressor, newdata = training_set_final)

y_pred_test

y_pred_training

library(ggplot2)

# Visualizing the training set results

ggplot()+
  geom_point(aes(x = training_set_final$YearsExperience, y = training_set_final$Salary), color = "red")+
  geom_line(aes(x = training_set_final$YearsExperience, y = y_pred_training), color = "blue")+
  labs(title = "Salary vs experience_training set", x = "Years of Experience", y = "Salary")
  
# Visualizing the test set results
  
ggplot()+
    geom_point(aes(x = test_set_final$YearsExperience, y = test_set_final$Salary), color = "red")+
    geom_line(aes(x = test_set_final$YearsExperience, y = y_pred_test), color = "green") +
    labs(title = "Salary vs experience_Test set", x = "Years of Experience", y = "Salary")


df_plot <- rbind(
  data.frame(
    YearsExperience = training_set_final$YearsExperience,
    Salary = training_set_final$Salary,
    Predicted = y_pred_training,
    Set = "Training"
  ),
  data.frame(
    YearsExperience = test_set_final$YearsExperience,
    Salary = test_set_final$Salary,
    Predicted = y_pred_test,
    Set = "Test"
  )
)

ggplot(df_plot, aes(x = YearsExperience)) +
  geom_point(aes(y = Salary, color = Set)) +
  geom_line(aes(y = Predicted, color = Set)) +
  labs(
    title = "Salary vs Experience (Training & Test Sets)",
    x = "Years of Experience",
    y = "Salary"
  ) +
  theme_minimal()
