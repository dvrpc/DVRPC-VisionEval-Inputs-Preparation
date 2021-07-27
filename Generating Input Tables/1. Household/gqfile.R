rm(list = ls())
setwd("C:/Users/fizaa/Downloads")

# load needed libraries
library(dplyr)
library(readr)


# load and inspect data
df_gq <- read_csv("GQ2019_byBlockTypeSexAge.csv")
glimpse(df_gq)

#trying to get total number of people 0 to 14 for each azone
gq_age0_14 <- df_gq %>% 
  group_by(azone) %>%
  filter(age_min <= "10", age_max<="14") %>%
  summarise(azone_pop = sum(gq_pop))

print(gq_age0_14)

gq_age15_19 <- df_gq %>%
  group_by(azone) %>%
  filter(age_min <= "18", age_max <= "19") %>%
  filter(age_min >= "15", age_max >= "17") %>%
  summarise(azone_pop = sum(gq_pop))

print(gq_age15_19)

gq_age20_29 <- df_gq %>%
  group_by(azone) %>%
  filter(age_min <= "25", age_max <= "29") %>%
  filter(age_min >= "20", age_max >= "24") %>%
  summarise(azone_pop = sum(gq_pop))

print(gq_age20_29)

gq_age30_54 <- df_gq %>%
  group_by(azone) %>%
  filter(age_min <= "50", age_max <= "54") %>%
  filter(age_min >= "30", age_max >= "34") %>%
  summarise(azone_pop = sum(gq_pop))

print(gq_age30_54)

gq_age55_64 <- df_gq %>%
  group_by(azone) %>%
  filter(age_min <= "60", age_max <= "64") %>%
  filter(age_min >= "55", age_max >= "59") %>%
  summarise(azone_pop = sum(gq_pop))

print(gq_age55_64)

gq_age65up <- df_gq %>%
  group_by(azone) %>%
  filter(age_min <= "85") %>%
  filter(age_min >= "65") %>%
  summarise(azone_pop = sum(gq_pop))

print(gq_age65up)
  

list_of_datasets <-
  list("0to14" = gq_age0_14, "15to19" = gq_age15_19, "20to29" = gq_age20_29, "30to54" = gq_age30_54, "55to64" = gq_age55_64, "65andup" = gq_age65up)


write.csv(list_of_datasets, file = "agegroups.csv")
