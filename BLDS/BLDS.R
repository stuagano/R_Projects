library("RSocrata")
library("httr")
library("devtools")
library("jsonlite")
library("curl")
install_github("Chicago/RSocrata")

#seattle
cdi_url = "https://permits.partner.socrata.com/resource/m393-mbxq.csv?$limit=50000"
seattle <- read.csv(curl(cdi_url)) # read it in as a table. 
seattle$city <- "City of Seattle" #add city of Seattle to data frame for eventual joining
seattle$applieddates <- strptime(seattle$AppliedDate, format = "%m/%d/%Y %H:%M:%S") # convert strings to date and time
seattle$issueddates <- strptime(seattle$IssuedDate, format = "%m/%d/%Y %H:%M:%S") # issued dates convert
seattle$difftime <- difftime(seattle$issueddates,seattle$applieddates, units = "days") # calculates the date difference in terms of days 

#Fort Worth
cdi2_url = "https://permits.partner.socrata.com/resource/qy5k-jz7m.csv?$limit=50000"
fortworth <- read.csv(curl(cdi2_url))
fortworth$city <- "City of Forth Worth"
fortworth$applieddates <- strptime(fortworth$AppliedDate, format = "%m/%d/%Y %H:%M:%S")
fortworth$issueddates <- strptime(fortworth$IssuedDate, format = "%m/%d/%Y %H:%M:%S")
fortworth$difftime <- difftime(fortworth$issueddates,seattle$applieddates, units = "days")

total <- rbind(seattle, fortworth) # still need to match up fields and drop ones that arent relevant 