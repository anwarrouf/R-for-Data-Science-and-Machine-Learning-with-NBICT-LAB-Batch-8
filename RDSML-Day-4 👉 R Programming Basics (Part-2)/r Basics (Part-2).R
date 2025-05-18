# Data types in R
# 1. Numeric - Integer/Floating point
# 2. String/Character - "Mohammad Basher"
# 3. Logical - 

a = 11
b = 7.19
class(a)
class(b)



name = 'NBICT'
print(name)
class(name)


c = "52"
print(c+9)
print(a+9)

class(c)

# Logical data types - TRUE,FALSE (T, F)

class(a>b)
print(a<b)
# < is a relational operator.
# There are more relational operators such as equal as == , not equal as !=
x = 19
y = 22-3

print (x == y)
print (x != y)
print(y>x)


# Logical operators in R
# We are comparing a TRUE event with another TRUE,
# FALSE with TRUE, FALSE with FALSE and TRUE with FALSE
# && is AND logical operator
# AND operator shows TRUE only if both events are TRUE
4 == 4 && 5 == 5

# || is OR logical operator
# OR operator shows TRUE if one event is TRUE
x != y || x == y

# Simple Mathematical operators in R
z = 6 + 9 - 8 * (2 / 3)
print(z)

w = 4 + 3 - 3 * 2/3
print(w)

# ^ is power or exponent
y = 4^3
print(y)

# %% is for remainder
# %/% is for resultant without decimal point
print(11/5)
print(11%%5)
print(11%/%5)
