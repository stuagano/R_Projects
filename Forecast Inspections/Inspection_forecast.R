install(RSocrata)
library("httr")
library("jsonlite")
library("plm")
inspections <- read.socrata("https://data.austintexas.gov/resource/ecmv-9xxi.json?$select=inspection_date,score,facility_id,process_description,restaurant_name")
lm <- lm(inspections$score ~ factor_data)
summary(lm)summar