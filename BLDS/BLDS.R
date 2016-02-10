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
seattle$Applicant.Name_extra <- NULL
seattle$Work.Type_extra <- NULL

#Fort Worth
cdi2_url = "https://permits.partner.socrata.com/resource/qy5k-jz7m.csv?$limit=50000"
fortworth <- read.csv(curl(cdi2_url))
fortworth$city <- "City of Forth Worth"
fortworth$applieddates <- strptime(fortworth$AppliedDate, format = "%m/%d/%Y %H:%M:%S")
fortworth$issueddates <- strptime(fortworth$IssuedDate, format = "%m/%d/%Y %H:%M:%S")
fortworth$difftime <- difftime(fortworth$issueddates,fortworth$applieddates, units = "days")
fortworth$Special.Text_extra <- NULL #some field mapping.
fortworth$Permit.Sub.type_extra <- NULL
fortworth$Owner.s.Name_extra <- NULL
fortworth$Legal.Description_extra <-NULL
names(fortworth)[names(fortworth)=="Location.1_extra"] <- "Location_extra" #rename feilds

#City of Boston doesnt capture other dates 
cdi3_url = "https://permits.partner.socrata.com/resource/ga54-wzas.csv?$limit=50000"
boston <- read.csv(curl(cdi3_url))
#so dont use this city 

#city of Raliegh 
cdi4_url = "https://permits.partner.socrata.com/resource/pjib-v4rg.csv?$limit=50000"
raleigh <- read.csv(curl(cdi4_url))
raleigh$city <- "City of Raleigh"
raleigh$applieddates <- strptime(raleigh$AppliedDate, format = "%m/%d/%Y %H:%M:%S")
raleigh$issueddates <- strptime(raleigh$IssuedDate, format = "%m/%d/%Y %H:%M:%S")
raleigh$Location_extra <-paste("(",raleigh$Latitude,",",raleigh$Longitude,")")

total <- rbind(seattle, fortworth) # still need to match up fields and drop ones that arent relevant 