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
# Lest look at the first six record using the head() function. Head() shows first 6 rows. If we want to see more rows, then put the number)
head(nycflights13::flights)

