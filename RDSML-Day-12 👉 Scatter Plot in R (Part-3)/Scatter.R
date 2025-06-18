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

# filling the color of confidence bands
ggplot(dataset,aes(x=wt,y=mpg,color=cyl,shape=cyl))+
  geom_point()+
  geom_smooth(method=lm,fullrange=TRUE)
