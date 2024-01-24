#### Preamble ####
# Purpose: Data Validation and Testing
# Author: Shivank Goel  
# Date: 22 January 2024
# Contact: shivankg.goel@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(testthat)
      
#### Test data ####


#Unit Testing Reference:https://testthat.r-lib.org/reference/test_that.html 

#Testing data types
class(cleaned_data_2017$EXPENDITURE) == "numeric"
class(cleaned_data_2018$EXPENDITURE) == "numeric"
class(cleaned_data_2019$EXPENDITURE) == "numeric"
class(cleaned_data_2020$EXPENDITURE) == "numeric"
class(cleaned_data_2021$EXPENDITURE) == "numeric"

class(cleaned_data_2017$expense_category) == "character"
class(cleaned_data_2018$expense_category) == "character"
class(cleaned_data_2019$expense_category) == "character"
class(cleaned_data_2020$expense_category) == "character"
class(cleaned_data_2021$expense_category) == "character"

class(cleaned_data_2017$budget_type) == "character"
class(cleaned_data_2018$budget_type) == "character"
class(cleaned_data_2019$budget_type) == "character"
class(cleaned_data_2020$budget_type) == "character"
class(cleaned_data_2021$budget_type) == "character"


# Testing if all expenditure value are positive
test_that("Expenditure values are positive", {
  expect_true(all(cleaned_data_2017$EXPENDITURE > 0),)
})

#Testing if summary of the data found is statistically correct
test_that("Summary Check 2021", {
  summary_stats <- summary(cleaned_data_2021$EXPENDITURE)
  expect_true(summary_stats["Min."] > 0)
  expect_true(summary_stats["Mean"] > 0)
})

#Testing if summary of the data found is statistically correct
test_that("Summary Check 2020", {
  summary_stats <- summary(cleaned_data_2020$EXPENDITURE)
  expect_true(summary_stats["Min."] > 0)
  expect_true(summary_stats["Mean"] > 0)
})

#Testing if summary of the data found is statistically correct
test_that("Summary Check 2019", {
  summary_stats <- summary(cleaned_data_2019$EXPENDITURE)
  expect_true(summary_stats["Min."] > 0)
  expect_true(summary_stats["Mean"] > 0)
})


#Testing if summary of the data found is statistically correct
test_that("Summary Check 2018", {
  summary_stats <- summary(cleaned_data_2018$EXPENDITURE)
  expect_true(summary_stats["Min."] > 0)
  expect_true(summary_stats["Mean"] > 0)
})

#Testing if summary of the data found is statistically correct
test_that("Summary Check 2017", {
  summary_stats <- summary(cleaned_data_2017$EXPENDITURE)
  expect_true(summary_stats["Min."] > 0)
  expect_true(summary_stats["Mean"] > 0)
})


