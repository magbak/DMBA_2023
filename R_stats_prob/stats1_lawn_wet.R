library(tidyverse)

hours = 24 * 365
hours

s <- rep(c(0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0),times=365)
length(s)

r <- rbinom(hours, 1, 0.05)
length(r)

#We see that there is no covariance.
#This is not in general sufficient to claim there is independence, but at least corroborates such a claim. 
cov(s,r)

df <- tibble::tibble(s,r)
df <- df %>% mutate(w=(s>0 | r>0))
df

#We condition on w=FALSE
df_wet = df %>% filter(w)
df_wet

#We see that there is now covariance, i.e. linear dependence and thus dependence.
cov(df_wet$s, df_wet$r)
#How are we to interpret this negative covariance?

