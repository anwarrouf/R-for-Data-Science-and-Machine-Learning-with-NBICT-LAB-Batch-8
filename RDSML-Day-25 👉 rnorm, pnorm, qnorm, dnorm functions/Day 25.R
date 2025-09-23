# rnorm, here, 'r' stands for random and 'norm' stands for normal distribution.
# In normal distribution, mean should be 0 (near 0) and standard deviation should be 1 (near 1)
# The more values we have, the more close the mean and standard deviation will be

# rnorm generates random numbers for normal or Gaussian distribution (with mean = 0 and sd = 1) and here 10 indicates, we ask for 10 values
x <- rnorm(10) 
x
mean(x)
sd(x)

y <- rnorm(100)
y
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


a <- rnorm(10, mean = 100, sd = 5) # we want 10 values that will have mean near 100 and sd near 5)
a
mean(a)
sd(a)

b <- rnorm(100, mean = 100, sd =3)
b
mean(b)
sd(b)
# For any types of distribution, if we want to calculate probability, then we first need to convert that distribution to standard normal distribution


# pnorm is used to determine the probability by providing z value
# At z = 0, the value of probability is 0.5

pnorm(0)
pnorm(-1.96) # in fact,±1.96SD, 95% values will cover. But for conveniences, we say it as ±2SD.
# Thus, pnorm(-1.96) will give probability value of 0.02499 or 2.499%
# Thus, 2.5% values will fall outside of either side; in total 2.5% x 2 = 5%. From here, 95% confidence interval comes
pnorm(-1.64) # that is, in case of z value -1.64, 5% value is outside


# qnorm gives z value if probability value is provided. Probability values are between 0 and 1
