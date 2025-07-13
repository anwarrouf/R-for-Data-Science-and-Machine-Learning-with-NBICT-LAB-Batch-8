# Importing the dataset

dataset = read.csv("data.csv")

# Importing the library
library(ggplot2)

# Creating basic histogram
ggplot(dataset, aes(x = weight)) +
  geom_histogram(color = 'white', fill = "red") # color indicates boundary color of bar, # fill for inside color


# changing histogram plot line colors by groups

ggplot(dataset, aes(x = weight, fill = sex)) + # fill দিয়ে group গুলো separate করছে
  geom_histogram(color = 'white', alpha = 1, position = "identity") # alpha changes transparency, if less than 1, then becomes more tranparent

# We can change the position adjustment to use for overlapping points on the layer
# Possible values for the argument position are "identity", "stack", "dodge". Default position is "stack"

# Interleaved histogram
ggplot(dataset, aes(x = weight, fill = sex)) + # fill দিয়ে group গুলো separate করছে
  geom_histogram(color = 'white', alpha = 1, position = "dodge") # dodge position creates interleaved histogram

# Changing the position of legend
ggplot(dataset, aes(x = weight, fill = sex)) + 
  geom_histogram(color = 'white', alpha = 1, position = "dodge") +
  theme(legend.position = "top") # legend position can be top, bottom, right, left

# Adding mean line for male and female group separately
