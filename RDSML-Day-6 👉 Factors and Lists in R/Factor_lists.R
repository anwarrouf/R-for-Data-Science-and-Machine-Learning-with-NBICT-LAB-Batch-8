# Factors in R

# summary of numeric items
participants_age = c(78,25,68,45,48,36)
summary(participants_age)

# Finding summary of characters
profession = c("Doctor","Teacher","Teacher","Businessman","Teacher")
summary(profession)

profession  = factor(profession)
summary(profession)

# Putting the summary in order
birth_month = c("Jan","Dec","Apr","Aug","Jan","Mar","Jun","Apr","Jul","Aug","Sep","Apr","Oct","Jul","Sep")
summary(birth_month)
birth_month = factor(birth_month,
                     ordered = TRUE,
                     levels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))
summary(birth_month)

# List in R
# List is used to place number of items in a bundle
a = c(2,4,7)
b = c("Red","Green","Blue")
c = "Welcome!"
my_lists = list(a,b,c)

my_lists

# Naming the list items
my_lists = list(Pieces = a, Colors = b, Message = c)
my_lists

# Calling specific data structure; can be done different ways

my_lists[1]
my_lists[2]
my_lists['Colors']
my_lists$Pieces

# Calling specific items from the data structure
my_lists$colors[2]
my_lists$Colors[2]
# In line 43, 'colors' was written wrong, it must be same as the name "Colors"
my_lists$Colors[3]
