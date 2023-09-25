#install.packages("mnormt")
library("mnormt")
library("tidyverse")

varcov <- rbind(c(1,0.5,0.8),
               c(0.5,1,0.5),
               c(0.8,0.5,1))

m <- rmnorm(n=10000, mean=c(0,0,0), varcov=varcov)

df <- tibble(as.data.frame(m))
df <- df %>% rename("X1"="V1", "X2"="V2", "Y"="V3")
df

cor(df)

#Important to be mindful of correlation structure of predictor variables when interpreting betas
mod_both <- lm(Y ~ X1 + X2, data=df)
summary(mod_both)

mod_x1 <- lm(Y ~ X1, data=df)
summary(mod_x1)

mod_x2 <- lm(Y ~ X2, data=df)
summary(mod_x2)