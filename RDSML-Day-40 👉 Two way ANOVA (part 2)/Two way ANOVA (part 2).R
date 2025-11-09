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

residuals(m)


