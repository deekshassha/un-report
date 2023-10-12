###LOad the library

library(tidyverse)

##open the file

gapminder_1997 <- read_csv("data/gapminder_1997.csv")

##Argument-a function need to read the file for ex
read_csv()
##IT SAYS Argument is missing
##How to rectify that-type question mark in console and read csv and run it will open help file
##and explain why it is not working, then do it
read.csv(gapminder_1997.csv)

##error it won't work so it needed to be change and assign file 
gapminder_1997 <- read_csv(file="gapminder_1997.csv")
###Howevr some functions does'nt require argument for example
Sys.Date() ##prints the date and time
##Answer will be date-2nd is getwd()for setting working directory and othr
getwd() #set the directory
sum(5,6) 
##separate argument by coma

##Exercise 1.1
?round
round(3.1415,3)

#Exercise 1.2_ which of these lines fives you an output pf 3.14?
#A
round(x=3.1415)
#B
round(x=3.1415,digits=2)
#C
round(digits=2,x=3.1415)
#D
round(2,3.1415)
##both b and c have same result as mentioned by script
##usage script round(x, digits = 0)
##signif(x, digits = 6)



##Example if run like that it won't save it
2+2

##for saving type as
result<-2+2
##check result
result
##create object with strings (means words) for example given below or assign 
### assign name to file
name<-"Deeksha"
###reassign name to something else
name<-"BETd"
##result for reassingning (it will remember only new name and forget old one)
name

###Good ways to assign name: never ever have numbers in the start when assigning name to the objects
###for example 1number but we can have as: number1
##shouldnt have spacewhen naming object for example
favorite number <13
 ##output is error so fix it by removing space and add underscore or do not use space
favorite_number<-13


#########EXERCISE_PLOTTING#######################10.12.23##
#Load the package
library(ggplot2)or

##open ggplot and add file want to plot
ggplot(data=gapminder_1997)
#next add new line to the file add aestics mapping, first add x line value
#add label OR change x-axis
ggplot(data=gapminder_1997)+ 
aes(x=gdpPercap)+
  labs(x="GDP Per Capita")+
  aes(y=lifeExp)
##Map the variables for example in the file  column lifeexp to the y axis
##now make scatter plotby adding point geometry and add title 
##then add color shape to add more varibles, then cahnge color
ggplot(data=gapminder_1997)+ 
  aes(x=gdpPercap)+
  labs(x="GDP Per Capita")+
  aes(y=lifeExp)+
  geom_point()+
  labs(title = "Do people in wealthy countries live longer?")+
  aes(color=continent)+
  scale_color_brewer(palette = "Set2")
##Find diffrent color codes and change "set2 to set 3...or so on then add size
 
ggplot(data=gapminder_1997)+ 
  aes(x=gdpPercap)+
  labs(x="GDP Per Capita")+
  aes(y=lifeExp)+
  geom_point()+
  labs(title = "Do people in wealthy countries live longer?")+
  aes(color=continent)+
  scale_color_brewer(palette = "Set2")+
aes(size=pop/1000000)+
  labs(size="Population (in millions)")
##question-encode each continent as different shapes instead of colors

library(ggplot2)or

##open ggplot and add file want to plot
ggplot(data=gapminder_1997)
#next add new line to the file add aestics mapping, first add x line value
#add label OR change x-axis
ggplot(data=gapminder_1997)+ 
  aes(x=gdpPercap)+
  labs(x="GDP Per Capita")+
  aes(y=lifeExp)
##Map the variables for example in the file  column lifeexp to the y axis
##now make scatter plotby adding point geometry and add title 
##then add color shape to add more varibles, then cahnge color
ggplot(data=gapminder_1997)+ 
  aes(x=gdpPercap)+
  labs(x="GDP Per Capita")+
  aes(y=lifeExp)+
  geom_point()+
  labs(title = "Do people in wealthy countries live longer?")+
  aes(color=continent)+
  scale_color_brewer(palette = "Set2")
##Find diffrent color codes and change "set2 to set 3...or so on then add size

ggplot(data=gapminder_1997)+ 
  aes(x=gdpPercap)+
  labs(x="GDP Per Capita")+
  aes(y=lifeExp)+
  geom_point()+
  labs(title = "Do people in wealthy countries live longer?")+
  aes(color=continent)+
  scale_color_brewer(palette = "Set2")+
  aes(size=pop/1000000)+
  labs(size="Population (in millions)")+
  aes(shape=continent)
  
##scale_shape(continent,solid=TRUE)-wrong so correct isgiven above
##Consolidate the above code  

library(ggplot2)or

##open ggplot and add file want to plot
ggplot(data=gapminder_1997)
#next add new line to the file add aestics mapping, first add x line value
#add label OR change x-axis
ggplot(data=gapminder_1997)+ 
  aes(x=gdpPercap)+
  labs(x="GDP Per Capita")+
  aes(y=lifeExp)
##Map the variables for example in the file  column lifeexp to the y axis
##now make scatter plotby adding point geometry and add title 
##then add color shape to add more varibles, then cahnge color
ggplot(data=gapminder_1997)+ 
  aes(x=gdpPercap)+
  labs(x="GDP Per Capita")+
  aes(y=lifeExp)+
  geom_point()+
  labs(title = "Do people in wealthy countries live longer?")+
  aes(color=continent)+
  scale_color_brewer(palette = "Set2")
##Find diffrent color codes and change "set2 to set 3...or so on then add size
ggplot(data=gapminder_1997)+
aes(x=gdpPercap,
y=lifeExp, 
color=continent,
shape=continent,
size=pop/1000000)+
labs(x="GDP Per Capita",
title = "Do people in wealthy countries live longer?",
size="Population (in millions)")+
 geom_point()+
scale_color_brewer(palette = "Set1")
ggsave("figures/gdpPercap_lifeExp.png")



  

