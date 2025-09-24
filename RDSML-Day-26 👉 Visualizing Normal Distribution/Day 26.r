install.packages("visualize")
library(visualize)

# visualize normal distribution

pnorm(-1.96)

# The stat parameter represents the statistic or value(s) for which you want to obtain the probability from the Normal distribution.

# First, we will check with standard normal distribution i.e. mean = 0 and sd = 1. Between - 3SD and + 3SD, 99.7% values will be covered

visualize.norm(stat = -1.96) # plot 1

visualize.norm(stat = 1.96) # plot 2

# We want to highlight 2.5% on the right tail


visualize.norm(stat = 1.96, section = "upper")

# visualize.norm(stat = value or values we want to check, mu = i.e. mean, sd = i.e. standard deviation, section = "lower", "upper", "bounded", "tails")
# "lower" for left side and "upper" for right side of the curve. If nothing is written, then "lower" section is selected

# We want to check a section in the middle

visualize.norm(stat = c(-1.96,1.96), section = "bounded") # plot 3

visualize.norm(stat = c(-1.96,1.96), section = "tails") # plot 4

visualize.norm(stat = c(-1,1), section = "bounded") # plot 5

visualize.norm(stat = c(-3,3), section = "bounded") # plot 6

# We want to see outside of ± 3SD values
visualize.norm(stat = c(-3,3), section = "tails") # plot 7


# Now, we want work with some real value. Suppose, from a population of ages, mean age is 75 and sd = 1.
# What is the probability of one participant's age is 77 or higher?

visualize.norm(stat = 77, mu = 75, sd =1, section = "upper") # plot 8

# What is the probability of participants age between 77 and 80? suppose SD = 4

visualize.norm(stat = c(77, 80), mu = 75, sd =4, section = "bounded") # plot 9

# If we want calculate by pnorm function, then we will get the range for plot 9
pnorm(c(77,80), mean = 75, sd = 4)
