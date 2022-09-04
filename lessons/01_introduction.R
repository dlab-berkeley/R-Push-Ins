# R Introduction Push-In
## The goal of this Push-In is to provide a light introduction to R.
## We aim to build up to data frames, which are one of the most commonly used data structures in R.

## All of these lines that are in a different color are comments. 
## Use a hashtag to comment your code (e.g., write notes to your future self and your collaborators) to help keep your script organized. 

# Section 1: Navigating RStudio

## By default, this script will open in the upper left pane of RStudio. You can open a new script by clicking File --> New File --> R Script.

## Most of the time, RStudio will be organized in the following four panes:

## 1. Script (upper left): This is where you view and edit most files, such as scripts, RMarkdown notebooks, etc.
## 2. Console (lower left): You can use this to enter R commands on the fly. Furthermore, most R output will appear here.
## 3. Global Environment (upper right): Saved variables, functions, and other R objects will appear here.
## 4. Misc (lower right): A variety of other tabs which allow you to navigate your file system, view plots, install packages, view help, etc.

## RStudio also has a lot of helpful customizations to improve your experience:

## Let's check to confirm that one specific option is on. 
## Click Tools --> Global Options --> Code and check the box that says "Soft-wrap R source files" to wrap the text in your script to the width of the script pane.

# Section 2: The Whole Game

## In this introduction to R we are going to introduce a common data analysis task-Analyzing an experiment. Along the way, we will introduce many of the basic concepts of the language. 

## Our analysis is inspired by James Lind's original work to determine the cause of scurvy in 1747. At the time, there was not a conclusive explanation in England for why sailors developed scurvy. Nowadays, we knew (as did a variety of indigenous populations in Asia and South America) that scurvy is a disease caused by a severe lack of vitamin C. Eating citrus fruits is restorative. 

# Section 2: Variable Assignment

## Try assigning the value 1 to the variable 'hasScurvy' and then run 'hasScurvy'.


## To run a line of code, place your cursor on a line of runnable code and click the "Run" button or click Ctrl + Enter (PC) or command + Enter (Mac).


## You can also use the '=' operator to do variable assignment. 
## Repeat the steps that you just did but with a new variable "vitaminC". Assign this variable the value 0.

## An initial reason for assigning some value to a variable is to store it to do computations later. For example, you can perform basic arithmetic in R:

number = 5
number + 1 ## will result in 6, but the value of number will not change 
number 

### Challenge 1: Variable Assignment
### Define three variables and then write a mathematical expression using only those variables. 


## Press Ctrl + l on both Mac and PC to clear your console. This does not erase any data. It simply moves the console prompt (the greater-than symbol: >) up to the top to improve readability. 


# Section 3: Functions and Arguments

## Functions perform actions on inputs. They are followed by trailing round parentheses. The functions that we will use in this push-in let us create variables to store our data, variables to analyze our data, and some functions to plot our data. 

## Arguments are the inputs - values, expressions, text, entire datasets, etc. You tell a function what arguments it needs inside the parentheses. Sometimes, these arguments are "named". This is helpful when you need to enter multiple arguments: the names tell R which arguments correspond to what variables you're passing into the function.

# Section 4: Data Structures

## Data structures are useful ways of representing and organizing data in R.
## There are several data structures we can construct, but we'll focus on two:

## 1. c(): ordered groupings of the SAME type of data (called "vectors").
## 2. data.frame(): and ordered group of equal-length vectors; think of an Excel spreadsheet.

# Section 4.1: Vectors
## A vector is an ordered group of the *same* type of data. We can we can create vectors by "concatenating" data together with the c() function:
vec <- c(2, 5, 8, 11, 14)
vec

## There are five main types of data we will work with in R:
## 1. numeric: decimals (the default for ALL numbers in R).
## 2. integer: whole numbers (positive and negative, including zero).
## 3. character: text strings (always wrapped in quotations).
## 4. logical: TRUE or FALSE (1 or 0).
## 5. factor: nominal or ordinal categorical type.

## For this script, we will only need the numeric, logical, and character type, but we highlight the rest for completeness and because they will be useful as you work more in R. 

## It does not matter what type the data is contained within the vector, as long as it is all the same:
numeric_vector <- c(234, 31343, 78, 0.23, 0.0000002)
numeric_vector

## The length() function lets us know how many elements are in our vector. 
length(numeric_vector) # There are five elements in this vector.

## Indexing a vector
## To index a vector means to extract an element based on its position.
## For example, if we want to return just the third thing from "numeric_vector", we would use square brackets and type:
numeric_vector[3]

## When we want a numeric vector with entries separated by 1, we can also use the colon operator: 
colon_vector <- c(28:36)
colon_vector 

## Vectors can contain other types, too. Consider the following examples:
character_vector <- c("Canada", "United States", "Mexico")
character_vector

## We can always see what type our data vector is by using the class() function. 
class(character_vector)

# Section 4.2: Data frames

## Why do we need a data frame? Think about datasets that you have seen before. For example, suppose we collected data on the characteristics of D-Lab Workshop learners. We might want to know the age, degree program, previous familiarity with programming, research interests, and likely many other attributes (variables). 

## This kind of dataset is multidimensional. We have one row for each participant and a number of columns for each attribute we collect data on. If we had forty participants and collected 10 attributes for each participant, then we would have a 40 by 10 dataset.

## The data structure in R that is most suited for this kind of problem is the data frame. 
## A data frame is an ordered group of equal-length vectors. They are the most common type of data structure used for data analyses. Most of the time when we load real data into R, we are loading that data into a data frame. 
## Since they are vectors, each column can only contain the same data type, but columns of different types can be lined up next to each other.
## Meanwhile, rows can contain heterogeneous data.

## Let's create the data frame for our data analysis. 
## We will need a set of 30 individuals, which we will number from 1-30. In R, a nice trick when using sequential numbers is the : operator. 
patients <- c(1:30)

## We will have two groups, "treatment" who receive Vitamin C and "control" who do not. The groups will each have 15 people in them. 
## Here we use another common function in R, rep() which repeats the value with give it as the first argument the number of times we specify as the second argument. 
treatment <- c(rep("Treatment",15), rep("Control",15))


gotBetter <- c(1,1,1,1,0,1,0,1,0,1,1,1,0,0,1, rep(0,10), 1, 1,0,1,0)


## We can create the data frame with the data.frame() function.
## The equal-length vectors are the arguments.
## Notice that the name of each variable becomes the name of the column.
dat <- data.frame(patients, treatment, gotBetter)
dat

## If we wanted to change the column names, we can specify that with the function argument:
dat <- data.frame(subjects = patients, 
                 condition = treatment, 
                 result = gotBetter)
dat

## Check the compact structure of the data frame:
str(dat)

## View the dimensions (nrow x ncol) of the data frame:
dim(dat) 

## View column names:
colnames(dat)

## View row names (we did not change these and they default to character type):
rownames(dat)
class(rownames(dat))

## You can extract a single column with the $ operator:
dat$subjects

## The $ operator can also be used to create new columns:
## The following will assign a new column where every value is 1
dat$ones <- 1

## We can also use the $ operator to create new columns using our variables
dat$example <- dat$subjects + dat$ones
dat

### Challenge 3: Make your own data frame.
### 1. Create a data frame that contains four different food items and three attributes for each: name, price, and quantity.
### 2. Add a fourth column that calculates the total cost for each food item.
### 3. What function could you use to calculate the total cost of all the fruits combined?

## This concludes the R Introduction Push-In!
## We encourage you to check out R-Fundamentals for a more detailed introduction into R.

### Running a basic analysis 
### We are interested in whether or not taking the treatment "worked" or not. The normal way to do this is to look at the average outcome in the treatment control and subtract the average outcome in the control group. 

## We can do this by separating the data frame into the two conditions
## Note here is an example of both subsetting and using a "Boolean" condition. The "==" means "equals" and it subsets the data frame to only the subjects who received Vitamin C. 
treatGroup <- dat$result[dat$condition=="Treatment"]

## Try doing the same with the Control condition
controlGroup <- dat$result[dat$condition=="Control"]

## Now let's look at the effect of taking Vitamin C on whether patients got better
averageTreatmentEffect <- mean(treatGroup) - mean(controlGroup)
averageTreatmentEffect

## The treatment worked! In the original experiment, Lind wrote that "The most sudden and visible good effects were perceived from the use of oranges and lemons" foods high in Vitamin C. 

## One way to confirm our results is by running a "t-test". There's a function for that in R. We see that the probability that there is no difference between our groups given we had observed such a large difference between the two of them is extremely small. 
t.test(x = treatGroup, y=controlGroup)

## This concludes the R Introduction Push-In!
## We encourage you to check out R-Fundamentals for a more detailed introduction into R.