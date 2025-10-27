# What is paired t test (paired t test)

# Importing data
data <- read.csv("paired-samples-t-test.csv")

# In this data, a group of athletes were first given a carbohydrate drink and then recorded the miles they run
# After few days, the same group of athletes were given carbohydrate + protein drink and then again recorded miles they run
# Now, we need to check- any difference between the means of carb and carb+pro drink group
# As same participants are used in both group, that's why, it is called paired t test

# Requirements:
  # Data must be paired (two data of every participants)
  # Data must be quantitative
  # Mean differences of each participant data (eg. participant 1_carb - participant 1_carb+pro) must follow normal difference
      # no outlier in these mean differences


# Two additional things to know
  # Ordinal data: Categorical data with a meaningful order or rank, but 
        # the differences between categories are not necessarily equal or quantifiable.
        # Purpose: To show rank or sequence
        # Example : Satisfaction rating ("strongly disagree," "neutral," "strongly agree")
                # Drink size (small, medium, large)
  # Nominal data: Categorical data with no natural order or ranking between the categories.
        # Purpose: To name or label
        # Example: Gender (male, female), Marital status (single, married, divorced)



library(BSDA)


# Checking normal distribution of data of each group
shapiro.test(x = data$carb)
# p-value of carb group is 0.81. Greater than 0.05; so, normally distributed
shapiro.test(x = data$carb_protein)
# p-value of carb_protein is 0.6906. Greater than 0.05; so, normally distributed


# Checking normal distribution of mean differences
data$diff_before_after <- data$carb - data$carb_protein

shapiro.test(x = data$diff_before_after)
# p-value is 0.7797. So, normally distributed
  # if this p-value is found less than 0.05, then we cannot do paired t test'-
      # we need to do non-parametric Wilcoxson test

# checking if there is any outliers in the mean differences by boxplot

library(ggplot2)

ggplot(data = data, aes(x = diff_before_after)) +
  geom_boxplot(outliers = T) +
  coord_flip()
# or
# we can simply use

boxplot(data$diff_before_after) # no ourliers seen
# outliers are appeared as round shape or star.
# Round shape indicates outside 1.5 IQR and star (extreme outlier) indicates 3IQR
  # No outliers in mean differences


# Checking data homogeneity (by variance)
var.test(x = data$carb,y = data$carb_protein)
# p-value is 0.9409. So, no significant difference between variances of two groups


# Running paired t test
# Ho : no differences of mean of carb and carb_pro group 
t.test(x = data$carb,
       y = data$carb_protein,
       paired = TRUE)
# p-value 4.283e-06, less than 0.05
# So, null hypothesis is rejected
# there is significant difference between carb and carb_pro group
# 95 percent confidence interval: -0.18014508 -0.09085492
  # if both values are either negative or positive, then also, null hypothesis rejected


# In case, the mean differences (diff_before_after) are not in normal distribution and there are outliers-
  # Then we have to do Wilcoxon test

# Running Wilcoxon signed ranked test

wilcox.test(x = data$carb,
            y = data$carb_protein,
            paired = TRUE)
# Here, p-value = 0.0002677
# but, few things to keep in mind-
  # cannot compute exact p-value with ties (if any values of two groups are same)
  # cannot compute exact p-value with zeroes (if there are 0 values in any group)


# Calculating mean and SD
mean(data$carb)
sd(data$carb)
mean(data$carb_protein)
sd(data$carb_protein)


# Effect size
  # Suppose, we found that there is statistical significant difference between two groups
  # But, how much significant it is?
    # for this, we have to calculate effect size (d value)
        # ~ 0.2 - small effect size
        # ~ 0.5 - medium effect size
        # ~ 0.8 - large effect size

install.packages("effsize")
library(effsize)

cohen.d(data$carb_protein, data$carb, paired = T)
# d estimate: 0.186634 (negligible)
  # effect size has negligible effect


# Writing style in brief

# A paired samples T test was used to determine whether there was a
# statistically significant mean difference between the distance ran
# when participants imbibed a carbohydrate-protein drink, compared to 
# a carbohydrate only drink. No outliers were detected. 
# The assumption of normality was not violated, as assessed by the
# Shapiro-wilk's test where p = 0.780. Participants ran further when imbibing the
# carbohydrate-protein drink (Mean = 11.302 KM, SD = 0.726 KM), a statistically
# significant mean increase of 0.135 KM, 95% confidence interval (CI) [0.091, 0.181],
# t(degrees of freedom 19) = 6.352, p < 0.001, Cohen's d estimate: 0.187

# Histogram of mean differences
hist(data$diff_before_after)

library(ggplot2)
ggplot(data = data, aes(x = diff_before_after))+
  geom_histogram(aes(y = after_stat(density)))+
  geom_density()






