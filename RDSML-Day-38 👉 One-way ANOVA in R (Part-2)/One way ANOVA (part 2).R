PlantGrowth <- PlantGrowth
stats <- PlantGrowth %>%
  group_by(group) %>%
  summarize(
    mean = mean(weight),
    sd = sd(weight),
    se = sd(weight)/sqrt(n())
  )
print(stats)

anova <- aov(weight ~ group, data = PlantGrowth)
anova
summary(anova)

# Tukey multiple pairwise-comparisons

TukeyHSD(anova)

# Homogeneity of variances

plot(anova, 1)
# residuals are calculated by original value - group mean
# There can be no significant difference between variances of residuals. LeveneTest will be used

install.packages("car")
library(car)

leveneTest(weight ~ group, data = PlantGrowth)

# P value must be greater than 0.05. It means homogeneity is maintained in variances

# In case, P value is less than 0.05, 
# then we will use ANOVA test with no assumption of equal variances i.e. 
# homogeneity of variances is not maintained

oneway.test(weight ~ group, data = PlantGrowth)

# Pair-wise t-tests with no assumption of equal variances

pairwise.t.test(PlantGrowth$weight,PlantGrowth$group,
                p.adjust.method = "BH", poo.sd = FALSE)

# Checking for normal distribution
plot(anova, 2)

# Extracting the residuals

aov_res <- residuals(object = anova)
print(aov_res)

# Running the Shapiro-wilk test
shapiro.test(aov_res)  # p value must be 0.05

kruskal.test(weight ~ group, data = PlantGrowth)