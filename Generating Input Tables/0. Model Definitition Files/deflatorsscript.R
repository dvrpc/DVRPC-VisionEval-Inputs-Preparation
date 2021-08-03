setwd("C:/Users/fakram/Downloads")
rm(list=ls())

library(dplyr)
library(httr)
library(stringr)
library(readr)

update_year <- 2019 #CHANGE AS NEEDED


#GET('https://www.bls.gov/cpi/research-series/allitems.xls', 
#    write_disk(tf <- tempfile(fileext = ".csv"))) #THIS AND THE 2 LINES BELOW GET THE EXCEL SHEET I 
#NEED USING THE EXCEL LINK. HOW THIS WORKS: 1) DOWNLOADS THE EXCEL FILE, 2) STORES IT AS A TEMP FILE,
#3) BRINGS IN THAT TEMP FILE INTO R BASICALLY. FOUND OUT HOW TO DO FROM 
#https://stackoverflow.com/questions/60656958/how-do-i-read-excel-file-through-url-in-r-studio-its-https 
bls_conversions <- read_csv("allitems.csv") #IGNORE ANY WARNING MESSAGES THAT COME UP HERE
rm(tf)


bls_conversions <-
  bls_conversions %>%
  setNames(c(.[5,])) %>% 
  slice(-1:-5) %>% 
  setNames(str_to_title(colnames(.))) %>% 
  rename(year = 1) %>% 
  mutate_at(vars(-year), as.numeric) %>% 
  select(1,14) %>% 
  slice(which(.$year=="1999"):which(.$year==as.character(update_year))) %>% 
  mutate(inflation_factor_update_year = .$Avg[which(.$year==update_year)]/.$Avg) 
#THIS COMMAND: 
#1) Assigns the 5th row as the column names,
#2) Gets rid of the first 6 rows, 
#3) Makes column names 
#title case, 
#4) MAKES THE year COLUMN LOWER CASE since the race and ethnicity tables have their year 
#column lower case, 
#5) Makes all columns except year numeric, 
#6) Selects only the year and "Avg" columns, 

#since I only care about those columns because the "Avg" column shows 1 conversion rate PER YEAR, as 
#opposed to having 1 conversion rate per month, 6) Selects only the 2006-update year rows, since I only 
#care about those rows, 7) Creates an inflation factor column for the update year, where I divide the 
#"Avg" column value for the year in question by the past years. THE CURRENT YEAR'S "Avg" VALUE IS ALWAYS 
#THE NUMERATOR, THE PAST YEAR'S "Avg" VALUE IS ALWAYS THE DENOMINATOR. This is based off of the formulas 
#used in the "2017$Factors" tab (which in turn is based off the values in the "All Items_SA" tab) of 
#G:\Shared drives\Long Range Plan\Data & Indicators\Tracking Progress\Data Preparation\2017 dollars adjustment factors.xlsx


if (update_year==2019) {
  bls_conversions$inflation_factor_update_year[which(bls_conversions$year==2018)] <- 1.01811790
} else {bls_conversions <- bls_conversions} #ONLY IF THE update_year IS 2019 IS THIS VALUE CHANGED. 
#OTHERWISE, DON'T DO ANYTHING

write.csv(bls_conversions, file = "deflators.csv")
