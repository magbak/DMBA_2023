# We will conduct some of the analyses found here, but with builtin functions
# https://libguides.princeton.edu/c.php?g=1315411&p=9671574#s-lg-box-wrapper-36017198
# We borrow some snippets from this page..

#install.packages("car") 
library(car)

#Use the dataset called Prestige
help("Prestige")

Prestige

mod <- lm(prestige ~ education + log(income), data=Prestige)
summary(mod)

qqPlot(mod)

cor(Prestige$education, Prestige$income)

residualPlots(mod)

hist(log(Prestige$income))

