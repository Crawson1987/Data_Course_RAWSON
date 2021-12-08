  # Exam Four (Redo of Exam One)

library(tidyverse)
options(scipen = 999)

  # Step One:
    # Loaded cleaned_covid_data.csv into R as a data frame
df <- read_csv("./cleaned_covid_data.csv")

  # Step Two:
    # Makes a subset of df that includes starts just starting with A
A_states <- df[grepl("^A",df$Province_State),]

  # Step Three:
    # Generates a plot of the A_states subset, which has been separated by state. 
A_states %>% 
  ggplot(aes(x=Last_Update,y=Active)) +
  geom_point() +
  geom_smooth(se=FALSE) +
  facet_wrap(~Province_State,scales = "free")

  # Step Four:
    # Finds the peaks of very state in Case_Fatality_Ratio and saves it as a new object
state_max_fatality_ratio <- df %>% 
  group_by(Province_State) %>% 
  summarise(Max_Fatality = max(Case_Fatality_Ratio, na.rm = TRUE)) %>% 
  arrange(desc(Max_Fatality))

  # Step Five:
    # Generates a new plot using state_max_fatality_ratio, which was made in previous step
state_max_fatality_ratio %>% 
  ggplot(aes(x=reorder(Province_State,-Max_Fatality),y=Max_Fatality)) +
  geom_col() +
  theme(axis.text.x = element_text(angle=90,hjust = 1))

  # Step Six:
    # Use the entire data set to plot cumulative US deaths over time
df %>% 
  group_by(Last_Update) %>% 
  summarise(Cumulative = sum(Deaths)) %>% 
  ggplot(aes(x=Last_Update,y=Cumulative)) +
  geom_bar(stat= 'identity')