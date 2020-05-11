library(dplyr)

#The next member of the apply family is the "sapply". OUTPUT will be a vector, matrix or list. 
#Difference: I do not have to specify MARGIN since the command assumes only columns.

#General structure sapply(object, function, ...). For example:
list
sapply(list, mean) #If I used apply command, I would have an error, because I have defined my data as a list not as a vector. Test it!



#I also can use sapply for a vector with words. For example:

frase <- c("This", "is", "just", "an", "example")
frase
summary(frase)
class(frase)

#Command of characters = nchar

sapply(frase, nchar)

#For the numbers of characters in a sequence of numbers:

#First, create a function:

b <- function(x){
  seq(nchar(x))
  }

#Then...

sapply(frase, b)

sapply(2:5, sequence, simplify = TRUE, USE.NAMES = TRUE)
