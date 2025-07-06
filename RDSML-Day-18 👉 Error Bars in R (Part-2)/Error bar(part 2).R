library(ggplot2)

# Importing a built in dataset from R. ToothGrowth is given in R
ToothGrowth
tooth_data = ToothGrowth

# data বলতে যে dataset নিয়ে কাজ করতে চাই। এক্ষেত্রে toothGrowth হচ্ছে dataset
# varname বলতে যে variable নিয়ে কাজ করবো । এক্ষেত্রে len হচ্ছে variable
# groupnames বলতে যে group নিয়ে কাজ করবো । এক্ষেত্রে dose and supp হচ্ছে groupnames

data_summary = function(data, varname, groupnames){
  require(plyr) # function এর ভিতর কোন package দরকার হলে,library না বলে require দিয়ে call করতে হবে
  
  summary_func = function(x, col){ # function এর ভিতর আরেকটি function তৈরি করা হলে এটাকে nested function বলা হয়
    c(mean = mean(x[[col]], na.rm = TRUE), sd = sd(x[[col]], na.rm = TRUE)) # na.rm বলতে যদি কোন value miss থাকে, true দিলে missing value গুলোকে ফাইনাল calculation এ consider করা হবে না।
  }
  
  all_summary = ddply(data, groupnames, .fun = summary_func, varname) # ddply হচ্ছে plyr এর একটা function।
  data_sum = rename(all_summary,c("mean" = varname))
  return(data_sum)
}

d_summary = data_summary(tooth_data,varname = "len", groupnames = c("supp", "dose"))

# converting dose to a factor variable
d_summary$dose = as.factor(d_summary$dose)

# standard deviation of the mean as error bar with explanation
ggplot(d_summary, aes(x = dose, y = len, fill = supp))+ # By defaulty, it produces stacked bar diagram.
  geom_bar(stat = "identity")
# To get side by side bar diagram, we need to add position argument
ggplot(d_summary, aes(x = dose, y = len, fill = supp))+ 
  geom_bar(stat = "identity", position = position_dodge())+
  geom_errorbar(aes(ymin =len - sd , ymax = len + sd), width = 0.2,position = position_dodge(0.9))+ # position_doge(0.9) দিলে একদম মাঝে চলে আসে
  theme_classic()
