# 1.  Get a subset of the "iris" data frame where it's just even-numbered rows

seq(2,150,2) 
  # lists the even numbers between 2 and 150

iris.file <- iris  
  # named the data ile 
iris.file[seq(2,150,2),]  
  # got a subset of data from the iris file of all even numbered rows 

# 2.  Create a new object called iris_chr which is a copy of iris, except where every column is a character class
iris$Sepal.Length <- as.character(iris$Sepal.Length)
iris$Sepal.Width <- as.character(iris$Sepal.Width)
iris$Petal.Length <- as.character(iris$Petal.Length)
iris$Petal.Width <- as.character(iris$Petal.Width)
iris$Species <- as.character(iris$Species)

iris_chr <- c(iris$Sepal.Length, iris$Sepal.Width, iris$Petal.Length, iris$Petal.Width, iris$Species)
# made a new file

# 3.  Create a new numeric vector object named "Sepal.Area" which is the product of Sepal.Length and Sepal.Width
Sepal.Area <- as.numeric(iris$Sepal.Length)*as.numeric(iris$Sepal.Width)

# 4.  Add Sepal.Area to the iris data frame as a new column
iris.file <- cbind(Sepal.Area,iris)


# 5.  Create a new dataframe that is a subset of iris using only rows where Sepal.Area is greater than 20 
# (name it big_area_iris)
subset(iris.file, Sepal.Area > 20) 
# created the specific subset that included that needed area 

big_area_iris <- subset(iris.file, Sepal.Area > 20) 

# 6.  Upload the last numbered section of this R script (with all answers filled in and tasks completed) 
# to canvas
# I should be able to run your R script and get all the right objects generated