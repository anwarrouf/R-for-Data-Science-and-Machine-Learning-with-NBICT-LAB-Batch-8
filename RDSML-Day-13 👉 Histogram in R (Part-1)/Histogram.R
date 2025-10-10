# Importing an external data set. 
# read.csv is the function to use. The name of the dataset must be within inverted comma
dataset = read.csv("data.csv")

library(ggplot2)

# basic histogram using ggplot2
ggplot(dataset,aes(x = weight)) +
  geom_histogram(aes(y = after_stat(count)), binwidth = 1, color = "black",fill = "pink", alpha = 0.2) # By default, in y-axis, number of occurrences i.e. count of x will be plotted. If 

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

myPlot + 
  geom_vline(aes(xintercept=mean(weight)),
             color='red',linetype = "dashed", size = 1)


# histogram with density plot; density plot is the smooth version of histogram
# A density plot is a smoothed representation of a histogram-
# providing a continuous curve that estimates the probability density function of a dataset

ggplot(dataset,aes(x = weight)) + # global mapping of aes in ggplot applies to all subsequent layers
  geom_histogram(aes(y=after_stat(density)),color="black", fill = "white") + # aes in geom function applies to only this layer
  geom_density(fill='blue',alpha=0.2)
# alpha indicates transparency of the fill area. alpha = 1 is completely opaque, less than 1 increases transparency

myPlot = ggplot(dataset,aes(x = weight)) +
  geom_histogram(color="black", fill = "lightblue")+
  theme_classic()
