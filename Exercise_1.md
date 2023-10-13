---
title: "Exercise_2.md"
author: "Deeksha Sharma"
date: "2023-10-13"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

###Load the library and open the file
```
```{r}
library(tidyverse)
gapminder_data <-read_csv(("data/gapminder_data.csv"))
```
## Make the graph with the data
```{r}
ggplot(data = gapminder_data, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop/1000000))+
  geom_point()+ 
  labs (x ="GDP per Capita",
        y= "Life Expectancy",
        title = "Do people in wealthy countries live longer?",
         size = "Population (in millions)")

```
 
 ##MAKE A GRAPH OF YEAR VS POPULATION, SEPARTED INTO A PLOT FOR EACH CONTINENT
```{r}
ggplot(data = gapminder_data, aes(x = year, y = pop))+
   facet_wrap(vars(continent))+
   geom_point()+ 
   labs (x ="year",
        y= "pop",
        title = "Do people in wealthy countries have more population?")
        
```
 
##Find the outlayer
```{r}
gapminder_data %>%
  filter(pop>1000000000) %>%
  distinct(country)

gapminder_data %>%
ggplot(aes(x = year, y = pop))+
   facet_wrap(vars(continent))+
   geom_point()+ 
   labs (x ="year",
        y= "pop",
        title = "Do people in wealthy countries have more population?")
        


```



