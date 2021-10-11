library(tidyverse)
library(tidyr)
library(dplyr)
library(janitor)
library(readxl)
library(gganimate)
library(transformr)
library(sf)

biolog <- read_csv("../../Data_Course/Data/BioLog_Plate_Data.csv")

names(biolog) <- make_clean_names(names(biolog))

glimpse(biolog)

biolog <- biolog %>% 
  pivot_longer(cols = c("hr_24", "hr_48", "hr_144"),
               names_to = "Time",
               values_to = "Absorbance")

biolog$Time <- sub("hr_", "", biolog$Time)
biolog$Time <- as.numeric(biologo$Time)
class(biolog$Time)

biolog %>% 
  mutate(Type = case_when(sample_id == "Clear_Creek" ~ "water",
                          sample_id == "Waste_Water" ~ "water",
                          sample_id == "Soil_1" ~ "soil", 
                          sample_id == "Soil_2" ~ "soil")) %>% 
  filter(dilution == 0.1) %>% 
  ggplot(aes(x=Time, y=Absorbance, color=Type)) +
  geom_smooth(method="loess", se = FALSE) +
  facet_wrap(~substrate) +
  theme_minimal() +
  labs(title="Just dilution 0.1")

iacid <- biolog %>%
  group_by(sample_id, rep, Time, dilution) %>% 
  filter(substrate == "Itaconic Acid") %>% 
  mutate(trip = factor(rep, levels = c(1,2,3))) %>% 
  summarize(Mean_absorbance = mean(Absorbance)) %>% 
  filter(!Mean_absorbance == 0) 

biolog$Time <- as.numeric(biolog$Time)

ggplot(bio, aes(x=Time, y=Mean_absorbance, color=sample_id)) +
  geom_smooth(method="lm", se = FALSE) +
  facet_wrap(~dilution) +
  theme_minimal() +
  transition_time(Time, range = c(24, 144)) + ease_aes('linear')

gganimate::transition_time()

summarize(Mean_Absorbance = mean(Absorbance), Time) %>% 
  select(sample_id, rep, Time, Absorbance, Mean_absorbance, dilution) %>% 
  
  biolog %>% 
  filter(substrate == "Itaconic Acid") %>% 
  group_by(sample_id, rep) %>% 
  select(Absorbance, 
         Time,
         sample_id, 
         dilution,
         substrate,
         rep) %>% 
  summarize(Mean_absorbance = mean(Absorbance),
            na.rm = TRUE) %>% 
  
class(biolog$Absorbance)
biolog$Absorbance[biolog$Absorbance == 0] <- NA
biolog$Absorbance <- as.numeric(biolog$Absorbance)