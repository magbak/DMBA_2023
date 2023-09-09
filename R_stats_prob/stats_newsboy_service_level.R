library("tidyverse")

sd <- 20
mu <- 100

#How many should we bake?
c <- 0.9
qnorm(p=c, mean=mu, sd=sd, lower.tail = TRUE)