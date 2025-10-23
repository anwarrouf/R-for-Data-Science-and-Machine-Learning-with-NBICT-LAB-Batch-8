# The Poisson distribution is a discrete probability distribution that describes the number of events that occur in a fixed interval of time or space,
# given that these events happen with a known constant mean rate and independently of the time since the last event.
# Conditions for a Poisson Process
# Events occur independently.
# Events occur one at a time (no simultaneous events).
# The average rate- λ is constant over time.
# The probability of more than one event in a very small interval is negligible.


# Real-world Applications
# Number of emails received per hour
# Number of cars passing through a toll booth per minute
# Number of printing errors per page
# Number of earthquakes in a region per year

# For example, a call center receives average 5 calls per hour.
# What is the probability of receive 3 or less calls per hour?
ppois(q = 3, lambda = 5) # here, q = number of events, lambda = constant mean rate
# result is 0.265. That is, 26.5% probability to receive 3 or less calls.

# What is the probability to receive exactly 3 calls per hour?
ppois(q = 3, lambda = 5) - ppois(q = 2, lambda = 5)

# we can also the following formula
dpois(x = 3, lambda = 5)


n <- seq(0:5)
n <- seq(0,5)
n

dpois(x = n, lambda = 5)
# the result is 
# 0.006737947 - probability to receive 0 call
# 0.033689735 - getting 1 call
# 0.084224337 - getting 2 calls
# 0.140373896 - getting 3 calls
# 0.175467370 - getting 4 calls
# 0.175467370 - getting 5 calls

barplot(dpois (x = n,lambda = 5))

install.packages("visualize")
library(visualize)

# getting 3 or less calls
visualize.pois(stat = 3, lambda = 5, section = "lower") # stat means number of events expecting

# getting 3 for more calls
visualize.pois(stat = 3, lambda = 5, section = "upper")

# getting 4 to 6 calls in average 10 calls per hour
visualize.pois(stat = c(4,6), lambda = 10, section = "bounded")

# getting exactly 3 calls per hour in an average of 10 calls per hour
visualize.pois(stat = c(2,4), lambda = 10, section = "tails")

grid(nx = NULL, ny = NULL, col = "lightgray", lty = "dotted")
