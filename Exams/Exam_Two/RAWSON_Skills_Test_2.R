  # Exam Two

library(tidyverse)
library(tidyr)
library(dplyr)
library(janitor)
library(readxl)
library(scales)
library(gganimate)
library(transformr)
library(sf)
options(scipen = 999)

  # Step One: In this step I create figure one. 
df <- read.csv("landdata-states.csv")

ls(df)
view(df)

FIG_1 <-ggplot(df, aes(x = Year, y = Land.Value )) + geom_smooth(aes(color = region)) +
  theme_minimal() + labs(x= "Year", y = "Land Value (USD)") 
  
  # Step Two: In this step I display which states are in the NA region.
tail(df$region)
head(df$region)

  #Step Three: In this step I load and convert the new data to long type. 
df2 <- read.csv("unicef-u5mr.csv")

head(df2)
ls(df2)
view(df2)

GATHER <- df2 %>% 
  gather(key = "Year", value = "Mortality.Rate", c(-CountryName,-Region,-Continent)) %>% 
  drop_na() %>% 
  mutate(Year = as.factor(Year))

view(GATHER)

GATHER2 <- df2 %>% 
  gather(key = "Year", value = "Mortality.Rate", c(-CountryName,-Region,-Continent)) %>% 
  drop_na() %>% 
  mutate(Year = as.numeric(as.factor(Year)))

GATHER2$Year <- GATHER2$Year + 1949
view(GATHER2)

  # Step Four: In this step I create figure two and three. 
FIG_2 <- ggplot(GATHER2, aes(x = Year, y = Mortality.Rate, color = Continent)) +
  geom_point(size = 2.5) + theme_minimal() +
  labs(y = "MortalityRate")

MEAN <- df2 %>% 
  gather(key = "Year", value = "Mortality.Rate", c(-CountryName,-Region,-Continent)) %>% 
  drop_na() %>% 
  mutate(Year = as.numeric(as.factor(Year))) %>% 
  group_by(Continent, Year) %>% 
  summarise(mean = mean(Mortality.Rate), n = n() ) 
MEAN$Year <- MEAN$Year + 1949
view(MEAN)


FIG_3 <- ggplot(MEAN, aes(x = Year, y = mean, color = Continent)) +
  geom_point() +geom_line(size = 2) +
  labs(y = "Mean Mortality Rate (deaths per 1000 live births)") +theme_minimal()

  # Step Five: In this step I get the average mortality rate over time for every continent. 
PROP <- df2 %>% 
  gather(key = "Year", value = "Mortality.Rate", c(-CountryName,-Region,-Continent)) %>% 
  drop_na() %>% 
  mutate(Year = as.numeric(as.factor(Year))) %>% 
  group_by(CountryName, Region, Mortality.Rate, Year) %>%
  summarise(Mean = mean(Mortality.Rate)) %>% 
  mutate(Prop = Mortality.Rate/Mean)
PROP$Year <- PROP$Year + 1949
view(PROP)

sum(PROP$Mortality.Rate)

FIG_4 <- ggplot(PROP, aes(x = Year, y = Mean)) + geom_point(color = "blue") + 
  facet_wrap( ~Region) +theme_minimal()

  # Step Five (Part Two): In this step I export all of the figures I made as jpgs. 
jpeg("RAWSON_Fig_1.jpg")
FIG_1
dev.off()


jpeg("RAWSON_Fig_2.jpg")
FIG_2
dev.off()


jpeg("RAWSON_Fig_3.jpg")
FIG_3
dev.off()


jpeg("RAWSON_Fig_4.jpg")
FIG_4
dev.off()

# End of exam two. 
# It is not perfect and I had to do a lot of things backwards or the long way, but overall I think I got what you wanted. 