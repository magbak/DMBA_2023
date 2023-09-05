library(tidyverse)

# https://ggplot2.tidyverse.org/reference/
diamonds

p2 <- ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point(size=0.1)
plot(p2)

p3 <- ggplot(diamonds, aes(x=carat, y=price)) +
  geom_line(size=0.1, alpha=0.1)
plot(p3)


p4 <- ggplot(diamonds, aes(x=carat, y=price)) +
  geom_jitter(size=0.1, width=0.1) +
  facet_wrap(~cut, ncol=1)
plot(p4)

p5 <- ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point(size=0.1, alpha=0.1) +
  facet_wrap(~cut, ncol=1)
plot(p5)


library(gapminder)

gapminder

gap_bigc = gapminder %>% filter(country %in% c("United States", "Japan", "China", "United Kingdom"))

p <- ggplot(gap_bigc, aes(x=year, y=lifeExp, shape=country, color=country)) +
  geom_point()
plot(p)

p1 <- ggplot(gapminder, aes(x=year, y=lifeExp, color=continent)) + 
  geom_jitter(aes(size=pop), width=1) +
  scale_y_continuous(name="Life Expectancy") +
  scale_size_continuous(name="Population", labels=scales::comma) +
  scale_color_discrete(name="Continent")

plot(p1)

txhousing$date

tot_sales <- txhousing %>% 
  group_by(date) %>% 
  summarise(total_sales=sum(sales)) %>% 
  drop_na(total_sales)
tot_sales
# Exercises:
# 1. Plot the sum of the total number of sales for each period (date) across the year, to show the seasonality ( https://ggplot2.tidyverse.org/reference/txhousing.html )
p <- ggplot(tot_sales, aes(x=date, y=total_sales)) +
  geom_line()
plot(p)

# 2. Use facet wrap with ~city to compare seasonality of sales between cities.

# Compute mean monthly sales for each city and year
mean_vals <- txhousing %>% 
  group_by(city, year) %>% 
  summarise(avg_sales=mean(sales))
mean_vals

# Find relative sales for each month in each year
# Then compute average relative sales for each month
relative_sales <- txhousing %>% 
  inner_join(mean_vals, by=c("city", "year")) %>%
  mutate(rel_sales=sales/avg_sales) %>%
  group_by(city, month) %>%
  summarise(rel_sales=mean(rel_sales))
relative_sales

# Some plots below are missing data. We could perhaps drop all data for cities that have no sales in some month.
p <- ggplot(relative_sales, aes(x=month, y=rel_sales)) +
  geom_line() +
  facet_wrap(~city)
plot(p)

# Zooming in on three major cities
p <- ggplot(relative_sales %>% filter(city %in% c("Austin", "Houston", "Dallas")), aes(x=month, y=rel_sales, group=city, color=city)) +
  geom_line()
plot(p)

# 3. Read in the tilsyn-data from last week, and create some interesting plots:
# a. Total number of tilsyn per week across the period?
# b. Number of tilsyn of with each total_karakter across time.
# c. Something else?
