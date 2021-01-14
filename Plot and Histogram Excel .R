notas=c(6,4,3,4,6,6,7,8,9,10,7,6,7,8,9,2,6,8,9,5,8,7)
mean(notas)
sd(notas)

plot(function(notas)dnorm(notas,mean=6.590909,sd=2.06234),2,10,xlab="Notas",ylab="f(Notas)")

notas <- c(6,4,3,4,6,6,7,8,9,10,7,6,7,8,9,2,6,8,9,5,8,7)
fivenum(notas)
plot((notas), xlab="Alunos", ylab="Notas")

plot(altura ~ notas,xlab="Notas",ylab="Altura")
boxplot((altura ~ notas), xlab="Notas", ylab="Altura")

altura=c(1,1.2,1.3,1.4,1.5,1.55,1.60,1.62,1.65,1.66,1.67,1.68,1.69,1.70,1.72,1.74,1.75,1.76,1.77,1.8,1.82)
altura
mean(altura)
sd(altura)
dnorm(altura)
plot(function(altura)dnorm(altura,mean=1.599048,sd=0.2118704),1,21)

corDegrade <- colorRampPalette(c("darkgreen"))
plot(function(x)dnorm(x,mean=1.26,sd=0.23),1,22,ylab="f(altura)")
hist(altura, col=corDegrade(10))

Excel_Table_Test <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22)
fivenum(Excel_Table_Test)
plot(Excel_Table_Test)

corDegrade <- colorRampPalette(c("lightblue"))
plot(notas, col=corDegrade(7))
hist(notas, col=corDegrade(10))





