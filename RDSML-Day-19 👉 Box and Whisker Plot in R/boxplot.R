# Loading the dataset
my_data = ToothGrowth

# Converting the variable dose from a numeric to a factor variable
my_data$dose = as.factor(my_data$dose)

library(ggplot2)

ggplot(my_data, aes(x = dose, y = len)) +
  geom_boxplot()

# Boxplot ডাটার distribute বুঝতে সাহায্যকরে
# data এর median এর অবস্থান দেখে data এর distribute বোঝা যায়
# boxplot এর সাহায্য outlier চিহ্নিত করা যায়। Box এর নীচের horizontal line - ২৫% percentile নির্দেশ করে।
# Box এর উপরের horizontal টা ৭৫% percentile নির্দেশ করে।
# The IQR is found by subtracting Q1 from Q3: IQR = Q3 - Q1
# The IQR provides insight into the spread or variability of the middle portion of the data, excluding potential outliers.
# It's a robust measure, meaning it's less affected by extreme values than other measures like the range
# The IQR is also used in identifying outliers. Data points falling below Q1 - 1.5 * IQR or 
# above Q3 + 1.5 * IQR are often considered outliers. 

# Rotating the box plot
ggplot(my_data, aes(x = dose, y = len)) +
  geom_boxplot()+
  coord_flip()

# Notched box plot
ggplot(my_data, aes(x = dose, y = len)) +
  geom_boxplot(notch = TRUE)

# Highlighting the outliers by changing the color, shape an size of outlier
ggplot(my_data, aes(x = dose, y = len)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 8, outlier.size = 3)

# Ignoring outlier
ggplot(my_data, aes(x = dose, y = len)) +
  geom_boxplot( outlier.shape = NA)

# Choosing which item to display
ggplot(my_data, aes(x = dose, y = len)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 8, outlier.size = 3) +
  scale_x_discrete(limit=c("0.5","2"))

# Changing box plot line colors by group
ggplot(my_data, aes(x = dose, y = len, color = dose)) +
  geom_boxplot()

# Changing the item order
ggplot(my_data, aes(x = dose, y = len, color = dose)) +
  geom_boxplot() +
  scale_x_discrete(limit = c("2","1","0.5"))

# Boxplot with multiple groups
ggplot(my_data, aes(x = dose, y = len, fill = supp)) +
  geom_boxplot()

# Changing distance between boxes
ggplot(my_data, aes(x = dose, y = len, fill = supp)) +
  geom_boxplot(position = position_dodge(1)) +
  theme_classic()
