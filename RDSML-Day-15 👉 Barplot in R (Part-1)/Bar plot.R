# Creating a data frame

dataset = data.frame(dose = c("D0.5","D1","D2"),
                     length = c(4.2,10,29.5))
dataset

library(ggplot2)

# Creating a basic barplot. We must use stat = "identity". If not used, then nothing will appear.

ggplot(dataset, aes(x=dose,y=length))+
  geom_bar(stat = "identity")

# The above one is a vertical barplot. To create horizontal barplot, i.e. we will just flip the coordinate
ggplot(dataset, aes(x=dose,y=length))+
  geom_bar(stat = "identity")+
  coord_flip()

# To change the width of bars
ggplot(dataset, aes(x=dose,y=length))+
  geom_bar(stat = "identity",width = 0.75)

# To change the border and fill colors of bars
ggplot(dataset,aes(x = dose, y = length))+
  geom_bar(stat = "identity", width = 0.5, color = "blue", fill = "lightpink")

# minimal theme with blue fill color
ggplot(dataset,aes(x = dose, y = length))+
  geom_bar(stat = "identity", fill = "steelblue",color="yellow")+
  coord_flip()+
  theme_minimal()

# Bar plot with label that is we want show the values on top or inside of the bar
ggplot(dataset,aes(x = dose, y = length))+
  geom_bar(stat = "identity", fill = "steelblue",color="yellow")+
  geom_text(aes(label=length), vjust = -0.5, size = 3, color = "red")+ # values are shown, vjust i.e. vertical justification is needed
  theme_minimal()
# If we give positive number to vjust, then the values are shown inside the bar

myCarData = mtcars
# Bar plot of counts
# We want to build a bar plot on the basis of number of cylinders
ggplot(myCarData, aes(x=factor(cyl)))+
  geom_bar(stat = "count")+
  labs(x="number of cylinder")+
  theme_minimal()

# stat is identity used as the plot is using the exact plot of that plot. On the other hand, stat = count then the plot is built on count

