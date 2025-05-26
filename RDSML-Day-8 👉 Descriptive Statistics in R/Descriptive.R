# Descriptive statistics using the psych package

install.packages("psych")
library(psych)

data()

AirPassengers
BOD
# Using the New York flight data
install.packages("nycflights13")
# To use different functions of a package, we need to use the library()
library(nycflights13)
# On the other hand, if we need to use given data of a package, then we use attach()
attach(nycflights13::flights)

# Lest look at the first six records using the head() function. Head() shows first 6 rows. If we want to see more rows, then put the number)
head(nycflights13::flights)

# If we want to see whole dataset, then we have to do
nycflights13::flights
# The above command shows huge data, that's why, we use head function to understand the dataset

# If we want to see last six rows of a data set, then we use tail function
tail(nycflights13::flights)
summary(distance)
# Summary is a base package of R. In psych package, there is a function- describe like summary function, that gives more details
describe(distance)

# If we want to descriptive analysis of multiple columns, then we need to bundle the desired columns first
# cbind is a function that create bundle of multiple columns

demo  = cbind(arr_delay,dep_delay, distance)
demo

# Now we can use describe function
describe(demo)
