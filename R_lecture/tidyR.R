#install.packages("tidyverse")

library("tidyverse")

#There is also read_csv.. but this file is semicolon-separated
tbl <- read_delim("/home/mag/repos/DMBA_2023/tilsyn.csv", delim = ";")
spec(tbl)

#We check that the type of the orgnummer column is not integer
is.integer(tbl$orgnummer)

# But it is numeric (that is, possibly with decimals)
is.numeric(tbl$orgnummer)

#Some important operations on tibbles:
mutate(tbl, orgnummer=as.integer(orgnummer))

#These are not inplace, so we must assign to have effect
tbl1 <- mutate(tbl, orgnummer=as.integer(orgnummer))

# Now we have an integer column
is.integer(tbl1$orgnummer)

# We can select columns, getting a new tibble
select(tbl,orgnummer, navn)

# We can filter
filter(tbl, total_karakter == 3 | total_karakter == 2)

# Find distinct
distinct(tbl, navn)

# Functions on tibbles typically take the tibble as first argument
# Chained operations can be verbose..
tbl2 <- mutate(tbl, dato=parse_datetime(dato, format="%d%m%Y"))
tbl2 <- mutate(tbl2, year=year(dato), month=month(dato), day=day(dato))
tbl2 <- group_by(tbl2, year, month, day, orgnummer, navn)
tbl2 <- summarise(tbl2, n_controls = n(), worst_rating = max(total_karakter))
tbl2 <- arrange(tbl2, desc(n_controls))
tbl2

# The pipe operator %>% is used to chain operations together
# Remember to start by piping the input tibble
# and to assign to an output variable. 
tbl2 <- tbl %>% mutate(dato=parse_datetime(dato, format="%d%m%Y")) %>%
  mutate(year=year(dato), month=month(dato), day=day(dato)) %>%
  group_by(year, month, day, orgnummer, navn) %>%
  summarise(n_controls = n(), worst_rating = max(total_karakter)) %>%
  arrange(desc(n_controls))
tbl2

# Code from https://tidyr.tidyverse.org/articles/tidy-data.html
classroom <- tribble(
  ~name,    ~quiz1, ~quiz2, ~test1,
  "Billy",  NA,     "D",    "C",
  "Suzy",   "F",    NA,     NA,
  "Lionel", "B",    "C",    "B",
  "Jenny",  "A",    "A",    "B"
)

# Based on code at URL above. 
classroom <- classroom %>% pivot_longer(c(quiz1, quiz2, test1), names_to="evaluation", values_to="score")
classroom

# Exercises
# After importing the library, the dataset is available in the gapminder-variable.
#install.packages("gapminder")
library("gapminder")
gapminder

# Exercises:
# 1. Which country had the lowest life expectancy in the year you were born?
gapminder %>% filter(year == 1987) %>% arrange(lifeExp)
# 2. Which continent had the lowest average life expectancy in the year you were born?
gapminder %>% 
  filter(year == 1987) %>% 
  group_by(continent) %>% 
  summarise(meanLifeExp=mean(lifeExp)) %>% 
  arrange(meanLifeExp)
# 3. ADVANCED: Count the number of countries in each continent. https://dplyr.tidyverse.org/reference/count.html
gapminder %>% 
  group_by(continent, country) %>% 
  summarise(n_countries=1) %>% 
  summarise(n_countries=sum(n_countries))

# 4. ADVANCED: Find the five most populous countries in the last year of the dataset. 
last_year <- max(gapminder$year)
gapminder %>% filter(year==last_year) %>% arrange(desc(pop))
# Maybe use  https://dplyr.tidyverse.org/reference/row_number.html
# 5. HARD: https://dplyr.tidyverse.org/reference/lead-lag.html
# a. Which country had the largest positive change in life expectancy from one year to another?
gapminder %>% 
  mutate(last_lifeExp=lag(lifeExp), last_year=lag(year)) %>%
  mutate(num_years_since_last=year-last_year) %>%
  mutate(deltaLifeExp=(lifeExp-last_lifeExp)/(num_years_since_last)) %>%
  arrange(desc(deltaLifeExp))
# b. Which country had the largest positive change in life expectancy in a ten year period?
# 6. Tidy the world_bank_pop dataset
tidy_wb <- world_bank_pop %>% 
  pivot_longer("2000":"2017", names_to="year") %>% 
  pivot_wider(id_cols = c("country", "year"), names_from=indicator, values_from=value)
# 7. ADVANCED: enrich the above dataset with https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv