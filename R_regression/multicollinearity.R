#install.packages("mnormt")
library("mnormt")
library("tidyverse")

#We set up a situation where X1 and X2 are multicollinear
varcov <- rbind(c(1,0.95,0.5),
                c(0.95,1,0.5),
                c(0.5,0.5,1))

m <- rmnorm(n=100, mean=c(0,0,0), varcov=varcov)

df <- tibble(as.data.frame(m))
df <- df %>% rename("X1"="V1", "X2"="V2", "Y"="V3")
df

#Just to double check the correlation coefficients
cor(df)

#Run the code from the beginning multiple times and note how Beta for X1 and Beta for X2 are highly variable
mod_both <- lm(Y ~ X1 + X2, data=df)
summary(mod_both)