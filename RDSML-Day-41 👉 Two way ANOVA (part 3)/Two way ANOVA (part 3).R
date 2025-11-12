# Importing data
data <- read.csv("cropdata.csv")

# Descriptve statistics

library(dplyr)

stats <- data %>%
  group_by(fert,irr) %>%
  summarise(mean_yield = mean(y),
            se_yield = sd(y)/n())

# Data visualization
library(ggplot2)

ggplot(stats, aes(x = irr, y = mean_yield, group = fert)) +
  geom_line() +
  geom_point(size = 2) +
  geom_errorbar(mapping = aes(ymin = mean_yield - se_yield, ymax = mean_yield + se_yield), width = 0.2) +
  facet_wrap(facets = ~ fert, nrow = 1, ncol = 3) +
  labs(x  = "Irrigation", y = "Mean yield",
       title = "Interaction of fertilizer and irrigation on crop yield") +
  theme_classic(base_size = 12)

# Fit the model for two way ANOVA

m <- aov(formula = y ~ fert + irr + fert*irr,
         data = data)
summary(m)
# dependent  ~ independent,
# * indicates interaction between two variables

# The results are below-
# Df Sum Sq Mean Sq F value   Pr(>F)    
# fert          2   5511  2755.3  69.743  < 2e-16 ***
#  irr           1   2290  2289.6  57.954 8.45e-12 ***
#  fert:irr      2     80    39.9   1.009    0.368    
#  Residuals   114   4504    39.5                     
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
  
  
# Assumptions
  # Data must be normal distribution
  # Residuals must be normal distribution
  # Homogeneity of variances must be maintained
  

# Assumptions visual check

par(mfrow = c(2,2))
plot(m) # this will create 4 plots. To arrange these 4 plots, we need to run 'par' function first

# To return to normal plotting layout, par(mfrow = c(1,1))


# Shapiro Wilk on residuals (normality)

res <- residuals(m)
shapiro.test(res)

# the result is W = 0.99056, p-value = 0.5848; so, data is normal distribution

# Levene's test for equal variances
library(car)
car::leveneTest(y ~ fert*irr, data = data, center = median) # considering median as reference
# the result is Df F value Pr(>F)
# group   5  0.6156 0.6882 # so, variances are equal
#         114 

# Interaction contrasts (simple effects) : 
  # effect of fertilizer at each level of irrigation
    # At low irr, any different between fert groups
    # The same as at high irr

library(emmeans)
contrast(emmeans(m, ~ fert | irr), method = "pairwise", adjust = "tukey")

# This asks for estimated marginal means (EMMs) of fert, separately for each level of irr.
# In words:
  # “Give me the mean response for each fertilizer type, within each irrigation level, adjusted for the model.”
  # Compare all levels of fert pairwise (Con vs N, Con vs N+P, N vs N+P) within each level of irr.

# Comparing mean response for each irrigation group, within each fertilizer
contrast(emmeans(m, ~ irr | fert), method = "pairwise", adjust = "tukey")



stat_irr <- data %>%
  group_by(irr) %>%
  summarise(mean = mean(y))


irr_data <- data %>%
  filter(data$irr == "High" & data$irr == "Low")

library(BSDA)

t.test()

stat_fert <- data %>%
  group_by(fert) %>%
  summarise(mean = mean(y))

View(data)
irr_data <- data%>%
  arrange(irr)
