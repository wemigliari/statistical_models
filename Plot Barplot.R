country<-c("Sweden", "Brazil", "Germany","Russia", "Japan")
quantity<-c(10,1200,27,120,16)
mean(quantity)
sd(quantity)

country
quantity

barplot(quantity,names.arg=country)
barplot(quantity,names.arg=country, main="Traffic accidents by country",ylab="Number of accidents",xlab="Countries")

levelofdevelopment<-c(100.5,500.5,300.5,400.5,200.5)

boxplot((levelofdevelopment ~ quantity), xlab="Number of Traffic Accidents", ylab="Level of Development")

FloodingRiverRed <- c(2,3,4,1,5,2,6,3,7,4,8,10)
FloodingRiverRed
Months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec")
Months

barplot(FloodingRiverRed, names.arg=Months, xlab = "2017", ylab = "Number of Events")
