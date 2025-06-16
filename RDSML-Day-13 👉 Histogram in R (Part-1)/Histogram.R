# Importing an external data set. 
# read.csv is the function to use. The name of the dataset must be within inverted comma
dataset = read.csv("data.csv")

library(ggplot2)

# basic histogram using ggplot2
ggplot(dataset,aes(x = weight)) +
  geom_histogram()

# changing the width of bins. Each pillar of the histogram is known as bin
ggplot(dataset,aes(x = weight)) +
  geom_histogram(binwidth = 1,color="black", fill = "lightblue")

# adding the mean line in histogram
# We can keep the whole code another name
myPlot = ggplot(dataset,aes(x = weight)) +
  geom_histogram(color="black", fill = "lightblue")

myPlot + geom_vline(aes(xintercept=mean(weight)),color='red')
