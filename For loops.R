#For loops structure to create indexes

library(dplyr)

# for (variable in vector {
#  commands}

#For example:

for (i in 1:5){
  print (i^2)
}


# or a vector with numbers without a sequence

for (i in c(-3, 7, 11, 12)) {
  print (i^2)
}

i

#Difining a variable and then using it 

f <- c(-3, 7, 11, 12)

for (i in f){
  print (i^2)
}

#or 

g <- c(-3, 7, 11, 12)
for (i in g){
  print (c(i, i^2, i^3))
}

#or

for (i in f){
  print (c(i, i^2, i^3))
}

#Putting the numbers of the first column in a horizonton vector with five elements.
#Number five is the number of elements I want. Let's consider I want a sequence of 
#five numbers from 1 to 5. I will call "vec".

vec1 <- numeric(5)
vec1  

for (i in 1:5){
  vec[i] <- i^2
}
vec1

#But I want to make the same with my vector "f". Let's see what happens.

vec2 <- c(-3, 7, 11, 12)

for (i in f){
  vec2[i] <- i^2
}
vec2

#Back to our previous example to fix the NAs output.

f

vec3 <- numeric(4) 

for (i in 1:4){
  vec3[i] <- (f[i])^2
  }
vec3

######## If and if else
#Let's suppose our variable "t" is the four temperatures of a week. 

t <- c(-5,-3,-1,2,3,4,5,6,7,8,9,12,13,19,-1)

if(t>0){
  print("Warm")
}else{
  print("Cold")
}

# And we get the following message:

#Warning message:
  #In if (t > 0) { :
      #the condition has length > 1 and only the first element will be used

#So...

for (t in c(-5,-3,-1,2,3,4,5,6,7,8,9,12,13,19,-1))if(t>0){
  print("Warm")
}else{
  print("Cold")
}
  


