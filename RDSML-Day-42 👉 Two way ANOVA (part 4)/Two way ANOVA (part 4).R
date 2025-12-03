#  1) Importing data ----
data <- read.csv("cropdata.csv")

# 2) Importing required packages ----

# 3) Calculating Descriptive statistics ----

library(dplyr)

stats <- data %>%
  group_by(fert,irr) %>%
  summarise(mean_yield = mean(y),
            se_yield = sd(y)/sqrt(n())) # n() indicates number of values

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

# We can do the same by the following codes-

ggplot(data, aes(x = irr, y = y)) +
  stat_summary(fun = mean, geom = "line", aes(group = fert), size = 0.75) +
  stat_summary(fun = mean, geom = "point", aes(group = fert), size = 3, alpha = 0.5) +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.4) +
  facet_wrap(~fert) +
  labs(x  = "Irrigation", y = "Mean yield",
       title = "Interaction of fertilizer and irrigation on crop yield") +
  theme_classic()


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


library(BSDA)

t.test()

stat_fert <- data %>%
  group_by(fert) %>%
  summarise(mean = mean(y))

View(data)
irr_data <- data%>%
  arrange(irr)


# Main effect comparisons only if interaction is negligible
contrast(emmeans(m, ~fert), method = "tukey")
contrast(emmeans(m, ~irr), method = "tukey")


# Can do the same by following code-
fert_test <- aov(formula = y ~ fert, data = data)
summary(fert_test)
TukeyHSD(fert_test)

# what about irr-high and irr-low
irr_test <- t.test(formula = y ~ irr, data = data, var.equal = FALSE)
irr_test


# Lettering
install.packages("multcomp") # multiple comparison
library(multcomp)

install.packages("multicompView")
library(multcompView)

group_letters <- cld(emmeans(m, ~ fert * irr),LETTERS = letters)


# Publication-ready ANOVA table
library(broom)

install.packages("kableExtra")
library(kableExtra)

install.packages("kableExtra", dependencies = TRUE)

library(dplyr)

aov_tab <- Anova(m, type = 3) %>%
  tidy() %>%
  mutate(p.value = signif(p.value, 3))

kbl(aov_tab, digits = 3, caption = "Two-way ANOVA") %>%
  kable_classic(full_width = FALSE, html_font = "Times New Roman")




p_raw <- ggplot(data = data, mapping = aes(x = irr, y = y, color = fert)) +
  geom_jitter() +
  stat_summary(fun = mean, geom = "point", position = position_dodge(), size = 4)
p_raw
  
















