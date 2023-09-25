library("tidyverse")
#install.packages("corrr")
library("corrr")

samples <- replicate(10, rnorm(15))
samples

tbl <- as_tibble(samples, .name_repair="unique")
c <- correlate(tbl)
rplot(c)


