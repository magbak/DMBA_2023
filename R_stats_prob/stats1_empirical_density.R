library(ggplot2)
library(tidyverse)

n <- 1000000
x <- rnorm(n, 5, 2)

v <- 7
is_above_v <- x > v
c <- sum(is_above_v)

prob <- c/n
prob

df <- tibble(x)

p <- ggplot(df, mapping=aes(x)) + 
  geom_histogram(binwidth = 0.1, fill="lightblue") + 
  geom_vline(xintercept=v)
p

#Expectation
ex <- sum(x) / n
ex

