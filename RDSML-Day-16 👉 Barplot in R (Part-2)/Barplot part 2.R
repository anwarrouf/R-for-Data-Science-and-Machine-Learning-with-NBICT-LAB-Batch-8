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

# Using brewer color palette. Need to provide name of the color palette
ggplot(dataset,aes(x = dose,y = length, color = dose))+
  geom_bar(stat = "identity", fill = "white")+
  scale_color_brewer(palette = "Dark2")

# Using grey scale
ggplot(dataset,aes(x = dose,y = length, color = dose))+
  geom_bar(stat = "identity", fill = "white")+
  scale_color_grey()
  
# Using no background, by choosing theme_classic
ggplot(dataset,aes(x = dose,y = length, color = dose))+
  geom_bar(stat = "identity", fill = "white")+
  scale_color_grey()+
  theme_classic()

# To change fill colors by groups
ggplot(dataset,aes(x = dose,y = length, fill = dose))+
  geom_bar(stat = "identity")

# Using minimal theme to remove background

ggplot(dataset,aes(x = dose,y = length, fill = dose))+
  geom_bar(stat = "identity")+
  theme_minimal()

# Using customize bar fill color
ggplot(dataset,aes(x = dose,y = length, fill = dose))+
  geom_bar(stat = "identity")+
  scale_fill_manual(values = c("yellow","purple","pink"))+
  theme_minimal()

# We can also use brewer color palette like above exampe

# Using black outline color
ggplot(dataset,aes(x = dose,y = length, fill = dose))+
  geom_bar(stat = "identity", color = "black")+
  scale_fill_manual(values = c("blue","pink","white"))


# changing legend position. If legend.position = "none", legend will be removed
ggplot(dataset,aes(x = dose,y = length, fill = dose))+
  geom_bar(stat = "identity", color = "black")+
  scale_fill_manual(values = c("blue","pink","white"))+
  scale_color_brewer(palette= "black")+
  theme_classic()+
  theme(legend.position = "bottom")

# We should learn more about github from internet. Please search youtube videos for github free courses

