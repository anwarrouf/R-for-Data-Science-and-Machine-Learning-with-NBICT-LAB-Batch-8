# Install and loading ggplot2
# gg stands for grammer of graph
install.packages("ggplot2")
library(ggplot2)

dataset = mtcars
# mtcars is a dataset from R basics

# Generating a basic scatter plot
# independent variable in x-axis, dependent variable in y-axis
ggplot(dataset,aes(x = wt, y = mpg)) +
  geom_point()

# aes to indicate which data to be used, geom_point is for scatter plot
# changing the point size (default size = 1) and shape
# Different shape is indicated by different number; for example, 8 is for star

ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size = 2,shape = 8)

# Adding the Regression line i.e. best fit line

ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size = 2,shape = 7) +
  geom_smooth(method = lm) # shaded area indicates confidence interval
  
  