#install.packages("pscl")
#install.packages("pROC")
library("tidyverse")
library("pscl")
library("pROC")
df <- read_csv("https://gist.githubusercontent.com/fyyying/4aa5b471860321d7b47fd881898162b7/raw/6907bb3a38bfbb6fccf3a8b1edfb90e39714d14f/titanic_dataset.csv")
df

mod <- glm(Survived~Age+Pclass+Sex, data=df, family="binomial")
summary(mod)

# These are different pseudo R2, which are hard to interpret without knowing more..
pR2(mod)

plot(roc(df$Survived, predict(mod, df, type="response")))
