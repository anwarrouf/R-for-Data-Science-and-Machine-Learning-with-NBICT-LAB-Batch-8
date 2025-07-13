# Importing the dataset

dataset = read.csv("data.csv")

# Importing the library
library(ggplot2)

# Creating basic histogram
ggplot(dataset, aes(x = weight)) +
  geom_histogram(color = 'white', fill = "red", position = "stack") # color indicates boundary color of bar, # fill for inside color


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

# Adding mean line in male and female group separately
# Need plyr package. Plyr helps to calculate mean of individual group

install.packages("plyr")
library(plyr)
group_means = ddply(dataset,"sex",summarise, grp.mean = mean(weight))
group_means

# Now adding mean lines

myPlot = ggplot(dataset, aes(x = weight, fill = sex)) + 
  geom_histogram(color = 'white', position = "dodge") +
  geom_vline(data = group_means, aes(xintercept = grp.mean, color = sex), line = "dashed") +
  theme(legend.position = "top")

myPlot

# Saving the plot for publication
ggsave("histogram.tiff", myPlot, width = 6, height = 4, dpi = 600)

# Changing the color of our choice for each group - by using custom color palettes

