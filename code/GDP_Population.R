#load tidyverse packages.
library(tidyverse)
#can use cheatsheet from Help menu to get idea about coding
#read in data
gapminder_1997 <- read_csv("data/gapminder_1997.csv")
#learn more about a function, such as read_csv
read_csv(file="data/gapminder_1997.csv")
#this time the code just printed the file without assigning it to an object.
round(3.1415)
round(3.1416, 3)
round(x=3.1416)
round(x=3.1416, digits=2)
round(digits=2, x=3.1416)
round(2, 3.1416)
#make a plot
# + will add an aesthetics (such as x or y axis) and labs to add nice labels.
ggplot(data=gapminder_1997) +
  aes(x = gdpPercap) +
  labs(x= "GDP Per Capita")
#Exercise: add life expectency to y axis and give it a nice label
ggplot(data=gapminder_1997, aes(x = gdpPercap , y=lifeExp, color = continent , size = pop/1000000)) +
  labs(x= "GDP Per Capita", y= "Life Expectency", size = "Population (in millions)", title ="Do people in the wealthy countries live longer?") +
  geom_point()+
  scale_color_brewer(palette= "Set1")


#different color palettes displa.brewer
RColorBrewer : :
#read in full dataset
  gapminder_data <- read_csv("data/gapminder_data.csv")
dim(gapminder_data)  
ggplot(data=gapminder_data) +
  aes (x=year, y= lifeExp, color = continent, group = country) +
  geom_line()
# plot_categorical variables
# use gapminder_1997 data with geom_boxplot() where continent is the x axis and life expectency is in the y axis
ggplot(data=gapminder_1997) +
  aes(x= continent, y= lifeExp) +
  labs(x= "Continent", y= "Life Expectancy (years)", title ="Life expectancy by continent (1997)") +
  geom_boxplot()
ggplot(data=gapminder_1997) +
  aes(x= continent, y= lifeExp) +
  labs(x= "Continent", y= "Life Expectancy (years)", title ="Life expectancy by continent (1997)") +
  geom_jitter(aes(size = pop) ) +
  geom_violin(alpha =0.5, fill = "steelblue3") 


sample(colors(), size=10)
#Univariable plots
ggplot(gapminder_1997)+ 
  aes(x= lifeExp)+
  geom_histogram(bins=25) +
  theme_bw() + theme(axis.text.x=element_text(angle=90, hjust =1, vjust =0.5))
#saving plots: a specific one_can be saved with a special variable
ggsave("figures/awesome_learning_plots.jpg", width =6, height =4)

violin_plot <- ggplot(data=gapminder_1997) +
  aes(x= continent, y= lifeExp) +
  labs(x= "Continent", y= "Life Expectancy (years)", title ="Life expectancy by continent (1997)") +
  geom_jitter(aes(size = pop) ) +
  geom_violin(alpha =0.5, aes(fill=continent)) 
violin_plot
violin_plot + theme_bw()
violin_plot <- violin_plot+theme_bw()
violin_plot
ggsave("figures/awesome_violin_plot.jpg", plot=violin_plot, width =6, height =4)

#Faceting_plots
ggplot(gapminder_1997)+ 
  aes(x=gdpPercap, y= lifeExp)+
  geom_point()+ 
  facet_wrap(vars(continent))
#practice saving a 

violin_plot <- ggplot(data=gapminder_1997) +
  aes(x= continent, y= lifeExp) +
  labs(x= "Continent", y= "Life Expectancy (years)", title ="Life expectancy by continent (1997)") +
  geom_jitter(aes(size = pop) ) +
  geom_violin(alpha =0.5, aes(fill=continent)) 
violin_plot
violin_plot + theme_bw()
violin_plot <- violin_plot+theme_bw()
violin_plot
ggsave("figure/my_awesome_violin_plot.jpg", plot=violin_plot, width =6, height =4)
