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
raleigh$difftime <- difftime(raleigh$issueddates,raleigh$applieddates, units = "days")

raleigh$in_out_city_limits_extra <- NULL
raleigh$county_extra <- NULL
raleigh$county_account_number_extra <- NULL
raleigh$dwelling_units_total_extra <- NULL
raleigh$number_of_stories_extra <- NULL
raleigh$owner_name_extra <- NULL
raleigh$lot_number_extra <- NULL
raleigh$proposed_work_extra <- NULL
raleigh$county_account_number_extra <- NULL
raleigh$dwelling_units_total_extra <- NULL
raliraleigh$proposed_work_extra <- NULL
raleigh$development_plan_name_extra <- NULL
raleigh$geom <- "NA"

#new orleans
cdi5_url = "https://permits.partner.socrata.com/resource/gk94-9m35.csv?$limit=50000"
newOrleans <- read.csv(curl(cdi5_url))
newOrleans$city <- "City of New Orleans"
newOrleans$applieddates <- strptime(newOrleans$AppliedDate, format = "%m/%d/%Y %H:%M:%S")
newOrleans$issueddates <- strptime(newOrleans$IssuedDate, format = "%m/%d/%Y %H:%M:%S")
newOrleans$Location_extra <-paste("(",newOrleans$Latitude,",",newOrleans$Longitude,")")
newOrleans$HistoricDistrict_extra <- NULL
newOrleans$Zoning_extra <- NULL
newOrleans$CouncilDist_extra <- NULL
newOrleans$Subdivision_extra <- NULL
newOrleans$ExitReason_extra <- NULL
newOrleans$LeadAgency_extra <- NULL 
newOrleans$DaysIssued_extra <- NULL
newOrleans$DaysOpen_extra <- NULL
newOrleans$BasementAr_extra <- NULL
newOrleans$SecondFloo_extra <- NULL
newOrleans$HeatType_extra <- NULL
newOrleans$Baths_extra <- NULL
newOrleans$Beds_extra <- NULL
newOrleans$TotalInspections_extra <- NULL
newOrleans$Applicant_extra <- NULL
newOrleans$OpenComments_extra <- NULL
newOrleans$BondAmount_extra <- NULL
newOrleans$UnpaidFees_extra <- NULL
newOrleans$LandUseShort_extra <- NULL
newOrleans$NextStatusDate_extra <- NULL
newOrleans$NextStatus_extra <- NULL
newOrleans$M_S_extra <- NULL
newOrleans$Division_extra <- NULL
newOrleans$Code_extra <- NULL
newOrleans$IsClosed_extra <- NULL
newOrleans$Owner_extra <- NULL
newOrleans$geom <- "NA"

total <- rbind(seattle, fortworth, raleigh, newOrleans) # still need to match up fields and drop ones that arent relevant 