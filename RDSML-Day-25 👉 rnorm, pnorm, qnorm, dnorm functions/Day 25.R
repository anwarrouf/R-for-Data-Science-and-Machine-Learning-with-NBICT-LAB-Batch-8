# rnorm, here, 'r' stands for random and 'norm' stands for normal distribution.
# In normal distribution, mean should be 0 (near 0) and standard deviation should be 1 (near 1)
# The more values we have, the more close the mean and sd will be

x <- rnorm(10)
mean(x)
sd(x)
y
y <- rnorm(100)
mean(y)
sd(y)

z <- rnorm(1000)
z
mean(z)
sd(z)

p <- rnorm(10000)
p
mean(p)
sd(p)


y <- rnorm(10, mean = 100, sd = 5) # we want 10 values that will have mean near 100 and sd near 5)
mean(y)
sd(y)

z <- rnorm(100, mean = 100, sd = 3)
z
mean(z)
sd(z)

# pnorm