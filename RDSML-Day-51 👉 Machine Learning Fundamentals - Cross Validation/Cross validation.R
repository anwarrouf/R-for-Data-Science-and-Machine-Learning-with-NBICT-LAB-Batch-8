# How do we decide which model to use?
# Numerous models are - simple regression, multiple linear regression,
        # logistic regression, polynomial, support vector machine (SVM), K-nearest neighbors and many more
# Cross validation allows us to compare different machine learning methods and 
      # get a sense of how well they will work in practice



# Estimate the parameters for the machine learning methods
# Splitting the data in training set and test set



# Four-fold cross validation:
  # Data are divided into 4 blocks i.e. (1,2,3,4) 25% in each block
  # then, any 3 blocks are taken as training set and rest is for test set
  # For example- 1,2,3 as training, 4 as test; 1,2,4 as training and 3 as test; 2,3,4 as training and 1 as test; and so on
  # That's why it is known as four-fold validation

# Then, different methods, for example, logistic, SVM and KNN will be used to check
  # The method that predicts highest number of correct answer test set will be taken as appropriate model for this dataset

# Ten-fold cross validation: