library(RSocrata)
library(httr)
library(jsonlite)
library(forecast)
library(devtools)
EMSIncidents <- read.socrata("https://data.austintexas.gov/resource/bptg-ndvw.json") #read the dataset from City of Austin
myts <- ts(EMSIncidents$count_responses_all, start=c(2010, 1), end=c(2015,2), frequency=12) #store as time series 
fit <- stl(myts, s.window = "period") 
forecast(fit) # forecast out
projected <- forecast(fit) # stores it as a list 
projected.DF <- as.data.frame(projected)
my.dates = seq(as.Date("2015/3/1"), as.Date("2017/2/1"), "1 month")  #fix date 
projected.DF$date <- my.dates # add date to date frame 
View(projected.DF) # view dataframe 
socrataEmail <- Sys.getenv("SOCRATA_EMAIL", "XXX@socrata.com")
socrataPassword <- Sys.getenv("SOCRATA_PASSWORD", "XXXXXXX")

datasetToAddToUrl <- "https://opendata.socrata.com/resource/evnp-32vr.json" # dataset

write.socrata(projected.DF,datasetToAddToUrl,"UPSERT",socrataEmail,socrataPassword) # write to opendata.socrata.com
