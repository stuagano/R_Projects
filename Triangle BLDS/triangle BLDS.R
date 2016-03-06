library("RSocrata")
library("httr")
library("devtools")
library("jsonlite")
library("curl")
library("gtools")
install_github("Chicago/RSocrata")


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

#Town of Cary
url <- 'https://data.townofcary.org/explore/dataset/permit-applications/download/?format=json&timezone=America/New_York'
document <- fromJSON(txt=url)
document$contractortrademapped <- document$fields$contractortrademapped
document$originalstate <- document$fields$originalstate
document$originaladdress1 <- document$fields$originaladdress1
document$permitclassmapped <- document$fields$permittypemapped
document$originalstate <- document$fields$originalstate
document$contractortrademapped <- document$fields$contractortrademapped
document$originaladdress1 <- document$fields$originaladdress1
document$permitclassmapped <- document$fields$permittypemapped
document$originalstate <- document$fields$originalstate
document$city <- "Town of Cary"
document$contractorphone <- documents$fields$contractorphone
document$contractorphone <- document$fields$contractorphone
document$permittypemapped <- document$fields$permittypemapped
document$permitnumber <- document$fields$permitnum
document$applieddate <- document$fields$applieddate
document$issuedate <- strptime(document$fields$issuedate, format = "%m/%d/%Y")
document$applieddate <- strptime(document$fields$applieddate, format = "%m/%d/%Y")
document$contractoraddress <- document$fields$contractoraddress1
document$ownerzip <- document$fields$ownerzip
document$ownerzip <- document$fields$ownerzip
document$ownerzip <- document$fields$ownerzip
document$ownername <- document$fields$ownername
document$Location_extra <-paste("(",document$fields$latitude,",",document$fields$longitude,")")
document$statuscurrentmapped <- document$fields$statuscurrentmapped
document$Link <- document$fields$link
document$PermitNum <- document$permitnumber
document$Description <- document$fields$description
document$applieddates <- document$applieddate
document$AppliedDate <- document$applieddate
docuemtn$IssuedDate <- document$issuedate
document$IssuedDate <- document$issuedate
document$issueddates <- document$issuedate
document$CompletedDate <- document$fields$completeddate
document$OriginalAddress1 <- document$originaladdress1
document$OriginalAddress2 <- "NA"
document$OriginalCity <- "Town of Cary"
document$OriginalState <- document$originalstate
document$originalstate <- NULL
document$OriginalZip <- "NA"
document$Jurisdiction <- "NA"
document$PermitClass <- document$fields$permitclass
document$PermitClassMapped <- document$permitclassmapped
document$StatusCurrent <- document$statuscurrentmapped
document$StatusCurrentMapped <- document$statuscurrentmapped
document$WorkClass <- document$fields$workclass
document$WorkClassMapped <- document$fields$workclassmapped
document$PermitType <- document$fields$permittype
document$PermitTypeMapped <- document$permittypemapped
document$permittypemapped <- NULL
document$PermitTypeDesc <- document$fields$permittypedesc
document$StatusDate <- document$fei
document$StatusDate <- document$fields$statusdate
document$TotalSqFt <- document$fields$totalsqft
document$Latitude <- document$fields$latitude
docment$Longitude <- document$fields$longitude
document$Longitude <- document$fields$longitude
document$EstProjectCostDesc <- document$fields$projectcost
document$Units <- "NA"
document$Pin <- "NA"
document$ContractorCompanyName <- document$fields$contractortrademapped
document$issueddates <- strptime(document$fields$applieddate, format = "%Y-%m-%d") 
document$applieddates <- strptime(document$CompletedDate, format = "%Y-%m-%d") 
document$difftime <- as.numeric(difftime(document$applieddates,document$issueddates, units = "days"))
document$datasetid <- NULL
document$recordid <- NULL
document$fields$contractortrademapped <- NULL
document$fields$originaladdress1 <- NULL
document$fields$permitclassmapped <- NULL
document$fields$jurisdiction <- NULL
document$fields$contractorphone <- NULL
document$fields$contractoraddress1 <- NULL
document$fields$statuscurrentmapped <- NULL
document$fields$owneraddress1 <- NULL
document$fields$statuscurrentmapped <- NULL
document$fields$description <- NULL
document$fields$permittypedesc <- NULL
document$fields$link <- NULL
document$fields$totalsqft <- NULL
document$fields$statusdate <- NULL
document$fields$permittypemapped <- NULL
document$fields$permittypemapped <- NULL
document$fields$permitclass <- NULL
document$fields.originalstate <- NULL
document[1] <- NULL
document[1] <- NULL
document[1] <- NULL
document$ContractorPhonee <- NULL
document$contractorphone <- NULL
document[1] <- NULL
document[1] <- NULL
document[1] <- NULL
document[1] <- NULL
document[1] <- NULL
document[1] <- NULL
document[1] <- NULL
document[2] <- NULL
document$city <- "Town of Cary"
document$geom <- NA
document$EstProjectCostText <- document$EstProjectCost
document$EstProjectCost <- NULL
document$EstProjectCost <- NA
document$MasterPermitNumber <- document$MasterPermitNum
document$MasterPermitNumber <- NULL
document$OriginalAddress2 <- NA
document$OriginalZip <- NA
document$Jurisdiction <- NA
document$Units <- NA
document$Pin <- NA
document$ContractLicNum <- NA
document$ContractorLicNum <- NULL
document$PIN <- document$Pin
document$Pin <- NULL
document$PIN <- NA
View(document)
View(document)
document$MasterPermitNum <- NA
total <- smartbind(document, raleigh, fill = NA)

#Wake County 
url2 <- "http://data.wake.opendata.arcgis.com/datasets/8295268844ba4b7db2c22a1f7ff0f460_0.csv"
wake <- fromJSON(txt=url2)

