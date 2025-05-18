# Matrix in R
# Matrix is a 2-dimensional data structure- data stored as rows and columns

study_hours = c(89,69,45,75,63,54,23,25,57,46)
subject_marks = c(79,53,71,57,63,54,74,77,61,69)
# We can create a matrix with only study_hours or only subject_marks.
# We can also combine study_hours and subject_marks


# Creating a matrix with just using study_hours
stu_hours_mat = matrix(study_hours)
stu_hours_mat

# Matrix can add new columns

# Joining two columns  in a matrix
student_data = c(study_hours,subject_marks)
student_data
# The new vector student_data just concatenate the two vectors. But this is not what we want
student_matrix = matrix(student_data)
student_matrix
# But student_matrix concatenate vertically two vectors. Now we will create two columns for two vectors
student_matrix = matrix(student_data,byrow=FALSE,nrow=10)
student_matrix
# We can do same thing by changing argument like
student_matrix = matrix(student_data,byrow=FALSE,ncol=2)
student_matrix

# Naming rows and columns
colnames(student_matrix) = c('Hours','Marks')
student_matrix
rownames(student_matrix) = c(1:10)
student_matrix

# Selecting an element from matrix
student_matrix[4,1]
# in above argument, first one is row and second is column
student_matrix[6,2]
summary(student_matrix)

# Data frames in R
student_names = c("Mr1","Ms2","Ms3","Mr4","Ms5")
study_hours = c(20,24,46,62,22)
marks = c(40,55,69,54,45)
Gender = c("Male","Female","Female","Male","Female")
male = c(TRUE,FALSE,FALSE,TRUE,FALSE)

stu_data = data.frame(student_names,study_hours,marks,Gender)
# Matrix works with numeric data while data frame works with mixed data types - numeric and character
summary(stu_data)
stu_data = data.frame(student_names,study_hours,marks,male)
stu_data
mean(stu_data$study_hours)
# Finding the item at a specific position
stu_data$marks[3]
stu_data$study_hours
