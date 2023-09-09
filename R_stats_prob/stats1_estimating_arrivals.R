n <- 100
lambda <- 9.2
x <- rpois(n, lambda)
x

lambda_hat <- sum(x)/n
lambda_hat

alpha <- 0.05

#We will go lightly on the maths, and just estimate a confidence interval from simulated data
samples <- replicate(n=10000, 
                     sum(rpois(n, lambda_hat))/n)

#The quantile function finds the points where appropriate percentages of the samples lie
qs <- quantile(samples, probs=c(alpha/2, 1-alpha/2))
qs

#What is a good lower control limit?
qpois(p=0.001, lambda_hat, lower.tail = TRUE)
