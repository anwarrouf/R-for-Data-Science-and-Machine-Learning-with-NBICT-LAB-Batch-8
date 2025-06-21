# Importing an external data set. 
# read.csv is the function to use. The name of the dataset must be within inverted comma
dataset = read.csv("data.csv")

library(ggplot2)

# basic histogram using ggplot2
ggplot(dataset,aes(x = weight)) +
  geom_histogram()

# changing the width of bins. Each pillar of the histogram is known as bin
# color indicates border color of bin, fill indicates fill color of bin
ggplot(dataset,aes(x = weight)) +
  geom_histogram(binwidth = 1,color="black", fill = "lightblue")

# adding the mean line in histogram; vline means vertical line
# We can give the whole code another name
# theme_classic shows without background
myPlot = ggplot(dataset,aes(x = weight)) +
  geom_histogram(color="black", fill = "lightblue")+
  theme_classic()

myPlot

myPlot + geom_vline(aes(xintercept=mean(weight)),color='red',linetype = "dashed", size = 1)


# histogram with density plot; density plot is the smooth version of histogram
# A density plot is a smoothed representation of a histogram-
# providing a continuous curve that estimates the probability density function of a dataset

ggplot(dataset,aes(x = weight)) +
  geom_histogram(aes(y=after_stat(density)),color="black", fill = "white") +
  geom_density(fill='blue',alpha=0.2)
# alpha indicates transparency of the fill area. The less alpha is from 1, the more transparent the filled area will be

myPlot = ggplot(dataset,aes(x = weight)) +
  geom_histogram(color="black", fill = "lightblue")+
  theme_classic()
