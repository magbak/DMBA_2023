library(tidyverse)

# https://ggplot2.tidyverse.org/reference/


p2 <- ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point(size=0.1)
plot(p2)

p3 <- ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point(size=0.1, alpha=0.1)
plot(p3)

p4 <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) +
  geom_jitter(size=0.1, width=0.2)
plot(p4)

p5 <- ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point(size=0.1, alpha=0.1) +
  facet_wrap(~cut, ncol=1)
plot(p5)


library(gapminder)

gapminder

gap_bigc = gapminder %>% filter(country %in% c("United States", "Japan", "China", "United Kingdom"))

p <- ggplot(gap_bigc, aes(x=year, y=lifeExp)) +
  geom_point(aes(shape=country, color=country))
plot(p)

p1 <- ggplot(gapminder, aes(x=year, y=lifeExp, color=continent)) + 
  geom_jitter(aes(size=pop), width=1) +
  scale_y_continuous(name="Life Expectancy") +
  scale_size_continuous(name="Population", labels=scales::comma) +
  scale_color_discrete(name="Continent")

plot(p1)


# Exercises:
# 1. Plot the sum of the number of sales across the year, to show the seasonality ( https://ggplot2.tidyverse.org/reference/txhousing.html )
# 2. Use facet wrap with ~city to compare seasonality of sales between cities.
# 3. Read in the tilsyn-data from last week, and create some interesting plots:
# a. Total number of tilsyn per week across the period?
# b. Number of tilsyn of with each total_karakter across time.
# c. Something else?
