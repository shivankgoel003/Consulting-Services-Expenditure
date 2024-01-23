#### Preamble ####
# Purpose: Downloads and saves the data from OpenDataToronto portal
# Author:Shivank Goel
# Date: 19 January 2024 
# Contact: shivankg.goel@mail.utoronto.ca
# License: MIT
# Pre-requisites: none
#Download dataset from: https://open.toronto.ca/dataset/consulting-services-expenditures/


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)


#### Download data ####

# get package
package <- show_package("91cf5765-3d3f-4d55-9eea-acb1d4222928")

# get all resources for this package
resources <- list_package_resources("91cf5765-3d3f-4d55-9eea-acb1d4222928")

# filter the resource you want by its name
selected_resource <- resources[resources$name == "2017-2021-consulting-database-xlsx",]

# use get_resources() to access and load the selected resource
consulting_data <- selected_resource %>%
  get_resource()


#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
#write_csv(
# x = consulting_data,
 # file = "inputs/data/raw_consulting_data"
#)


         
