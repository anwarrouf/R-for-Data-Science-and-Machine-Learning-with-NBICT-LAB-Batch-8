dataset = data.frame(dose = c("D0.5","D1","D2"),length = c(4.2,10,29.5))
dataset

library(ggplot2)

ggplot(dataset, aes(x=dose,y=length))+
  geom_bar(stat = "identity")

# Changing bar plot line colors by groups
ggplot(dataset,aes(x = dose,y = length))+
  geom_bar(stat = "identity", fill = "white")

#We want different border colors of the bar; here, based on dose
ggplot(dataset,aes(x = dose,y = length, color = dose))+
  geom_bar(stat = "identity", fill = "white")

# Using custom color palette
ggplot(dataset,aes(x = dose,y = length, color = dose))+
  geom_bar(stat = "identity", fill = "white")+
  scale_color_manual(values = c("blue","red","green"))

# We can also use hexadecimal color code instead of using exact name of the colors