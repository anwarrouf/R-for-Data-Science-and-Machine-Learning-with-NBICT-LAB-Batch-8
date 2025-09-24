install.packages("visualize")
library(visualize)

# visualize normal distribution
pnorm(-1.96)
visualize.norm(stat = -1.96) # plot 1

visualize.norm(stat = 1.96) # plot 2

# We want to highlight 2.5% on the right tail


visualize.norm(stat = 1.96, section = "upper") # for this function, the original code is -
# visualize.norm(stat = i.e. z value, mu = i.e. mean, sd = i.e. standard deviation, section = "lower" or "upper")
# "lower" for left side and "upper" for right side of the curve. If nothing is written, then "lower" section is selected

# We want to check a section in the middle

visualize.norm(stat = c(-1.96,1.96), section = "bounded") # plot 3

visualize.norm(stat = c(-1.96,1.96), section = "tails") # plot 4

visualize.norm(stat = c(-1,1), section = "bounded") # plot 5

visualize.norm(stat = c(-3,3), section = "bounded") # plot 6

# We want to see outside of ± 3SD values
visualize.norm(stat = c(-3,3), section = "tails") # plot 7
