#### Preamble ####
# Purpose: Cleaning the Consulting Expenditure data
# Author: Shivank
# Date: 19th January 2024
# Contact: shivankg.goel@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(janitor)
library(readxl)
library(dplyr)

#### Clean data ####


#### Reading data ####


#reading 2021 expenditure data
expenditure_data_2021 = read_excel("inputs/data/2017-2021-consulting-database-xlsx.xlsx", sheet = 5, range = "A2:J529")
#reading 2020 expenditure data
expenditure_data_2020 = read_excel("inputs/data/2017-2021-consulting-database-xlsx.xlsx", sheet = 4, range = "A2:J430")
#reading 2019 expenditure data
expenditure_data_2019 = read_excel("inputs/data/2017-2021-consulting-database-xlsx.xlsx", sheet = 3, range = "A3:J438")
#reading 2018 expenditure data
expenditure_data_2018 = read_excel("inputs/data/2017-2021-consulting-database-xlsx.xlsx", sheet = 2, range = "A3:J312")
#reading 2017 expenditure data
expenditure_data_2017 = read_excel("inputs/data/2017-2021-consulting-database-xlsx.xlsx", sheet = 1, range = "A3:J268")


# Simplified names
cleaned_expenditure_data_2021 = clean_names(expenditure_data_2021)
cleaned_expenditure_data_2020 = clean_names(expenditure_data_2020)
cleaned_expenditure_data_2019 = clean_names(expenditure_data_2019)
cleaned_expenditure_data_2018 = clean_names(expenditure_data_2018)
cleaned_expenditure_data_2017 = clean_names(expenditure_data_2017)



# #Simplifying expenditure values to numerical value since some of the values contained brackets

cleaned_expenditure_data_2021$x2021_expenditure = abs(as.numeric(gsub("\\(\\)", "", cleaned_expenditure_data_2021$x2021_expenditure)))
cleaned_expenditure_data_2020$x2020_expenditure = abs(as.numeric(gsub("\\(\\)", "", cleaned_expenditure_data_2020$x2020_expenditure)))
cleaned_expenditure_data_2019$x2019_expenditure = abs(as.numeric(gsub("\\(\\)", "", cleaned_expenditure_data_2019$x2019_expenditure)))
cleaned_expenditure_data_2018$x2018_expenditure = abs(as.numeric(gsub("\\(\\)", "", cleaned_expenditure_data_2018$x2018_expenditure)))
cleaned_expenditure_data_2017$x2017_expenditure = abs(as.numeric(gsub("\\(\\)", "", cleaned_expenditure_data_2017$x2017_expenditure)))


#columns of interest
cleaned_expenditure_data_2021 = 
  cleaned_expenditure_data_2021 |>
  select(
    budget_type,
    city_abc,
    expense_category,
    division_board,consultants_name,x2021_expenditure
  )


cleaned_expenditure_data_2020 = 
  cleaned_expenditure_data_2020 |>
  select(
    budget_type,
    city_abc,
    expense_category,
    division_board,consultants_name,x2020_expenditure
  )
cleaned_expenditure_data_2020

cleaned_expenditure_data_2019 = 
  cleaned_expenditure_data_2019 |>
  select(
    budget_type,
    city_abc,
    expense_category,
    division_board,consultants_name,x2019_expenditure
  )

cleaned_expenditure_data_2018 = 
  cleaned_expenditure_data_2018 |>
  select(
    budget_type,
    city_abc,
    expense_category,
    division_board,consultants_name,x2018_expenditure
  )

cleaned_expenditure_data_2017 = 
  cleaned_expenditure_data_2017 |>
  select(
    budget_type,
    city_abc,
    expense_category,
    division_board,consultants_name, x2017_expenditure
  )

# simplified longer names of expense categories for ease of data
# referenced code: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html
cleaned_expenditure_data_2021 = 
  cleaned_expenditure_data_2021 |>
  mutate(
    expense_category = 
      recode(
        expense_category,
        "Management / Research & Development" = "Management/R&D",
        "Information Technology" = "IT",
        "Legal (External Lawyers & Planners)" = "Legal"
      ),
  )

cleaned_expenditure_data_2020 = 
  cleaned_expenditure_data_2020 |>
  mutate(
    expense_category = 
      recode(
        expense_category,
        "Management / Research & Development" = "Management/R&D",
        "Information Technology" = "IT",
        "Legal (External Lawyers & Planners)" = "Legal"
      ),
  )

cleaned_expenditure_data_2019 = 
  cleaned_expenditure_data_2019 |>
  mutate(
    expense_category = 
      recode(
        expense_category,
        "Management / Research & Development" = "Management/R&D",
        "Information Technology" = "IT",
        "Legal (External Lawyers & Planners)" = "Legal"
      ),
  )

cleaned_expenditure_data_2018 = 
  cleaned_expenditure_data_2018 |>
  mutate(
    expense_category = 
      recode(
        expense_category,
        "Management / Research & Development" = "Management/R&D",
        "Information Technology" = "IT",
        "Legal (External Lawyers & Planners)" = "Legal"
      ),
  )

cleaned_expenditure_data_2017 = 
  cleaned_expenditure_data_2017 |>
  mutate(
    expense_category = 
      recode(
        expense_category,
        "Management / Research & Development" = "Management/R&D",
        "Information Technology" = "IT",
        "Legal (External Lawyers & Planners)" = "Legal"
      ),
  )



#### Save data ####
write_csv(cleaned_expenditure_data_2021, "inputs/data/cleaned_data_2021.csv")
write_csv(cleaned_expenditure_data_2020, "inputs/data/cleaned_data_2020.csv")
write_csv(cleaned_expenditure_data_2019, "inputs/data/cleaned_data_2019.csv")
write_csv(cleaned_expenditure_data_2018, "inputs/data/cleaned_data_2018.csv")
write_csv(cleaned_expenditure_data_2017, "inputs/data/cleaned_data_2017.csv")

