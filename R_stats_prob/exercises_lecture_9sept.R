library("tidyverse")

x<- rnorm(1000)
x

df <- tibble(x=x)
df

p <- ggplot(df, aes(x=x)) +
  geom_histogram(binwidth = 0.2)

plot(p)

x<-rbinom(n=1000, size=10, prob=0.6)
df<- tibble(x=x) 
df

p <- ggplot(df, aes(x=x)) +
  geom_bar()
plot(p)

x<-rnorm(1000000, mean=10, sd=sqrt(10))
x

df = tibble(x=x)
df

df <- df %>% mutate(ind=(x<=0))
df

sum(df$ind)/100000

pnorm(q=0, mean=10, sd=sqrt(10))
 

