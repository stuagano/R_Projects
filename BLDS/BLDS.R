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
seattle$difftime <- as.numeric(difftime(seattle$issueddates,seattle$applieddates))
seattle$Applicant.Name_extra <- NULL
seattle$Work.Type_extra <- NULL

#Fort Worth
cdi2_url = "https://permits.partner.socrata.com/resource/qy5k-jz7m.csv?$limit=50000"
fortworth <- read.csv(curl(cdi2_url))
fortworth$city <- "City of Forth Worth"
fortworth$applieddates <- strptime(fortworth$AppliedDate, format = "%m/%d/%Y %H:%M:%S")
fortworth$issueddates <- strptime(fortworth$IssuedDate, format = "%m/%d/%Y %H:%M:%S")
fortworth$difftime <- as.numeric(difftime(fortworth$issueddates,fortworth$applieddates, units = "days"))
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
raleigh$difftime <- as.numeric(difftime(raleigh$applieddates,raleigh$issueddates, units = "days"))
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
newOrleans$difftime <- as.numeric(difftime(newOrleans$issueddates,newOrleans$applieddates, units = "days"))
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

#City of Redmond 
cdi6_url = "https://permits.partner.socrata.com/resource/r9sj-7n4p.csv?$limit=50000"
redmond <- read.csv(curl(cdi6_url))
redmond$city <- "City of Redmond"
redmond$applieddates <- strptime(redmond$AppliedDate, format = "%m/%d/%Y %H:%M:%S")
redmond$issueddates <- strptime(redmond$IssuedDate, format = "%m/%d/%Y %H:%M:%S")
redmond$difftime <- as.numeric(difftime(redmond$issueddates,redmond$applieddates, units = "days"))
redmond$Location_extra <-paste("(",redmond$Latitude,",",redmond$Longitude,")")
redmond$Additional.Reference_extra <- NULL
redmond$Owner_extra <- NULL
redmond$Applicant_extra <- NULL
redmond$Tenant_extra <- NULL
redmond$Lender_extra <- NULL
redmond$Designer.of.Record_extra <- NULL
redmond$geom <- NA






total <- rbind(seattle, fortworth, raleigh, newOrleans, redmond) # still need to match up fields and drop ones that arent relevant 
view(total$difftime)

socrataEmail <- Sys.getenv("SOCRATA_EMAIL", "xxx@socrata.com")
socrataPassword <- Sys.getenv("SOCRATA_PASSWORD", "XXXX")
datasetToAddToUrl <- "https://stubox2.demo.socrata.com/resource/pgw9-g83a.json"
write.socrata(projected.DF,datasetToAddToUrl,"UPSERT",socrataEmail,socrataPassword)