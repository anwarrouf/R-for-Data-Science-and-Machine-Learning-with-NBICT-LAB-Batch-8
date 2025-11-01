# Continued from last class

# One way ANOVA for group wise comparisons

# Importing a dataset from R base packages

plant_data = PlantGrowth
plant_data

# Saving the data in our folder
plant_data <- write.csv(plant_data, "plant_data.csv")


library(ggplot2)

# Creating group wise box plots

ggplot(data = plant_data, mapping = aes(x = factor(group), y = weight, colour = group)) +
  geom_boxplot() +
  theme_classic() +
  labs(title = "variation in plant weights \nbased on group") +
  theme(plot.title = element_text(size = 16, famity = "arial", face = "bold"))
  

ggsave("boxplot to detect outlier.tiff",width = 3,height = 3,units = "in" )

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


# Null hypothesis: There is no difference between groups


# Running One way ANOVA

anova <- aov(formula = weight ~ group, # dependent variable ~ grouping variable
             data = plant_data) # source dataframe

summary(anova) # summary কল করতে হবে

# p-value is found 0.0159. So,statistically significant
# But, it is not specified which group or groups are significant
# Now, we have to do post-hoc test

# Tukey multiple pairwise comparisons

TukeyHSD(anova)
# the results are
# diff        lwr       upr     p adj
# trt1-ctrl -0.371 -1.0622161 0.3202161 0.3908711
# trt2-ctrl  0.494 -0.1972161 1.1852161 0.1979960
# trt2-trt1  0.865  0.1737839 1.5562161 0.0120064


# But, at first we have to check
# Homogeneity of variances of residual values

# by plot observations

plot(anova, which = 1)
# to check homogeneity, we need to mention the whole anova formula,
# then which = 1 for residuals vs fitted plot
# which = 2 for Q-Q residuals
# data 17,15 & 4 are outliers
# To get accurate results, we need to exclude outliers

# residuals vs fitted plot showed-
  # In X axis - ascending order of mean (here, trt1, cont, trt2)
  # In y axis - residuals. Residual is calculated by (mean - individual value)

library(car)
# To check homogeneity of variances
leveneTest(weight ~ group, data = plant_data)
# the result is 
#        f F value Pr(>F)
#group  2  1.1192 0.3412 # as p-value is greater than 0.05, then homogeneity is maintained


# In case, p-value in leveneTest is lower than 0.05, then we need to do the following i.e.
# anova test for no assumption of equal variances

oneway.test(weight ~ group, data = plant_data)

# the result showing like following-
  # One-way analysis of means (not assuming equal variances)
  # data:  weight and group
  # F = 5.181, num df = 2.000, denom df = 17.128, p-value = 0.01739

# Pairwise t-test with no assumption of equal variances
pairwise.t.test(plant_data$weight, plant_data$group,p.adjust.method = "BH", pool.sd = FALSE)
