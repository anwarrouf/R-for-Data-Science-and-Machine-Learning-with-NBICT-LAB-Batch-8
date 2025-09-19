# Assume we have a data set containing 10,000 values i.e. ages of a population.

# Distribution of values can be normal, uniform or skewed

# Let's take a sample (S1) of 5 random values from the data set and calculate the mean (SM1) of these 5 value

# Now taking another sample (S2) of 5 random values and calculate the mean (SM2) of these 5 values

# Suppose, the process of taking 5 random values (S1, S2,...S1000) repeated for 1000 times (SM1, SM2,......SM1000)

# Now, a histogram is formulated using these mean values
# This histogram will show normal distribution even though the original data was not normally distributed
# This is called 'Central Limit Theorem (CLT). Key points of CLT are
  # 1. Population shape (can be uniform, normal or skewed) doesn't matter
  # 2. Sample size matters- the larger the sample size, the closer the sample mean distribution will be to normal
  # 3. Mean of the sampling distribution (i.e. mean of all means calculated)- the average of the sample means equals to the population mean
  # 4. Standard deviation of sampling means is smaller than the population's standard deviation

# Why CLT is important? 
  # CLT is the foundation of inferential statistics.
  # Most statistical tests (t-test, confidence interval, ANOVA)


# Uniform distribution

# Normal distribution

# Skewed distribution

# Demonstration of CLT
# Generate 10,000 times number of uniform distribution (heights of all pillars almost same)

# Example of a rolling dice. Probability of getting 1, 2, 3, 4, 5 and 6 can be -
# This is an example of uniform distribution

die_faces <- c(0.16,0.17,0.15,0.18,0.19,0.15)
plot <- barplot(die_faces,
        xlab = "die faces",
        ylab = "probability",
        ylim = c(0,0.2),
        breaks = seq(0,0.2,by = 0.05), # for intervals in y axis
        )

r <- runif(10000) # 'runif' stands for random uniform'. Generate 10,000 random numbers from a uniform distribution between 0 and 1
r
hist(r)
mean_r<- mean(r)
mean_r
sd_r <- sd(r)
sd_r

# Sampling of values from the above r data set

# Proving central limit theorem by R. Explanation below:

# Draw three random samples from the distribution

samples1 <- sample(r,4) # sample is a function(dataset, how many values to choose)
samples1
samples2 <- sample(r,4)
samples2
samples3 <- sample(r,4)
samples3


mean(samples1)
mean(samples2)
mean(samples3)

# Run a 'for' loop

cl4 <- mean(sample(r,4)) # assume cl4 is to calculate 4 samples from 10000 values
cl4

for (i in 1:1000){
  cl4 <- c(cl4, mean(sample(r,4)))
} # this loop will run from 1 to 1000
cl4
hist(cl4)

cl10 <- mean(sample(r,10)) # assume cl4 is to calculate 10 samples from 10000 values
cl10

for (i in 1:1000){
  cl10 <- c(cl10, mean(sample(r,4)))
} # this loop will run from 1 to 1000
cl10
hist(cl10)

cl100 <- mean(sample(r,100)) # assume cl4 is to calculate 100 samples from 10000 values
cl100

for (i in 1:1000){
  cl100 <- c(cl100, mean(sample(r,4)))
} # this loop will run from 1 to 1000
cl100
hist_cl100 = hist(cl100)
