library(tidyverse)
gapminder_data <- read_csv("data/gapminder_data.csv")
View(gapminder_data)
summarize(gapminder_data, averageLifeExp = mean(lifeExp))
# piping function %>% shortcut command+shift+m
gapminder_data %>% summarize(averageLifeExp= mean(lifeExp))
#Exercise: finding the mean pop of the dataset
gapminder_data %>%summarise(averagePop =mean (pop), recent_year=max(year))
#filters rows where year is 2007
gapminder_data %>% filter (year==2007) %>% summarise(averageLifeExp=mean(lifeExp))
#find the average GDP per capita for the first year in the dataset
gapminder_data %>%summarise(averageGDPperCap =mean (gdpPercap), first_year=min(year))
gapminder_data %>% filter (year==1952) %>% summarise(averageGDPperCap=mean(gdpPercap), first_year=min(year))
#group_by function
gapminder_data %>% group_by(year) %>% 
  summarise(averageLifeExp=mean(lifeExp))
#Exercise: find the mean life expectancy for each continent
gapminder_data %>% 
  group_by(continent) %>% 
  summarize(averageLifeExp=mean(lifeExp))

#mutate: add more columns to your dataset:
#if we want to find the total GDP and add this to the data
gapminder_data %>% 
  mutate (gdp = gdpPercap*pop)
#Exercise: make a new column using the mutate that is population in millions

gapminder_data %>% 
  mutate(Population_mil= pop/1000000)
#But how to drop/remove column/columns?
#We use select() -specify which column we want to keep

gapminder_data %>% 
  select(year,pop)
gapminder_data %>% 
  select (-continent)
#Exercise: country, continent, year and life Exp columns

gapminder_data %>% 
  select(country, continent, year, lifeExp)
#This can also be done as 

gapminder_data %>% 
  select(-pop, -gdpPercap)
#arrange(year): see on the website about the arrange() function

#changing the shape of the dataset
#long vs. wide
#pivot_longer and pivot_wider
gapminder_data %>% 
  select(country, continent, year, lifeExp) %>% 
  pivot_wider(names_from = year, values_from=lifeExp)
# rename() -rename columns
#Create a new dataset with data from only Americas and year 2007
gapminder_americas_2007 <- gapminder_data %>% 
  filter (continent=="Americas", year ==2007) %>% 
  select (-continent, -year)
gapminder_americas_2007
#Let's change the actual dataset to this
gapminder_data <- read_csv("data/gapminder_data.csv") %>% 
  filter (continent=="Americas", year =="2007") %>% 
  select (-continent, -year)

gapminder_data
View(gapminder_data)
