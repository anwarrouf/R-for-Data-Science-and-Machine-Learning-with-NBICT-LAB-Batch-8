# Creating a data frame

dataset = data.frame(dose = c("D0.5","D1","D2"),length = c(4.2,10,29.5))
dataset

library(ggplot2)

# Creating a basic barplot

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
  geom_bar(stat = "identity", fill = "steelblue")+
  theme_minimal()
