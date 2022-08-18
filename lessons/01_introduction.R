# R Introduction Push-In
## The goal of this Push-In is to provide a light introduction to R.
## We aim to build up to dataframes, which are one of the most commonly used data structres in R.

# Section 1: Navigating RStudio

## By default, this script will open in the upper left pane of RStudio. You can open a new script by clicking File --> New File --> R Script.

## Most of the time, RStudio will be organized in the following four panes:

## 1. Script (upper left): This is where you view and edit most files, such as scripts, RMarkdown notebooks, etc.
## 2. Console (lower left): You can use this to enter R commands on the fly. Furthermore, most R output will appear here.
## 3. Global Environment (upper right): Saved variables, functions, and other R objects will appear here.
## 4. Misc (lower right): A variety of other tabs which allow you to navigate your file system, view plots, install packages, view help, etc.

## RStudio also has a lot of helpful customizations to improve your experience:

## Click Tools --> Global Options --> Appearance to change your color and font settings.
## Click Tools --> Global Options --> Code and check the box that says "Soft-wrap R source files" to wrap the text in your script to the width of the script pane.
## Click Tools --> Global Options --> Code --> Display and check the boxes that say "Highlight selected line" and "Highlight R function calls". These will provide helpful highlighting as you edit your files.

# Section 2: Variable Assignment

## Try assigning the value "5" to the variable 'number' and then run 'number'.
## To run a line of code, place your cursor on a line of runnable code and click the "Run" button or click Ctrl + Enter (PC) or command + Enter (Mac).
number <- 5
number

## You can also use the '=' operator to do variable assignment. 
number = 5
number

## There are subtle differences between '<-' and '=', which won't matter in most cases. However, using '<-' is considered good code style. You want your code to adhere to good stylistic practices, since that makes it easier to read and use by other users.

## You can perform basic arithmetic in R:
number + 1
number - 2
number * 3
number / 4

## Use a hashtag to comment your code (e.g., write notes to your future self and your collaborators) to help keep your script organized. 

## Press Ctrl + l on both Mac and PC to clear your console. This does not erase any data. It simply moves the console prompt (the greater-than symbol: >) up to the top to improve readability. 

# Section 3: Functions and Arguments

## Functions perform actions on inputs. They are followed by trailing round parentheses.
## Arguments are the inputs - values, expressions, text, entire datasets, etc. You tell a function what arguments it needs inside the parentheses. Sometimes, these arguments are "named". This is helpful when you need to enter multiple arguments: the names tell R which arguments correspond to what variables you're passing into the function.

## Use the ls() function to see all of the variables you have defined.
## Notice that ls() does not take any arguments!
ls()

## You can use the "TAB" key to autocomplete a variable.
## Place your cursor after the 'b' in 'numb' below and press TAB.
## This works for variables and functions alike.
numb

# The class() function tells the data class/type of the variable and requires one argument
class(number)
ls()

## Removing Variables. rm() will remove a variable
rm(number)
ls()
number # Error

## Remove all variables with rm(list = ls()).
## Notice that this is the first function we're using with a named argument!
## Or, click the broom icon at top of 'Environment' pane.
rm(list = ls()) 
ls()

### Challenge 1: Variable Assignment
### Define three variables and then write a mathematical expression using only those variables.

# Section 4: Data Types

## There are five main types of data we will work with in R:
## 1. numeric: decimals (the default for ALL numbers in R).
## 2. integer: whole numbers (positive and negative, including zero).
## 3. character: text strings (always wrapped in quotations).
## 4. logical: TRUE or FALSE (1 or 0).
## 5. factor: nominal or ordinal categorical type.

# Section 4.1: Numerics
## Assign 5 to 'number' and check its class. 
number <- 5
number
class(number)

# Section 4.2: Integers
## Coerce 'number' to integer type with the as.integer() function:
number_int <- as.integer(number)
number_int
class(number_int)

## Section 4.3: Characters
## Define welcome <- "Welcome to the D-Lab" and check its class:
welcome <- "Welcome to the D-Lab"
class(welcome)
ls()

## Single and double quotes work similarly:
contraction <- 'I am hungry.'
contraction

contraction <- "I am hungry."
contraction

## You can nest single quotes inside of double quotes:
contraction <- "I'm hungry"
contraction

## Or, you can use all single quotes along with escape characters:
contraction <- 'I\'m hungry'
contraction

## However, you cannot nest single quotes inside of single quotes.

## Section: 4.4 Logicals
## Logical data will check to see if a condition is TRUE (1) or FALSE (0).
class(TRUE)
class(FALSE)

## Since TRUE and FALSE are stored as 1 and 0, they take on mathematical properties:
TRUE + 2
FALSE - 4

## Boolean data types evaluate whether a statement is TRUE. Check the following:
FALSE < TRUE # less than
TRUE >= TRUE # greater than or equal to
FALSE == FALSE # equivalent to (equal to)
"Mac" == "mac" # R is case sensitive
FALSE != FALSE # not equivalent to (not equal to)
"PC" != "Windows"

## Boolean 'and' (all conditions must be satisfied):
TRUE & TRUE 
TRUE & FALSE

## Boolean "or" (just one condition must be satisfied):
TRUE | TRUE 
TRUE | FALSE

# Section 4.5: Factors

## A factor variable is a set of categorical or ordinal values. We won't cover
## factors in this Push-In, but check out R Fundamentals to learn more!

### Challenge 2: Data type coercion
### Like as.integer, other "as dot" functions exist as well, such as as.numeric, as.character, as.logical, and as.factor.
### 1. Define three variables: one numeric, one character, and one logical

### 2a. Can you convert numeric to integer type?

### 2b. Convert numeric to logical?

### 2c. Convert numeric to character?

### 2d. Convert logical to character?

### 2e. Convert character to numeric?

# Section 5: Data Structures

## Data structures are useful ways of representing and organizing data in R.
## There are several data structures we can construct, but we'll focus on two:

## 1. c(): ordered groupings of the SAME type of data (called "vectors").
## 2. data.frame(): and ordered group of equal-length vectors; think of an Excel spreadsheet.

# Section 5.1: Vectors
## A vector is an ordered group of the *same* type of data. We can we can create vectors by "concatenating" data together with the c() function:
vec <- c(2, 5, 8, 11, 14)
vec

## It does not matter what type the data is contained within the vector, as long as it is all the same:
numeric_vector <- c(234, 31343, 78, 0.23, 0.0000002)
numeric_vector
class(numeric_vector)
length(numeric_vector) # There are five elements in this vector.

## Indexing a vector
## To index a vector means to extract an element based on its position.
## For example, if we want to return just the third thing from "numeric_vector", we would use square brackets and type:
numeric_vector[3]

## When we want a numeric vector with entries separated by 1, we can also use the colon operator: 
colon_vector <- c(28:36)
colon_vector 

# Vectors can contain other types, too. Consider the following examples:
character_vector <- c("Canada", "United States", "Mexico")
character_vector
class(character_vector)

# Section 2: Data frames

## Why do we need a data frame? Think about datasets that you have seen before. For example, suppose we collected data on the characteristics of D-Lab Workshop learners. We might want to know the age, degree program, previous familiarity with programming, research interests, and likely many other attributes (variables). 

## This kind of dataset is multidimensional. We have one row for each participant and a number of columns for each attribute we collect data on. If we had forty participants and collected 10 attributes for each participant, then we would have a 40 by 10 dataset.

## The data structure in R that is most suited for this kind of problem is the data frame. 
## A data frame is an ordered group of equal-length vectors. They are the most common type of data structure used for data analyses. Most of the time when we load real data into R, we are loading that data into a data frame. 
## Since they are vectors, each column can only contain the same data type, but columns of different types can be lined up next to each other.
## Meanwhile, rows can contain heterogeneous data.

## Let's create a data frame capturing some information about countries:
countries <- c("Canada", "Mexico", "United States")
populations <- c(10, 20, 30)
areas <- c(30, 10, 20)

## We can create the data frame with the data.frame() function.
## The equal-length vectors are the arguments.
## Notice that the name of each variable becomes the name of the column.
df <- data.frame(countries, populations, areas)
df

## If we wanted to change the column names, we can specify that with the function argument:
df <- data.frame(country = countries, population = populations, area = areas)
df

## Check the compact structure of the data frame:
str(df)

## View the dimensions (nrow x ncol) of the data frame:
dim(df) 

## View column names:
colnames(df)

## View row names (we did not change these and they default to character type):
rownames(df)
class(rownames(df))

## You can extract a single column with the $ operator:
df$Country

## The $ operator can also be used to create new columns:
df$Density <- df$Population / df$Area
df

### Challenge 3: Make your own data frame.
### 1. Create a data frame that contains four different food items and three attributes for each: name, price, and quantity.
### 2. Add a fourth column that calculates the total cost for each food item.
### 3. What function could you use to calculate the total cost of all the fruits combined?

## This concludes the R Introduction Push-In!
## We encourage you to check out R-Fundamentals for a more detailed introduction into R.
