# Importing dataset ----

dataset <- read.csv("Salary_Data.csv")

# Training set and test set ----

library(caTools)
set.seed(123) # I randomly select the value
split <- sample.split(Y = dataset$Salary, SplitRatio = 2/3)
split

training_set <- subset(dataset, split == TRUE)
training_set
test_set <- subset(dataset, split == FALSE)
test_set

# Model formation ----

regressor <- lm(formula = Salary ~ YearsExperience,
                data = training_set)

summary(regressor)
coef(regressor)

# Predicting the test set results ----

y_pred_test <- predict(regressor,newdata = test_set) 
# newdata is a function here and we are giving test_set to predict it
y_pred_test

y_pred_training <- predict(regressor,newdata = training_set)
y_pred_training




# Visualizing the training set results ----

library(ggplot2)

ggplot()+
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), color = "red") +
  geom_point(aes(x = training_set$YearsExperience, y = y_pred_training), color = "blue") +
  geom_line(aes(x = training_set$YearsExperience, y = y_pred_training), color = "blue") +
  labs(title = "Salary vs experience of training set", x = "Years of Experience", y = "Salary") +
  theme_bw() +
  theme(plot.title = element_text(size = 14,face = "bold", hjust = 0.5),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(),
        axis.line.x.bottom = element_line(color = "black"),
        axis.line.y.left = element_line(color = "black"))
  
# Visualizing the test set results ----

options(scipen = 99)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), color = "black") +
  geom_point(aes(x = test_set$YearsExperience, y = y_pred_test), size = 3, color = "green",alpha = 0.5) +
  geom_line(aes(x = test_set$YearsExperience, y = y_pred_test), color = "black") +
  scale_y_continuous(breaks = c(50000,70000,100000,125000),
                     expand = expansion(mult = c(0.2,0.2))) +
  labs(title = "Salary vs experience of test set", x = "Years of Experience", y = "Salary") +
  theme_bw() +
  theme(plot.title = element_text(size = 14,face = "bold", hjust = 0.5),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        axis.line.x.bottom = element_line(color = "black"),
        axis.line.y.left = element_line(color = "black"))


