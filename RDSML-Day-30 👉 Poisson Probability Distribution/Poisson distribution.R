
# For example, a call center receives average 5 calls per hour. What is the probability of receive 3 or less calls per hour?
ppois(q = 3, lambda = 5)

ppois(q = 3, lambda = 5) - ppois(q = 2, lambda = 5)


# What is the probability to receive exactly 3 calls per hour?

dpois(x = 3, lambda = 5)


n <- seq(0:5)
n <- seq(0,5)
n
barplot(dpois (x = n,lambda = 5))
install.packages("visualize")

library(visualize)
