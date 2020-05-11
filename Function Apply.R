library(dplyr)

#General function apply(X, MARGINS, FUNCTION...)

dat <- US15

class(dat) # To know the class of your parameter
dat
mean(dat,3)

mean(dat,4)
mean(dat,5)

#apply(array, MARGIN, FUN...) We can add other arguments.

apply(dat [,3:5], 2, mean) # "dat" represents my data and the numbers between [,] represent [rows, columns]. 
apply(dat [,3:5], 2, max) # number 2 represents column for the margin parameter. If row, type number 1.
apply(dat [,3:5], 2, min)
apply(dat [,5], 2, mean)
apply(dat [,4], 2, mean)


# Excluding columns, type negative (-). For example:

apply(dat[,-1:-2], 2, mean) # When we use the minus signal (-), R understands the row or column must be excluded.
# or this:

apply(dat[,-c(1:2)], 2, max) # for this apply(dat[,-1:-2], 2, max)

apply(dat[,-1:-2], 2, min)
apply(dat[,-c(1,2)], 2, min) # for this apply(dat[,-1,-2], 2, min)

#Excluding NA from my data set
#Use the command "na.rm = TRUE" which stands for "na.remove"









