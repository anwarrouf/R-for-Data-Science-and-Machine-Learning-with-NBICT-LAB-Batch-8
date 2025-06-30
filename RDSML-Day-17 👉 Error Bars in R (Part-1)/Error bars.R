library(ggplot2)

# Importing a built in dataset from R. ToothGrowth is given in R
ToothGrowth
View(ToothGrowth)
tooth_data = ToothGrowth

# Creating a function for summarize the data
# based on the grouping variables such as

# What is function? For example, we want to make a function - sum that will add values and returning the results


install.packages("plyr")
library(plyr)


data_summary = function(data, varname, groupnames){
  require(plyr)
  summary_func = function(x, col){
    c(mean = mean(x[[col]], na.rm = TRUE), sd = sd(x[[col]], na.rm = TRUE))
  }
  data_sum = ddply(data, groupnames, .fun = summary_func, varname)
  data_sum = rename(data_sum, c("mean" = varname))
  return(data_sum)
}

d_summary = data_summary(tooth_data,varname = "len", groupnames = c("supp", "dose"))
