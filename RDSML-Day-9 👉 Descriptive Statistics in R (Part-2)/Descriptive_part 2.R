# Descriptive statistics using the psych package

library(psych)

data()
AirPassengers
BOD

# Using the New York airport flight data
# Already installed in previous class using install.packages("nycflights13")
# Double colon (::) is used to retrieve specific data file from whole data files
attach(nycflights13::flights)

# Lets look at the first 6 records using the head() function
head(nycflights13::flights)
distance
summary(distance)
describe(distance)

demo = cbind(arr_delay, dep_delay, distance)
describe(demo)

# Introducing the colnames() function
colnames(demo) = c('Arrival delay','Departure delay','Distance travelled')
describe(demo)

# Introducing the hist() function

dep_delay

# There are some missing data (written as NA). It will be discussed later classes
# Using hist(), we can get histogram
hist(dep_delay)

# How to group descriptive statistics
carrier
summary(carrier)
carrier_Fact = factor(carrier)
summary(carrier_Fact)

# Using describeBy() function. Here, we want to describe() based on carrier
describeBy(distance, group = carrier)

# Two levels of aggregation
aggregate(distance,by=list(carrier,month), FUN = mean, na.rm = TRUE)
# In the above argument, missing values are dealt with na.rm, rm stands for remove missing values; FUN is function

# If we want standard deviation, then FUN = sd
aggregate(distance,by=list(carrier,month), FUN = sd, na.rm = TRUE)
