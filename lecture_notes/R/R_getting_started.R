###############################################
# R GETTING STARTED
# last updated: July 11, 2021
#
# following the text "R for Data Science" (R4DS)
###############################################
# install/load packages

# packages need to be installed once
install.packages("tidyverse")

# packages need to be loaded for each session
library(tidyverse)
###############################################
# mathematical ops
2+4

# build a sequence: from, to, by
vals <- seq(-pi, pi, 0.1)


# show the data type
class(vals)

# NOTE: the data type is the type of the elements,
# and not the type of the container

# vectorized operations
sin(vals)

###############################################
# basic plotting
plot(vals, sin(vals))

## TRY FOR YOURSELF ##
# 1) Create your own sequence, and plot the tangent
# of this sequence
vals2 <- seq(0,10,.1)
plot(vals2, tan(vals2))
###############################################
# look at mpg dataset from ggplot2
mpg

# get a concise overview of schema
str(mpg)

# summarize dataframe
summary(mpg)

# summarize a column
summary(mpg$cty)
summary(c(mpg$cty,mpg$hwy))

###########################################################
##  TRY FOR YOURSELF ##
# 2) summarize a different column from mpg
summary(mpg$year)
# 3) compute the mean of a quantitative variable from mpg
mean(mpg$cyl)
# 4) create a boxplot of cty (y-axis) vs class (x-axis)
boxplot(cty ~ class, data = mpg, col = "purple")
###########################################################

# first few records
head(mpg)

# last few records
tail(mpg)

# first and last few records stacked
rbind(head(mpg), tail(mpg))

# df dimensions
dim(mpg)

# rows
dim(mpg)[1]

# cols
dim(mpg)[2]

# rows
nrow(mpg)

# columns
ncol(mpg)

# tabulate a categorical variable; gets frequency at each level
table(mpg$model)

?table

# engine size
mpg$displ

# data type
class(mpg$displ)

# get help on mpg
?mpg

# plot engine size vs fuel efficiency on hwy
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color='red'))
# inverse relationship - efficiency generally falls with engine size

# show the model as various colors
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color=model))

###########################################################
##  TRY FOR YOURSELF ##
# 5) Rebuild the plot using y = cty
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = cty, color=model))+ labs(title = "Displacement vs. City")


###############################################
# Ch2: Workflow Basics

# assignment operator (use Alt-minus sign as shortcut)
y <- 1

class(y)
length(y)

# naming objects
# 1. start with letter
# 2. contains letters, numbers, _, ..
# 3. snake_case works well for multiple words
# 4. objects are case sensitive

# removing objects
rm(y)
y

# calling functions
# function_name(arg1 = val1, arg2 = val2, ...)
seq(-10,10)
?seq

seq(-10, 10, 2)

# assign sequence to variable
s1 <- seq(-10, 10, 2)

# can assign and print by wrapping with parenthesis
(s1 <- seq(-10, 10, 2))

# NOTE: all parentheses and quotes need to be paired
# if not paired, R will show +
# try running this:
#s1 <- seq(-10, 10, 2
          
# now fix it!
###############################################
# Concatenating strings

# use paste0() to concat strings with no spaces in between
path <- "/data/waves/"
file <- "waves0.csv"
(full_path <- paste0(path,file))

# show the datatype
class(full_path)

# paste() will concat strings with a space. sometimes you want this.
# small example of building model formula
(form <- paste("y", "~", "x1 + x2"))

response_var <- 'applied' # y variable
predictors <- "x1 + x2"
(formula1<- paste(response_var, '~', predictors))
class(formula1)
###############################################
# Directories, environment

# get the working directory
getwd()

# set the working directory
setwd("C:/Users/apt4c/")

# list files in working directory
list.files(getwd())

###########################################################
##  TRY FOR YOURSELF ##
# 6) List the files in the directory that are one folder "up"
#    from your working directory.
#    For example, if your working directory is /data/waves,
#    one folder up would be /data
setwd("/Users/")
list.files(getwd())
###########################################################

# create a few objects to see them in the environment
xx <- 10
sin_test <- function(x){
  print(sin(x))
  }

# list objects in global environment
ls()

# check the type of some objects
class(sin_test)

# remove all objects
rm(list=ls())

###############################################
