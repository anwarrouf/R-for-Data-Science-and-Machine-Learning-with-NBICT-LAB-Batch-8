# Importing data
data <- read.csv("cropdata.csv")

# Two way ANOVA

# Simple main effect
  # suppose, we ignore 'irrigation' condition
  # in that case, control, nitrogen and nitro+phos - each has 40 replicates
  # These groups have mean yield
  # Do nitro and nitro+phos differ significantly from control group

  # On the other hand, if we omit fertilizer, then does irrigation affect between high and low irrigation group?

# Interaction effect
  # Considering both irrigation and fertilizer, does irrigation with fertilizer to produce different yield?

install.packages(c("tidyverse","emmeans","effectsize","performance","broom","kableExtra"))
library(tidyverse)

# Descriptive statistics of each condition

library(dplyr)

stats <- data %>%
  group_by(fert,irr) %>%
  summarise(mean_yield = mean(y),
            sd_yield = sd(y),
            count_yield = n(),
            se_yield = sd_yield/sqrt(count_yield))

library(ggplot2)

# Finding any outliers by boxplot

ggplot(data, mapping = aes(x = fert, y = y, fill = irr))+
  geom_boxplot(outlier.colour = "red") +
  labs(title = "Effect of fertilizer and irrigation on yield",
       x = "Fertilizer",
       y = "Yield",
       caption = "Data collected from WB") +
  theme(plot.title = element_text(hjust = 0.5, size = 12)) +
  theme_classic()

str(stats)


# Quick data visualization
ggplot(stats, aes(x = irr, y = mean_yield, group = fert)) +
  geom_line() +
  geom_point(size = 2) +
  geom_errorbar(mapping = aes(ymin = mean_yield - se_yield, ymax = mean_yield + se_yield), width = 0.2) +
  facet_wrap(facets = ~ fert, nrow = 1, ncol = 3) +
  labs(x  = "Irrigation", y = "Mean yield",
       title = "Interaction of fertilizer and irrigation on crop yield") +
  theme_classic(base_size = 12)
