# Some basic stuff

# In R, we typically use <- to do assignment, = and -> are also possible..  
my_var <- "a"
my_other_var = "a"
"a" -> my_third_var

# We can print things:
print(my_var)

# But sometimes, this is easier:
my_var

# An exception is when assigning to named function arguments, use = then. 
my_sample <- rnorm(10, mean=2, sd=3)
my_sample

# Programming in R is typically oriented around vectors
my_vec <- c(1,2,3)
my_vec

# Vectors have homogenous types
my_vec2 <- c(1,"2")
my_vec2

# Some utility functions:
my_repvec = rep(42,times=10)
my_repvec

my_reprepvec = rep(my_repvec, times=2)
my_reprepvec

my_seqvec = seq(from=0, to=33, by=3)
my_seqvec

my_sample
order(my_sample)
my_sample[order(my_sample)]
sort(my_sample)

# Concatenating strings is strange in R
# "a" + "b"
# Gives: Error in "a" + "b" : non-numeric argument to binary operator
paste0("a", "b")

# Slicing and dicing is pretty much the same as in Pandas
my_seqvec[1:2]

#But not everything is the same
# my_seqvec[-2:] does not work.

# Broadcasting / vectorization is the same
my_seqvec
my_seqvec > 14

# Boolean masks work the same
my_seqvec[my_seqvec > 14]

my_seqvec[my_seqvec < 14] <- 14
my_seqvec

# Base dataframes are similar
df <- data.frame(repeated=my_repvec, random_sample=my_sample)
df

# Accessing columns ( vectors ) is a bit different
df$repeated

# str tells us about the columns of df and their contents
str(df)

# We find the rows and columns in the following way:
nrow(df)
ncol(df)

# Defining functions:
my_func <- function(x, y) {
  return(x+y)
}
my_func(2,4)


# Exercises:
# 1. Create a vector of 10,000 random data points using rnorm()
v1 <- rnorm(10000, 4,5)
v1
length(v1)
# 2. Create a new vector which adds 50 to each number in the previous vector
v2 <- v1+50
v2
# 3. Create a third vector using seq of 10 000 numbers
length(seq(from=1, to=10000, by=1))
v3 <- seq(from=0, to=10, length.out=10000)
v3
# 4. Create a dataframe based on the three vectors HINT: data.frame(...)
df <- data.frame(v1, v2, v3)
str(df)
# 5. Create a new dataframe with only the rows where the first vector is above some number (make one up)
df2 <- df[df$v1 > 5,]
str(df2)
# 6. HARD: Count the number of rows where some column is above some number HINT: sum(vector)
sum(rowSums(df > 55) > 0)


