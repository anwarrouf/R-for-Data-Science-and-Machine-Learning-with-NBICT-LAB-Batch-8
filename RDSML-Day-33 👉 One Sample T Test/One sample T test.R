# One sample T test

# Let's recall one sample Z test-
  # we know population mean and standard deviation
  # we collected samples and we know sample mean
  # now, we will check population mean and sample mean are significantly different or not

# In case of one sample T test
  # Population mean is known but standard deviation is unknown
  # sample mean and standard deviation are known
  # sample must be in normal distribution

data <- read.csv("bottle_data.csv")
# Let's assume, a company has purchased a perfume manufacturing machine from another company
# The seller company claims that the machine produces bottle of mean volume 150 ml
# The buyer company needs to check the accuracy of the machine
# And the buyer produces 20 bottles

# Null hypothesis (Ho) : No difference between population mean and sample mean


library(BSDA)

mean(data$value)

# formula of t value = (sample mean - population mean)/(sample SD/√sample size)

# using the above formula, t(calculated) value of the our dataset is 7.86

# Now, using student's t-test table, we have to see t(critical) value.
  # at alpha = 0.05 and degree of freedom = (sample size - 1), here, 20 - 1 = 19
# If t(critical) value is higher than t(calculated), null hypothesis is failed to be rejected i.e., accepted
# If t(calculated) value is higher than t(critical), alternate hypothesis accepted

# Checking for the normality
# By Shapiro-Wilk test
# In this test, null hypothesis is the data is normally distributed
# So, in this test, the p-value must be greater than 0.5


# First, we have to check whether out dataset is normally distributed

shapiro.test(data$value)
# p-value is 0.8473. That is, our dataset is normally distributed

# Performing one sample t-test
t.test(x = data$value,
       mu = 150) # we don't need any other parameter

# sample mean is 152.151 and p-value is 2.53e-07
# Thus, null hypothesis is rejected
# Thus, sample mean is significantly higher than population mean
