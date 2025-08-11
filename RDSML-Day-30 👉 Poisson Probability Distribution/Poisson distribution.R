
# For example, a call center receives average 5 calls per hour. What is the probability of receive 3 or less calls per hour?
ppois(q = 3, lambda = 5)

ppois(q = 3, lambda = 5) - ppois(q = 2, lambda = 5)


# What is the probability to receive exactly 3 calls per hour?

dpois(q = 3, lambda = 5)
