# Part of this is copied from last R script

# Install and loading ggplot2
# gg stands for grammer of graph
# install.packages("ggplot2")
library(ggplot2)

dataset = mtcars
# mtcars is a dataset from R basics

# Generating a basic scatter plot
# independent variable in x-axis, dependent variable in y-axis
ggplot(dataset,aes(x = wt, y = mpg)) +
  geom_point()

# aes to indicate which data to be used, geom_point is for scatter plot
# changing the point size and shape
# Different shape is indicated by different number; for example, 8 is for star

ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size = 2,shape = 8)

# Adding the Regression line

ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size = 2,shape = 8) + 
  geom_smooth(method = lm)
# lm meas linear model, it is the best fit line, grayed area indicates confidence interval i.e. standard error (se)

# removing the confidence interval

ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size = 3, shape = 9) +
  geom_smooth(method = lm, se = FALSE)

# Loess method, if we do not select any specific method, then loess line will be shown
# loess means locally estimated scatter smoothing
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size = 3, shape = 9) +
  geom_smooth(method = loess)

# NOW THE NEW TOPIC

# change the line type and line color
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size = 3, shape = 9) +
  geom_smooth(method = lm, linetype  = 'dashed',
              color = 'darkgreen')

# changing the color of confidence interval
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size = 3, shape = 9, color = 'blue') +
  geom_smooth(method = lm, linetype  = 'dashed',
              color = 'darkgreen', fill = "red") # fill indicates confidence interval color

# scatter plots with multiple groups

# changing the point shapes by the level of cyl in the mtcars dataset; here we want to compare wt, mpg and cyl
# converting the cyl column from numeric to factor variable

dataset$cyl = as.factor(dataset$cyl)

ggplot(dataset, aes(x = wt, y = mpg, shape  = cyl)) +
  geom_point()

# changing point shape and color for cyl
ggplot(dataset, aes(x = wt, y = mpg, shape  = cyl, color = cyl, size = cyl)) +
  geom_point() # we can differentiate the factor variable by size, shape and color or only size, shape and color

# changing point size for cyl
ggplot(dataset, aes(x = wt, y = mpg, color = cyl)) +
  geom_point(size = 3) +
  geom_smooth(method = lm)
