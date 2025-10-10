library(ggplot2)
dataset = mtcars

# Converting cyl column from a numeric to a factor variable
dataset$cyl = as.factor(dataset$cyl)

# Adding regression line based on multiple groups

ggplot(dataset,aes(x=wt,y=mpg,color=cyl,shape=cyl))+
  geom_point()+
  geom_smooth(method=lm)

# removing confidence interval
ggplot(dataset,aes(x=wt,y=mpg,color=cyl,shape=cyl))+
  geom_point()+
  geom_smooth(method=lm,se=FALSE)

# Extending the regression line: if we want to extrapolate all regression lines, then we need to use an extra argument - fullrange
ggplot(dataset,aes(x=wt,y=mpg,color=cyl,shape=cyl))+
  geom_point()+
  geom_smooth(method=lm,se=FALSE,fullrange=TRUE)

# filling the color of confidence bands of each cyl group
ggplot(dataset,aes(x=wt,y=mpg,color=cyl,shape=cyl))+
  geom_point()+
  geom_smooth(method=lm,aes(color=cyl)) # চাইলে আমরা size অনুসারেও করতে পারি

# Changing the point shapes manually
ggplot(dataset,aes(x=wt,y=mpg,color=cyl,shape=cyl))+
  geom_point(size=3)+
  geom_smooth(method=lm,se=F,fullrange=T)+
  scale_shape_manual(values=c(5,3,17))

# Changing the position of the legend
ggplot(dataset,aes(x=wt,y=mpg,color=cyl,shape=cyl))+
  geom_point(size=3)+
  geom_smooth(method=lm,se=F,fullrange=T)+
  scale_shape_manual(values=c(5,3,17))+
  theme(legend.position = "top")

# Changing the point colors manually
ggplot(dataset,aes(x=wt,y=mpg,color=cyl,shape=cyl))+
  geom_point(size=3)+
  geom_smooth(method=lm,se=F,fullrange=T)+
  scale_shape_manual(values=c(5,3,17))+
  scale_color_manual(values=c("darkblue","grey","orange"))+
  theme(legend.position = "top")

# Customizing scatter plot
ggplot(dataset,aes(x=wt,y=mpg,color=cyl,shape=cyl))+
  geom_point(size=3)+
  geom_smooth(method=lm,se=F,fullrange=T)+
  scale_shape_manual(values=c(5,3,17))+
  scale_color_manual(values=c("darkblue","grey","orange"))+
  labs(title="Miles per gallon according to the weight")+
  theme(legend.position = "top")

# if the title is too long, then we can split it into two sentences (using \n i.e. new line)
ggplot(dataset,aes(x=wt,y=mpg,color=cyl,shape=cyl))+
  geom_point(size=3)+
  geom_smooth(method=lm,se=F,fullrange=T)+
  scale_shape_manual(values=c(5,3,17))+
  scale_color_manual(values=c("darkblue","grey","orange"))+
  labs(title="Miles per gallon \naccording to the weight")+
  theme(legend.position = "top")

# Adding x and y axes label
ggplot(dataset,aes(x=wt,y=mpg,color=cyl,shape=cyl))+
  geom_point(size=3)+
  geom_smooth(method=lm,se=F,fullrange=T)+
  scale_shape_manual(values=c(5,3,17))+
  scale_color_manual(values=c("darkblue","grey","orange"))+
  labs(title="Miles per gallon \naccording to the weight",x="Weight",y="Miles/Gallon")+
  theme(legend.position = "top")

# Customizing themes
plot = ggplot(dataset,aes(x=wt,y=mpg,color=cyl,shape=cyl))+
  geom_point(size=3)+
  geom_smooth(method=lm,se=F,fullrange=T)+
  scale_shape_manual(values=c(5,3,17))+
  scale_color_manual(values=c("darkblue","grey","orange"))+
  labs(title="Miles per gallon \naccording to the weight",x="Weight",y="Miles/Gallon")+
  theme(legend.position = "top")
# theme_classic() does not have any background, i.e. clear background we normally use in publication
plot + theme_classic()
plot + theme_minimal()

# In above two theme figures, we see that the legend position is on right, although we set legend position on top
# This is because, in these two themes, default legend positions are on right
