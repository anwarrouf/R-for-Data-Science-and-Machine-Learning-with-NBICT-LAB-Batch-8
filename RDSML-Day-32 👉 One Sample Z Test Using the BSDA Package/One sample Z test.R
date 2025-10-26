# What is Z test
# Let's assume: A machine manufactures perfume bottle.
# For 1000 bottles the machine produced have a mean volume of 150 ml i.e. population mean and Standard Deviation of 2
# Now, we recalibrated the machine and then took a sample of 100 bottles and measure the volumes.
# For example, we got 148 ml, 155 ml, 152 ml,............., 149 ml
# These samples have a mean of 152 ml
# Now, the population mean and sample mean are statistically significantly different or not?

# Conditions:
# Population mean must be known
# Standard deviation must be known

# Null hypothesis (Ho): there is no difference between population mean and sample mean

# Importing data set
dataset <- read.csv("Perfume.csv")

install.packages("BSDA") # Basic statistics and data analysis
library(BSDA)

# When we collect sample for a population and population mean is known;then this is one sample Z test
# If want to know where the sample mean is either greater or lower than the population mean, then it is one tail test
# If want to check greater or lower, then two tail test
mean(dataset$Machine.1)

# Sample size is recommended to be greater than 30


z.test(x=dataset$Machine.1, # as only one sample, that's why no y value here
       alternative = "greater", # greater, less, two-sided
       mu = 150, # population mean
       sigma.x = 2, # population standard deviation
       conf.level = 0.95) # conf.level = 0.95 by default; we can change it 0.99
# the result p-value is < 2.2e16
# Thus, alternate hypothesis is accepted. That is-
# sample mean is statistically significantly greater than population mean
# That is, the machine is producing significantly larger volume.
# So, we need to recalibrate the machine
