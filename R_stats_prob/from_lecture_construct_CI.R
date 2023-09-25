set.seed(1337)

s1 <- rnorm(10, mean=5, sd=2) 
s1

mu_hat <- mean(s1)
mu_hat

sigma_mu_hat = 2/sqrt(10)
sigma_mu_hat

ci_lower <- qnorm((1-0.95)/2, mean=mu_hat, sd=sigma_mu_hat)
ci_upper <- qnorm((1-0.95)/2, mean=mu_hat, sd=sigma_mu_hat, lower.tail=FALSE)
ci_lower
ci_upper




