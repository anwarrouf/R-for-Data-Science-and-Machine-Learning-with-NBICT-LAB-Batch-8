# Simple linear regression
# importing dataset

dataset <- read.csv("Salary_Data.csv")

# Splitting the dataset into the Training set and Test set

# We want to select randomly 20 values from the dataset. This will work as training set.
# For random selection, we will use caTools package
install.packages("caTools")
library(caTools)

training_set_1 <- sample.split(Y = dataset$Salary, SplitRatio = 2/3)

# normally we plot dependent variable in Y axis. That's why, Y is written. We do not need to write Y.
training_set_1
# We got a combination of TRUE and FALSE data.
# TRUE means the value selected for training set
# FALSE means the values not selected for training set. These not selected values will be used as test set
training_set_2 <- sample.split(Y= dataset$Salary, SplitRatio = 2/3)
training_set_2 # Running the code again will give a new combination
# This phenomenon will create a problem


# That's why, we want a definite set of random values for training set
set.seed(67) # I randomly select the value
training_set_1 <- sample.split(Y = dataset$Salary, SplitRatio = 2/3)
training_set_1
# After seeding, I am getting same combination

# Lets use,
set.seed(123) # We all participatants in the class are now using sample seed value which will select sample random combination
training_set_1 <- sample.split(Y = dataset$Salary, SplitRatio = 2/3)
training_set_1

# Creating the training subset by combining all TRUE values
training_set_final <- subset(dataset, training_set_1 == TRUE)

test_set_final <- subset(dataset, training_set_1 == FALSE)
test_set_final

# Fitting Simple Linear Regression model to the Training set

# Simple linear regression কিভাবে কাজ করে, তা আগামী ক্লাসে আলোচনা করে হবে ইনশাল্লাহ
# Lets create a model named 'regressor' to be trained with training set

regressor <- lm(formula = Salary ~ YearsExperience,
                data = training_set_final)
# In formula, কে dependent আর কে independent variable, তা বলে দিতে হবে

regressor # আমাদের model তৈরি করা হয়ে গেছে। আজ ক্লাস এ পর্যন্তই।
