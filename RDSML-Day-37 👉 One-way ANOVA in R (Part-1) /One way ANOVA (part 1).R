# One way ANOVA (One way analysis of variance)

# Importing a dataset from R base packages

plant_data = PlantGrowth
plant_data

# Saving the data in our folder
plant_data <- write.csv(plant_data, "plant_data.csv")


# In this dataset, there are 3 groups - 
  # Groups here are Qualitative variables : ctrl (control), trt1 (treatment 1), trt2 (treatment 2)
  # Each group consists of 10

# ANOVA finds out statistical differences of group means
# Requirements:
  # Two variables- grouping variable (aka. factor) and dependent variable (quantitative)
  # All data must be in normal distribution and no outliers in any group
  # No significant differences between variances of the groups
  # Homogeneity of variances of all groups must be maintained


library(ggplot2)

# Creating group wise box plots

ggplot(data = plant_data, mapping = aes(x = factor(group), y = weight, colour = group)) +
  geom_boxplot() +
  theme_classic() +
  labs(title = "variation in plant weights \nbased on group")
# Outliers are present in treatment 1 group

# We can also do this by basic R function
boxplot(weight ~ group, # first dependent variable, then factor, মাঝখানে ~(tilda) সাইন
        data = PlantGrowth,
        main = "PlantGrowth data",
        ylab = "Dried weight of plants",
        col = "lightgray")


# Determination of mean, sd and se
library(dplyr)

stats <- plant_data %>%
  group_by(group) %>%
  summarise(
    mean = mean(weight),
    sd = sd(weight),
    se = sd(weight)/sqrt(n()) # n() দিয়ে sample size বুঝায়
  )
print(stats)


# Means plot

install.packages("ggpubr") # ggplot2 Publication Ready plots
library(ggpubr)
ggline(plant_data,
       x = "group", y = "weight",
       add = c("mean_se", "jitter")
       )
# Null hypothesis: There is no difference between groups


# Running One way ANOVA

anova <- aov(formula = weight ~ group, # dependent variable ~ grouping variable
             data = plant_data) # source dataframe

summary(anova) # summary কল করতে হবে

# p-value is found 0.0159. So,statistically significant
# But, it is not specified which group or groups are significant
# Now, we have to do post-hoc test


