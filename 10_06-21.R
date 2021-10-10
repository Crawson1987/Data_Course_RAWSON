library(tidyverse)

set.seed(123)
male <- rnorm(100,3,.5)
female <- rnorm(100,3.1,.5)

df <- data.frame(male,female)
df <- df %>% 
  pivot_longer(everything(), names_to = "sex", values_to = "gpa")
df %>% 
  ggplot(aes(x=sex,y=gpa))+
  geom_col()

df$major <- c(rep("science", 100), rep("art",100))  
df %>% 
  group_by(sex) %>% 
  summarise(MeanGPA = mean(gpa)) %>% 
  ggplot(aes(x=sex,y=MeanGPA))+
  geom_col()

?t.test()
  #lets you learn more about the test or function

plot(male)
hist(male)

t.test(male,female)
  
mod <- glm(formula = gpa ~ sex + major,
  data = df)
summary(mod)

mod.aov<- aov(formula = gpa ~ sex + major,
                data = df)
summarise(mod.aov)

df %>% 
  ggplot()
  



