# Downloading the required practice file ----
houseTasks <- read.delim("housetasks.txt", row.names = 1) # row.names = 1 indicates first row will be used as column names

# Chi square plot to use to find association between row variables and column variables

# Contingency table can be visualized using the function balloonplot()
# This function draws a graphical matrix where-
# each cell contains a dot whose size reflects the relative magnitude of the corresponding component


# Ploting the data ----

install.packages("gplots")
library(gplots)

# Converting table data structure as the original data is as txt file
# Fot this, we need to convert the dataset in matrix first

dt <- as.table(as.matrix(houseTasks)) # gplots requires this conversion

balloonplot(t(dt), main = "House Tasks") # t for transpose.
# We can do the following without transpose the variables
balloonplot(dt)

# To remove the values
balloonplot(t(dt),
            main = "House Tasks",
            label = F,
            show.margins = F,
            xlab = "",
            ylab = "")


# It is also possible to visualize contingency table as mosaic plot

mosaicplot(dt,
           shade = T,las = 2) # las makes axis label vertical

# Blue color in plot indicates observed value is higher than expected value.
# Red color indicates observed value is lower than expected value
# Here, observed value is the real value
# expected value is the value or condition when there would be no significance difference between groups

# For clearly, if we consider laundry task.
  # here, wife 156, alternating 14, husband 2 and jointly 4. Total = 176
  # observed value is calculated as -
        # sum of column values i.e. wife+alernating+husband+jointly of each task
        # sum of row values of each column
        # grand total i.e. summation of all tasks

        # observed value is (column sum * row sum)/grand total
        # for laundry in case of wife - 176 * 600 / 1744 = 60.55

  # Blue indicates observed is higher than expected and red vice versa


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
