#Probability of 8 or more successes
pbinom(8, size=10, prob=0.5, lower.tail=FALSE)

#Other way of calculating the same value
1 - pbinom(8, size=10, prob=0.5, lower.tail=TRUE)

#Quantile function to find number of successes among 25 such that probability of this number of successes or less is 1/1000000.
qbinom(1/1000000, size=25, prob=0.5)

#Empirical way of doing the same thing
s <- rbinom(n=100000000, size=25, prob=0.5)
quantile(s,1/1000000)

#Look at the sorted vector to see what the quantile function is doing. 
sort(s)
