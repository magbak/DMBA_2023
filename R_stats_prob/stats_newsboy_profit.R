library("tidyverse")

sd <- 20
mu <- 100

unit_cost <- 50
price <- 200

#How many should we sell?
n <- 1000
x <- rnorm(n=n, mean=mu, sd=sd)

df <- tibble(x)
df

amounts <- c(80, 90, 100, 110, 120)

for (a in amounts) {
  revenue = pmin(a, df$x)*price
  cost = a * unit_cost
  df <- df %>% mutate(
    "profit_{a}":= revenue - cost
    )
}

df %>% summarise(across(everything(), mean))