# Using dbinom
# getting exactly 4 heads in 10 times tosses; probability of getting head or tail is 0.5 in each trial

dbinom(x = 4, size = 10, prob = 0.5)

# getting 4 or less heads in 10 times tosses; probabilit of getting head or tail is 0.5 in each trial
pbinom(q = 4, size = 10, prob = 0.5)

# Now, we want to calculate the probability of getting 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 heads in 10 times tosses

n <- c(0:10)
n

prob <- dbinom(x = n, size = 10, prob = 0.5)
# the result will be- 
# 0.0009765625 (probability getting 0 head)
# 0.0097656250 (probability getting 1 head)
# 0.0439453125 (2 heads)
# 0.1171875000 
# 0.2050781250
# 0.2460937500
# 0.2050781250
# 0.1171875000
# 0.0439453125
# 0.0097656250 (9 heads)
# 0.0009765625 (probability getting 10 heads)

barplot(prob)

# Using visualize package
library(visualize)

# getting 4 or less heads in 10 flips of coin, probability is 0.5

visualize.binom(stat = 4, size = 10, prob = 0.5, section = "lower") # stat is number of successes
# by defaulty section is lower
# saved as plot 1
# using pbinom gives same results

# getting 4 or higher heads in 10 flips of coin, probability is 0.5
visualize.binom(stat = 4, size = 10, prob = 0.5, section = "upper")


# getting 4 to 6 heads in 10 flips of coin, probability is 0.5
visualize.binom(stat = c(4,6), size = 10, prob = 0.5, section = "bounded")

# getting 3 heads or less and 7 heads or more in 10 flips of coin, probability is 0.5
visualize.binom(stat = c(3,7), size = 10, prob = 0.5, section = "tails")


# But what about if we want to see exactly 4 heads in 10 tosses

visualize.binom(stat = 4, size = 10, prob = 0.5, section = "lower") # using grid,we can show for 4 heads

grid(nx = NULL, ny = NULL, col = "grey", lty = "dotted")

# for binomial distribution
# mean (µ) = n.p
# sd = √(n.p.(1-p))