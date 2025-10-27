# Two sample Z test

# Let's assume - we have two machines (M1 and M2) producing perfume bottles
# We know the standard deviations of the machines; for example, SD of M1 is 3 ml and of M2 is 2.5 ml


# We collected 100 bottles from M1.
# We collected 100 bottles from M2.
# Do these sample means have significant difference?

# Null hypothesis: no difference between two means
# Alternate hypothesis : there is difference between two means


# Importing dataset

data <- read.csv("Perfume_Two_Sample.csv")

library("BSDA")

z.test(x = data$Machine.1,
       y = data$Machine.2,
       sigma.x = sd(data$Machine.1),
       sigma.y = sd(data$Machine.2),
       mu = 0, # difference between two means
       conf.level = 0.99) # by default 0.95

# z value = -3.5954
# p-value = 0.0003238; it means the probability to accept the null hypothesis is less than 0.05
# So, there is significant difference between two machines


# Two sample Z test formula

