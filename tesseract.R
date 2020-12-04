require(plotrix)
require(grid)

set.seed(100)
plot.new()
plot(c(-1, 1), c(-1,1), axes = FALSE, 
     xlab = "", ylab = "", frame.plot = FALSE,
     yaxt="n")
a <- rect(-0.2,-0.2, 0.2, 0.2)
b <- rect(-0.15,-0.15, 0.25, 0.25)

a1 <- c(-0.2, -0.15)
b1 <- c(-0.2, -0.15)
lines(a1, b1, lty=1, col="black", lwd=1)

a2 <- c(-0.2, -0.15)
b2 <- c(0.2, 0.25)
lines(a2, b2, lty=1, col="black", lwd=1)

a3 <- c(0.2, 0.25)
b3 <- c(-0.2, -0.15)
lines(a3, b3, lty=1, col="black", lwd=1)

a4 <- c(0.2, 0.25)
b4 <- c(0.2, 0.25)
lines(a4, b4, lty=1, col="black", lwd=1)


c <- rect(-0.18,-0.23, 0.3, 0.3, border = "darkgreen")

c1 <- c(-0.18, -0.15)
c11 <- c(0.3, 0.25)
lines(c1, c11, lty=1, col="darkgreen", lwd=1)

c2 <- c(-0.18, -0.15)
c22 <- c(-0.23, -0.15)
lines(c2, c22, lty=1, col="darkgreen", lwd=1)

c3 <- c(0.25, 0.3)
c33 <- c(-0.15, -0.23)
lines(c3, c33, lty=1, col="darkgreen", lwd=1)

c4 <- c(0.25, 0.3)
c44 <- c(0.25, 0.3)
lines(c4, c44, lty=1, col="darkgreen", lwd=1)

d <- rect(-0.26,-0.25, 0.24, 0.27, border = "darkgreen")

d1 <- c(-0.26, -0.2)
d11 <- c(-0.25, -0.20)
lines(d1, d11, lty=1, col="darkgreen", lwd=1)

d2 <- c(-0.26, -0.2)
d22 <- c(0.27, 0.2)
lines(d2, d22, lty=1, col="darkgreen", lwd=1)

d3 <- c(0.2, 0.24)
d33 <- c(-0.20, -0.25)
lines(d3, d33, lty=1, col="darkgreen", lwd=1)

d4 <- c(0.2, 0.24)
d44 <- c(0.2, 0.27)
lines(d4, d44, lty=1, col="darkgreen", lwd=1)

e5 <- c(-0.26, -0.18)
e55 <- c(0.27, 0.3)
lines(e5, e55, lty=1, col="darkgreen", lwd=1)

e6 <- c(-0.26, -0.18)
e66 <- c(-0.25, -0.23)
lines(e6, e66, lty=1, col="darkgreen", lwd=1)

e7 <- c(0.24, 0.30)
e77 <- c(-0.25, -0.23)
lines(e7, e77, lty=1, col="darkgreen", lwd=1)

e8 <- c(0.24, 0.3)
e88 <- c(0.27, 0.3)
lines(e8, e88, lty=1, col="darkgreen", lwd=1)














