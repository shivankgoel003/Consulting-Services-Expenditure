#### Preamble ####
# Purpose: Simulates the City of Toronto Consulting Expenditure dataset
# Author: Shivank Goel
# Date: 18th January 2024
# Contact: shivankg.goel@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)
library(tidyr)
library(opendatatoronto)
library(knitr)
library(lubridate)
library(patchwork)
library(readxl)
library(ggplot2)


#Defining columns from the data for simulation

# expense_category
expense_category = c("Technical", "Management / Research & Development", "Information Technology", "Technical", "Creative Communications","Legal")
#budget_category
budget_category = c("Operating", "Capital")
#Vendor
vendor = sample(c("KPMG LLP", "Deloitte LLP", "Ernst & Young LLP", "University of Toronto","BELL Media Inc", "Mercer (Canada) Limited"))
#Division
division = sample(c("Tornoto Community Housing", "Toronto Police Service", "Toronto Transit Commission", "Toronto Zoo", "Toronto Water", "Transportation Services"))
#city entities
entities = sample(c("City Manager", "Community and Social Services", "Finance & Treasury Services", "Infrastructure and Development"))


## Creating simulated data

set.seed(311) #random seed

simulated_consulting_data <- tibble(expense_category = sample(x = expense_category, size = 100, replace =  TRUE),
                                    "expenditure" = sample(10000:50000, 100, replace = TRUE),
                                    budget = sample(x = budget_category, size = 100, replace = TRUE),
                                    vendor = sample(x = vendor, size = 100, replace = TRUE), 
                                    divison = sample(x = division, size = 100, replace = TRUE), 
                                    entities = sample(x = entities, size = 100, replace = TRUE))

#Display of simulated data                                  
simulated_consulting_data

#Finding 

## Explore  summaries related to expenditure

# Summary of expenditure statistics by budget type
budget_type_summary <- 
  simulated_consulting_data %>%
  group_by(budget) %>%
  summarise(
    total_expenditure = sum(expenditure),
    average_expenditure = mean(expenditure),
    max_expenditure = max(expenditure),
    min_expenditure = min(expenditure)
  )

#Frequency of Expense Category
simulated_consulting_data %>% count(expense_category)

#Frequency of Consulting  Vendors
simulated_consulting_data %>% count(vendor)


#Bar plot for total expenditure by budget type
ggplot(budget_type_summary, aes(x = budget, y = total_expenditure)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  labs(title = "Total Expenditure by Budget Type",
       x = "Budget Type",
       y = "Total Expenditure") +
  theme_minimal()
budget_type_summary