# vectors in R
# vector is a data structure
# data type and data structure are different things
# creating a vector using the c() command
student_height = c(60,69,55,62)
student_height

# Checking the class of the vector student_height
is.numeric(student_height)
is.logical(student_height)

# R automatically converts numeric to text, when you have a text item in the vector
b = c(5,8,2,"sv")
b
is.numeric(b)
is.character(b)
# As b vector contains a character item, that's why, all other items are also converted into character

# We can convert data types; for example, from numeric to character
a = c(1,2,3,4,5)
class(a)
is.numeric(a)
as.character(a)
class(a)
# variable override
a = as.character(a)
a
class(a)

# Logical operator TRUE and FALSE when converted to numeric, TRUE converts to 1 and FALSE converts to 0

d = c(TRUE,FALSE,TRUE,FALSE,FALSE)
d = as.numeric(d)
d

# Converting numeric to logical; 1 is converted to TRUE, 0 to FALSE, all other numeric data are converted to TRUE
d

d = as.logical(d)
d
e = c(1,0,0,1,0,23,-7,0)
e
e = as.logical(e)
e
# Creating sequential vector
# Creating a vector starting from 1 to 10
my_seq = c(1:50,80,99,88,71,61,92,97)
my_seq
# Creating sequential vector using seq() function
new_seq = c(seq(1,10))
new_seq
# Sequence in steps of 3, using 'by' parameter
new_seq = c(seq(1,10,by=3))
new_seq


# Vectors can have character

names = c("Elias", "Mahfuza", "Ashraf", "Chaitali")
names
class(names)
names[3]
names[2:4]

# Assigning names to vector values

my_values = c(4,7,9,11)
# names function
names(my_values)=c("a","b","c","d")
my_values
my_values["c"]
