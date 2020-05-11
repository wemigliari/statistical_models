#lapply returns only lists
#The advantage is that I do not have to specify the margins. The command assumes that we work with columns.

list <- list(US15$`2018`, US15$Proportion, US15$`PersonsPoverty%`) #Create a list of values
list #Checking my data

lapply(list,mean) #Using the "lapply" command to calculate the mean of each column of my list
lapply(list, min)
lapply(list, max)

#I can use the lapply for words as well. General structure is lapply(object, function...). For example:

sentence <- c("This", "is", "just", "an", "example")

#Let's suppose I want to count the letters I have in each word from "sentence".
#I use then the "nchar" command to do so.

lapply(sentence, nchar)

#or

nchar(sentence)



