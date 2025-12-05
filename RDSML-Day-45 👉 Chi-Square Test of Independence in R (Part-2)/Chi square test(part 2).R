# Downloading the required practice file ----
houseTasks <- read.delim("housetasks.txt", row.names = 1) # row.names = 1 indicates first row will be used as column names

library(gplots)

dt <- as.table(as.matrix(houseTasks)) # gplots requires this conversion

# To remove the values
balloonplot(t(dt),
            main = "House Tasks",
            label = F,
            show.margins = F,
            xlab = "",
            ylab = "")

# It is also possible to visualize contingency table as mosaic plot

mosaicplot(dt,
           shade = T,
           las = 2) # las makes axis label vertical


# Chi square test by R ----

chisq <- chisq.test(houseTasks)
chisq

# The result is - Pearson's Chi-squared test
# 
# data:  houseTasks
# X-squared = 1944.5, df = 36, p-value < 2.2e-16

  # here, df is calculated as (no. of rows - 1) x (no. of columns - 1)
  # p-value less than 0.05 indicates significant association

# observed counts and expected count ----
chisq$observed
chisq$expected
# formula of expected value- (row total * column total)/grand total

# to round expected values
round(chisq$expected, digits = 2)

# Calculating residuals ----
chisq$observed - round(chisq$expected, digits = 2)

# Standardized (Pearson) residuals calculation ----

round(chisq$residuals, digits= 3) 
# formula of residuals is (observed value - expected value)/√expected value

# Adjusted standardized residuals

round(chisq$stdres, digits = 3)
# formula of standardized residuals- (observed - expected)/√expected(1-row total/grand total)(1 - col total/grand total)

# Visualizing Pearson residuals plot by corrplot ----

install.packages("corrplot")
library(corrplot)
corrplot(chisq$residuals,is.cor = F)

# formula of total chisqaured value = ∑(observed - expected)^2/expected
# calculate chisquared value for each cell and sum of all cells.
# It is also know as chisq$statistic

# Contributing in percentage(%)
contrib <- 100 * (chisq$residuals)^2 / chisq$statistic 

# visualize the contribution
corrplot(contrib, is.corr = FALSE)




