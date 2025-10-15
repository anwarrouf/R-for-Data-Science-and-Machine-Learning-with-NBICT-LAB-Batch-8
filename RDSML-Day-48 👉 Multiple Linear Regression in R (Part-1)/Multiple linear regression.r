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

