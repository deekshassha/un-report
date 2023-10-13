#day2:Read in data in csv
library(tidyverse)
gapminder_data<-read.csv("data/gapminder_data.csv")
gapminder_data

###next function
gapminder_data<-read_csv("data/gapminder_data.csv")
gapminder_data

##summarize_-----------------------------------------------
summarise(gapminder_data)
summarise(gapminder_data,mean(lifeExp))
summarise(gapminder_data, averagelifeExp=mean(lifeExp))

#to add a header in R, use cmd/ctrl+shift+R
##ctl/shift -m for pipeline
gapminder_data%>%
summarise(avrageLifeExp=mean(lifeExp))

#save to object
gapminder_data_summarized<-gapminder_data%>%
summarise(averageLifeExp=mean(lifeExp))
gapminder_data_summarized
##ques-what is the mean life expectency for recent year?

gapminder_data_summarized*2
gapminder_data%>%
 summarize(recent_year = max(year))
##get max year in filter ()

gapminder_data %>%
   filter(year==2007)%>%
   summarise(average=mean(lifeExp))
###without pipeline
summarize(filter(gapminder_data, year== 2007),
             average=mean(lifeExp)
          
#what is the earliest year in the dataset?
gapminder_data %>%
summarise(oldest_year=min(year))


##summarize average gdp for the earliest year in the dataset.
gapminder_data %>%
  summarise(first_year=min(year))

#what is the mean GDP per capita for the earliest yeaar.

gapminder_data %>%
  filter(year==1952) %>%
  summarise(average_gdp=mean(gdpPercap))

##Grouping
#what is the mean life expectancy for each year
gapminder_data %>%
  group_by(year) %>%
  summarize(average=mean(lifeExp))

##group by year and country
gapminder_data %>%
  group_by(year,country) %>%
  summarize(average=mean(lifeExp))

###new way

grouped_data<-gapminder_data %>%
  group_by(year,country) %>%
 summarise(average=mean(lifeExp))
###quest: Mean expectancy for each Continent
gapminder_data %>%
  group_by(year, continent) %>%
  summarise(average=mean(lifeExp))


##multiple summaries
gapminder_data %>%
group_by(continent) %>%
  summarise(
    meanLifeExp = mean(lifeExp),
    maxLifeExp  = max(lifeExp),
    meangdpPercap =mean(gdpPercap))

###Mutate data
gapminder_data %>%
  mutate(double_year= year*2, .before = pop)
##what is the gdp (not per capita)?
#by multiplying pop * gdppercapita

gapminder_data %>%
  mutate(gdp = pop * gdpPercap)
 ##MAKE A NEW COLUMN FOR POPULATIONS IN MILLIONS 
  
gapminder_data %>%
  mutate(populationinmillions=pop/1000000)

##
gapminder_data %>%
  mutate(
    gdp = pop* gdpPercap,
   populationinmillions = pop/100000
  ) %>%
  glimpse()

##
mysummary <- gapminder_data %>%
  group_by(country) %>%
  filter(continent =="Asia") %>%
  mutate(gdp = pop *gdpPercap)%>%
  summarise(meanGDP = mean(gdp))
  mysummary
   view(mysummary)

##3sleect a subset of column from a dataset

gapminder_data %>%
  select(pop,year)
 
 
 gapminder_data %>%
    distinct(continent)


###create a tibble with only country, continent
 #year,lifexp
 
 gapminder_data %>%
   select(country,continent,year,lifeExp)
 
 ##select helper funcion:starts-with ()
 gapminder_data %>%
   select(year,starts_with("c"))
 ##ex
 gapminder_data %>%
   select(year,ends_with("p"))
 gapminder_data %>%
   select(continent,ends_with("p"))
 gapminder_data %>%
   select(continent,year,ends_with("p"))
 
 
#for rows back to filter
 
 ##change shape of data (reshaping)
 gapminder_data %>%
   select(country,continent,year,lifeExp)
 
 ##pivot_wider (for making data wider)
 gapminder_data %>%
   select(country,continent,year,lifeExp) %>%
   pivot_wider(names_from = year, values_from = lifeExp)
 
## give name to newly develop data by prefix
 widedata <- gapminder_data %>%
   select(country,continent,year,lifeExp) %>%
   pivot_wider(names_from = year, 
               values_from = lifeExp,
               names_prefix ='yr')
 
 ## how to join data (joins)
 
co2_data <-read_csv("data/co2-un-data.csv",skip =1 ) %>%
   rename(country='...2')%>%
   rename(year = Year)

co2_data

 joined <-left_join(gapminder_data, co2_data, 
                    by = c("country", "year"))
 view(joined)
####R_markdown


