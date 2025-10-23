# Explaining rbinorm
# rbinorm(n,size,prob). It generates random numbers from a binomial distribution
# Here, 
# n = number of random values to generate
# size = number of trials in each binomial experiments
# prob = probability of success in each trial

rbinom(n = 10, size = 1, prob = 0.5) # 0 is fail, 1 is success or 0 is tail, 1 is head

# Here,
# in the above example, we've taken 1 coin, tossed 10 times, and prob of head and tail is 0.5 for each trial

rbinom(n = 10, size = 5, prob = 0.5)
# in the above example,
# among participants, I picked 5 participants, gave each participant a coin, then asked these 5 participants to toss the coin
# the same event was repeated 10 times
# it may get a result like 2 3 2 3 3 4 2 3 2 2.
# here, 2 means, in first experiments, among 5, 2 participants got 2 heads

rbinom(n = 10, size = 10, prob = 0.5)

# Explaining pbinom
# pbinom() gives the cumulative probability of getting q or fewer successes in a binomial distribution
# pbinom (q = , size = , prob = )
# q --> number of successes
# size --> number of trials
# prob --> probability of success or failure in each trial

pbinom(q = 5, size = 10, prob = 0.5)
# the result will be 0.6230. This means that if a coin is tossed 10 times, then getting 5 or fewer successes is 62.30%
# We may get 3 heads in 10 trials; may get 4 heads in 10 trials
# here, q is the cumulative i.e. summation of all probabilities to get 5 heads or fewer

# for example, you tossed a coin 5 times, what is the probability to get exactly 3 heads?

pbinom(q = 3, size = 5, prob = 0.5) # 0.8125 or 81.25% - this will give probability of getting 3 or fewer heads in 5 tosses

pbinom(q = 2, size = 5, prob = 0.5) # 0.5 or 50% -  this will give probability of getting 2 or fewer heads in 5 tosses

# thus, getting exactly 3 heads or successes in 5 tosses is 81.25% - 50% = 31.25%


# Explaining qbinom()
# What is the smallest number of success x in 10 ( or n ) trials with 50% success chance in each trail
# (with 50% success chance i.e. probability 0.5 in each trail), such that the probability of getting x or fewer -
# successes is at least 30%?

qbinom(p = 0.3, size = 10, prob = 0.5)
# in the above example, it means that tossing a coin 10 times, it is at least 30% chance to get 4 or fewer heads
# p --> cumulative probability is 30%
# size --> number of trials is 10
# prob --> success or failure in each trial

# dbinom
# dbinom calculates the probability of getting exact number of successes in a series of trial

dbinom(x = 3, size = 5, prob = 0.5)
# in the above example, getting exactly 3 heads from 5 tosses of coin

# A exam quiz has 10 questions. Each question has 4 choices with only 1 correct answer.
# What is the probability of answering exactly 3 right answer?
# so, x = 3 (i.e. number of success), size = 10 (i.e. number of questions or trials), prob = 0.25 as 1 correct answer from 4 choices

dbinom(x = 3, size = 10, prob = 0.25)

dbinom(x = 2, size = 3, prob = 0.5)
