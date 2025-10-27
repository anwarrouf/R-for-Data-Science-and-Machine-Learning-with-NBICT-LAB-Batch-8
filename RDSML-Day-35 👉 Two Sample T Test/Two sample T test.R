# Two sample T test (also known as independent t test)

# Let's assume, NBICT has trained thousands trainees
# Now we want to check the learning of male and female groups
# But, it is not feasible to assess 500 males and 500 female
# Thus, we can take 20 samples from each group

# Null hypothesis: No difference between male mean and female mean

# Why not we are doing two sample Z test?
# Here, we do not know population standard deviation
# Two sample T test is also known as independent t test
# Two groups are not dependent on each other; that's why, unpaired t test
# Conditions:-
  # Data must be quantitative i.e. numeric
  # Samples are independent of each other
  # Data must be normally distributed
  # In case, data is not normally distributed, then we have to do non-parametric t test


# On the other hand, we conduct an experiment with a BP drug.
# A patient groups' blood pressure are measured before drug treatment
# After drug treatment, blood pressures are measured again
# Here, same group is considered; that's why, in this case, dependend t test


# Importing data
data <- read.csv("scores.csv")

library(BSDA)

# Checking for the normal distribution (Shapiro-Wilk Normality test)
shapiro.test(data$Male)
# male group p-value = 0.9787. As it is greater than 0.05, so, normally distributed
shapiro.test(data$Female)
# female group p-value = 0.5568. As it is greater than 0.05, so, normally distributed

# Now, we need to check the variance of two groups
  # Variance is the dispersion of data (data homogeneity)
  # If there is no significant difference of variances of two groups, then one formula
  # If significant difference of variances of two groups, then another formula

# Variance test
var.test(x = data$Male, # first group
         y = data$Female) # second group or vice versa
# here, p-value is 0.2047; as it is greater than 0.05, so, we are failed to reject null hypothesis
# So, there is no significance differences between variances

# Running Independent t-test

t.test(x = data$Male,
       y = data$Female,
       paired = FALSE, # it is by default FALSE, 
       var.equal = TRUE) # as we got two variances equal or not significantly different. If not equal, then we would write var.equal = TRUE

# We got p-value = 0.02272
# As it is less than 0.05; so, we do not have evidence to accept null hypothesis
# So, null hypothesis is rejected
# Alternate hypothesis is accepted; thus, there is significant difference between male and female group




