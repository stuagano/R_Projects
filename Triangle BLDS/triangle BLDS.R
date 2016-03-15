library("RSocrata")
library("httr")
library("devtools")
library("jsonlite")
library("curl")
library("gtools")
install_github("Chicago/RSocrata")


#city of Raliegh old and deprecated
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

#Raleigh New Dataset all good now
cdi5_url <- 'https://data.raleighnc.gov/resource/xce4-kemu.csv?$limit=50000'
raliegh2 <- read.csv(curl(cdi5_url))
raliegh2$AppliedDate <- NA
raliegh2$CompletedDate <- NA
raliegh2$PermitTypeDescription <- NA
raliegh2$StatusDate <- NA
raliegh2$Link <- NA
raliegh2$Latitude <- raliegh2$Latitude_perm
raliegh2$Latitude_perm <- NULL
raliegh2$Longitude <- raliegh2$Longitude_perm
raliegh2$Longitude_perm <- NULL
raliegh2$EstProjectCostText <- NA
raliegh2$Units <- raliegh2$HousingUnitsTotal
raliegh2$HousingUnitsTotal <- NULL
raliegh2$ContractorTradeMapped <- NA
raliegh2$ContractorStateLic <- NA
raliegh2$AddedSqFt <- NA
raliegh2$MasterPermitNum <- NA
raliegh2$HoldDate <- NA
raliegh2$ProjectID <- raliegh2$DevPlanID
raliegh2$DevPlanID <- NULL
raliegh2$TotalFinishedSqFt <- NA
raliegh2$TotalUnfinishedSqFt <- NA
raliegh2$TotalHeatedSqFt <- NA
raliegh2$TotalUnHeatedSqFt <- NA
raliegh2$TotalAccSqFt <- NA
raliegh2$TotalSprinkledSqFt <- NA
raliegh2$ContractorFullName <- NA
raliegh2$ContractorCompanyDesc <- NA
raliegh2$city <- "City of Raleigh"
raliegh2$applieddates <- NA
raliegh2$issueddates <- NA
raleigh2$Location_extra <-paste("(",raleigh2$Latitude,",",raleigh2$Longitude,")")
raliegh2$CoRLotId <- NULL
raliegh2$CensusLandUse <- NULL
raliegh2$CensusLandUseCode <- NULL
raliegh2$CntyAcctNum <- NULL
raliegh2$COCIssuedDate <- NULL
raliegh2$COCNbr <- NULL
raliegh2$ConstCompletedOfficial <- NULL
raliegh2$ContractorDBA <- NULL
raliegh2$CountyLocation <- NULL
raliegh2$ExpiredNewPermNum <- NULL
raliegh2$Fee <- NULL
raliegh2$FiscalYear <- NULL
raliegh2$Geocoded_MatchScore <- NULL
raliegh2$Location_extra <- raliegh2$Geocoded_PermAddr
raliegh2$GovtOwnedProp<- NULL
raliegh2$Geocoded_PermAddr <- NULL
raliegh2$GroupTenantName <- NULL
raliegh2$GRP_COMMENT_1 <- NULL
raliegh2$GRP_B_BLDG_OCC_CLASS_NEW <- NULL
raliegh2$GRP_BLDG_BASEMENT_OCCUPIED <- NULL
raliegh2$GRP_COMMENT_2 <- NULL
raliegh2$GRP_CO_COMMENT <- NULL
raliegh2$GRP_REVIEW_PATH <-NULL
raliegh2$GRP_BLDG_FOOTPRINT <-NULL
raliegh2$GRP_TEMP_CO_COMMENT_1 <- NULL
raliegh2$GRP_TEMP_CO_COMMENT_2 <- NULL
raliegh2$HousingUnitsExist <- NULL
raliegh2$IssuedDate_Mth <-NULL
raliegh2$IssuedDate_Yr <- NULL
raliegh2$Jurisdiction_AtIssue <- NULL
raliegh2$Jurisdiction_InOut_Ral <- NULL
raliegh2$LandUseNewUse <- NULL
raliegh2$Location_Geocoded <- NULL
raliegh2$MapSheet <- NULL
raliegh2$NumberStories <- NULL
raliegh2$OriginalAddressFull <- NULL
raliegh2$PARC_OPEN_SPACE_ZONE_FEE <- NULL
raliegh2$ParcelOwnerName <- NULL
raliegh2$ParcelOwnerAddress1 <- NULL
raliegh2$ParcelOwnerAddress2 <- NULL
raliegh2$PERM_COMMENTS <- NULL
raliegh2$Publisher <- NULL
raliegh2$ProposedWorkDescription <- NULL
raliegh2$RecordUpdateDate <- NULL
raliegh2$StreetDirectionPrefix <- NULL
raliegh2$StreetDirectionSuffix <- NULL
raliegh2$ReviewerComments <- NULL
raliegh2$StreetType <- NULL
raliegh2$StreetNum <- NULL
raliegh2$difftime <- NA
raliegh2$geom <- NA
raliegh2$EstProjectCostDec <- NA
raliegh2$PermitTypeDesc <- raliegh2$PermitTypeDescription
raliegh2$PermitTypeDescription <- NULL


#Town of Cary all good
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
document$Longitude <- document$fields$longitude
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
document$MasterPermitNum <- NA
document$AddedSqFt <- NA
document$COIssuedDate <- NA
document$ContractorAddress1 <- document$contractoraddress
document$ContractorAddress2 <- NA
document$contractoraddress <- NULL
document$ContractorCity <- NA
document$ContractorCompanyDesc <- NA
document$ContractorEmail <- NA
document$ContractorFullName <- NA
document$ContractorLicNum <- NA
document$ContractorPhone <- NA
document$ContractorState <- NA
document$ContractorStateLic <- NA
document$ContractorTrade <- NA
document$ContractorTradeMapped <- NA
document$ContractorZip <- NA
document$difftime <- NA
document$Fee <- NA
document$ExpiresDate <- NA
document$HoldDate <- NA
document$issueddates <-NA
document$ProjectID <- NA
document$ProjectName <- NA
document$ProposedUse <- NA
document$ownername <- NULL
document$ownerzip <- NULL
document$statuscurrentmapped <- NULL
document$TotalAccSqFt <- NA
document$TotalFinishedSqFt <- NA
document$TotalHeatedSqFt <- NA
document$TotalSprinkledSqFt <- NA
document$TotalUnfinishedSqFt <- NA
document$TotalUnHeatedSqFt <- NA
document$VoidDate <- NA
document$ContractLicNum <- document$ContractLicNum
document$ContractLicNum <- NULL
document$LandUseDescription <- NA
document$StateLicNum <- NA

total2 <-smartbind(document, total)

#Wake County 
url2 <- "http://data.wake.opendata.arcgis.com/datasets/8295268844ba4b7db2c22a1f7ff0f460_0.csv"
wake <- fromJSON(txt=url2)
wake$PermitNum <- wake$PERMITNUM
wake$Description <- wake$DESCRIPTION
wake$AppliedDate <- NA
wake$IssuedDate <- wake$ISSUEDDATE
wake$CompleteDate <- wake$COMPLETEDDATE
wake$OringalAddress1 <- wake$ORIGINALADDRESS
wake$ORIGINALADDRESS <- NULL
wake$PERMITNUM <- NULL
wake$DESCRIPTION <- NULL
wake$ISSUEDDATE <- NULL
wake$COMPLETEDDATE <- NULL
wake$OriginalAddress2 <-NULL
wake$OringalAddress2 <- NA
wake$OringinalCity <- wake$ORIGINALCITY
wake$ORIGINALCITY <- NULL
wake$OriginalState <- "NC"
wake$OriginalZip <- wake$ORIGINALZIP
wake$ORIGINALZIP <- NULL
wake$Jurisdiction <- wake$JURISDICTION
wake$JURISDICTION <- NULL
wake$PermitClass <- wake$PERMITCLASS
wake$PERMITCLASS <- NULL
wake$PermitClassMapped <- wake$PERMITCLASSMAPPED
wake$PERMITCLASSMAPPED <- NULL
wake$StatusCurrent <- wake$STATUSCURRENT
wake$STATUSCURRENT <- NULL
wake$StatusCurrentMapped <- wake$STATUSCURRENTMAPPED
wake$STATUSCURRENTMAPPED <- NULL
wake$WorkClass <- NA
wake$WorkClassMapped <-NA
wake$PermitType <- wake$WPERMITTYPEBLDG
wake$PermitTypeMapped <- wake$WPERMITTYPEBLDG
wake$WPERMITTYPEBLDG <- NULL
wake$PermitTypeDesc <- NA
wake$StatusDate <- NA
wake$TotalSqFt <- wake$TOTALSQFT
wake$Link <- NA
wake$Latitude <- wake$LATITUDE
wake$LATITUDE <- NULL
wake$Longitude <- wake$LONGITUDE
wake$LONGITUDE <- NA
wake$EstProjectCostDec <- NA
wake$EstProjectCostText <- NA
wake$Units <- NA
wake$ContractorCompanyName <- wake$MECHCONTRACTORNAME
wake$MECHCONTRACTORNAME <- NA
wake$ContractorTrade <- NA 
wake$ContractorTradeMapped <- NA
wake$ContractorLicNum <- wake$MECHCONTRACTORLICNUM
wake$ContractorStateLic <- NA
wake$ProposedUSe <- NA
wake$ProposedUse <- NA
wake$EstProjectCost <- NA
wake$AddedSqFt <- NA
wake$MasterPermitNum <- NA
wake$ExpiresDate <- NA
wake$COIssuedDate <- wake$ADDDATE
wake$ADDDATE <- NULL
wake$HoldDate <- NA
wake$VoidDate <- NA
wake$ProjectName <- NA
wake$ProjectID <- NA
wake$TotalFinishedSqFt <- wake$TOTALSQFT
wake$TOTALSQFT <- NULL
wake$TotalUnfinishedSqFt <- NA
wake$TotalHeatedSqFt <- NA
wake$TotalUnHeatedSqFt <- NA
wake$TotalAccSqFt <- NA
wke$TotalSprinkledSqFt <- NA
wake$Publisher <- NULL
wake$Fee <- wake$FEE
wake$FEE <- NULL
wake$ContractorFullName <- wake$MECHCONTRACTORNAME
wake$MECHCONTRACTORNAME <- NULL
wake$ContractorCompanyDesc <- NA
wake$ContractorPhone <- wake$BUILDINGCONTRACTORPHONE
wake$BUILDINGCONTRACTORPHONE <- NULL
wake$ContractorAddress1 <- NA
wake$ContractorAddress2 <- NA
wake$ContractorCity <- NA
wake$ContractorState <- NA
wake$ContractorState <- NA
wake$ContractorEmail <- NA
wake$city <- wake$MAILINGADDRCITY
wake$MAILINGADDRCITY <- NA
wake$applieddates <- strptime(wake$AppliedDate, format = "%m/%d/%Y") 
wake$issueddates <- strptime(wake$IssuedDate, format = "%m/%d/%Y")
wake$difftime<- as.numeric(difftime(wake$issueddates,wake$applieddates, units = "days"))
wake$Location_extra <-paste("(",wake$Latitude,",",wake$Longitude,")")
wake$geom <- NA
wake$OBJECTID <- NULL
wake$ID <-NULL
wake$RECEIPTNUMBER <- NULL
wake$RECEIPTDATE <- NULL
wake$APPLICANTNAME <- NULL
wake$OWNERNAME<-NULL
wake$USECODE <- NULL
wake$USECODEDESCRIPTION <- NULL
wake$IMPROVEMENTVALUE <- NULL
wake$WATERSYSTEMTYPE <- NULL
wake$SEWERSYSTEMTYPE <- NULL
wake$TOWNSHIPCODE <- NULL
wake$TOWNSHIPDESCRIPTION <- NULL
wake$ZONINGCODE <- NULL
wake$SUBDIVISIONNAME <- NULL
wake$SUBDIVISIONLOT <- NULL
wake$SUBDIVISIONSECTION <- NULL
wake$LONGITUDE <- NULL
wake$STREET <- NULL
wake$STREETNUMBER <- NULL
wake$STREETMISC <- NULL
wake$STREETDIRECTIONPREFIX <- NULL
wake$STREETNAME <- NULL
wake$STREETTYPE <- NULL
wake$STREETDIRECTIONSUFFIX <- NULL
wake$PINMAPNUMBER <- NULL
wake$PINMAPSCALE <- NULL
wake$PINBLOCKNUMBER <- NULL
wake$PINLOTNUMBER <- NULL
wake$PINEXTNUMBER <- NULL
wake$PINSPLIT <- NULL
wake$ACRES <- NULL
wake$MAILINGADDRLINE2 <- NULL
wake$MAILINGADDRCITY <- NULL
wake$MAILINGADDRSTATE <- NULL
wake$MAILINGADDRZIPCODE <- NULL
wake$BUILDINGCONTRACTORLICNUMPREFIX <- NULL
wake$BUILDINGCONTRACTORLICNUM <- NULL
wake$BUILDINGCONTRACTORAREACODE <- NULL
wake$PLUMBCONTRACTORNAME <- NULL
wake$PLUMBCONTRACTORLICNUMPREFIX <- NULL
wake$PLUMBCONTRACTORLICNUM <- NULL
wake$ELECCONTRACTORNAME <- NULL
wake$ELECCONTRACTORLICNUMPREFIX <- NULL
wake$ELECCONTRACTORLICNUM <- NULL
wake$MECHCONTRACTORLICNUMPREFIX <- NULL
wake$MECHCONTRACTORLICNUM <- NULL
wake$OTHERCONTRACTOR1NAME <- NULL
wake$OTHERCONTRACTOR1LICNUM <- NULL
wake$OTHERCONTRACTOR2NAME <- NULL
wake$OTHERCONTRACTOR2LICNUM <- NULL
wake$OTHERCONTRACTOR3NAME <- NULL
wake$OTHERCONTRACTOR3LICNUM <- NULL
wake$OTHERCONTRACTOR4NAME <- NULL
wake$OTHERCONTRACTOR4LICNUM <- NULL
wake$SUBDIVIMPROVENUM <- NULL
wake$PURGEFLAG <- NULL
wake$RECOVERYFUNDFLAG <- NULL
wake$OLDPROPERTYLOCATION <- NULL
wake$REALESTATEID <- NULL
wake$CENSUSTRACTNUMBER1 <- NULL
wake$CENSUSTRACTNUMBER2 <- NULL
wake$WPERMITTTYPESOLIDWASTE <- NULL
wake$WPERMITTYPEWATERQUALITY <- NULL
wake$WPERMITTYPELAND <- NULL
wake$WPERMITTYPEFIRE <- NULL
wake$TEMPORARYPOLEFLAG <- NULL
wake$PERMITHOLDSTATUSZON <- NULL
wake$PERMITHOLDSTATUSENG <- NULL
wake$PERMITHOLDSTATUSINS <- NULL
wake$PERMITHOLDSTATUSFIR <- NULL
wake$PERMITHOLDSTATUSSUB <- NULL
wake$PERMITHOLDSTATUSEFS <- NULL
wake$PERMITHOLDSTATUSWW <- NULL
wake$CONTRACTORHOLDSTATUSBUILDING <- NULL
wake$CONTRACTORHOLDSTATUSPLUMBING <- NULL
wake$CONTRACTORHOLDSTATUSELECTRICAL <- NULL
wake$CONTRACTORHOLDSTATUSMECHANICAL <- NULL
wake$CONTACTNAME <- NULL
wake$MAPPARCELBLOCK <- NULL
wake$MAPPARCELLOT <- NULL
wake$PLATREFYEAR <- NULL
wake$PLATREFPAGE <- NULL
wake$ROOMS <- NULL
wake$BEDROOMS <- NULL
wake$BASEMENT <- NULL
wake$GARBAGEDISPOSAL <- NULL
wake$PUMP <- NULL
wake$NUMBEROFEMPLOYEES <- NULL
wake$FOODHANDLING <- NULL
wake$BOAREQUIRED <- NULL
wake$BOADATE <- NULL
wake$BOACASENUMBER <- NULL
wake$BOAACTION <- NULL
wake$MHMAKE <- NULL
wake$MHSERIALNUMBER <- NULL
wake$MH_UL_HUDNUMBER <- NULL
wake$MHYEAR <- NULL
wake$MHSIZE <- NULL
wake$MHCOLOR <- NULL
wake$HEALTHPERMITNUMBER <- NULL
wake$HEALTHOPDATE <- NULL
wake$HEALTHOPBY <- NULL
wake$GEOCODESTATUS <- NULL
wake$ProposedUSe <- NULL
wake$LandUseDescription <- NA
wake$StateLicNum <- NA
wake$OriginalCity <- wake$OringinalCity
wake$OringinalCity <- NULL
wake$OriginalAddress1 <- wake$OringalAddress1
wake$OringalAddress1 <- NULL
wake$OriginalAddress2 <- wake$OringalAddress2
wake$OringalAddress2 <- NULL
wake$CompletedDate <- wake$CompleteDate
wake$CompleteDate <- NULL
wake$ContractorZip <- NA

total3 <- smartbind(wake, total2)

#town of cary cleanup
document$PermitClassMapped <- NA


#City and County of Durham (Active Permits)
cod_url <- "https://opendurham.nc.gov/explore/dataset/active-building-permits/download/?format=json&timezone=America/New_York"
doc <- fromJSON(txt=cod_url)
doc$city <- "Durham"
doc$PermitNum <- doc$PERMIT_ID
doc$Description <- doc$P_DESCRIPT
doc$AppliedData <- NULL
doc$IssuedDate <- NULL
doc$CompletedDate <- NULL
doc$StatusCurrent <- doc$P_STATUS
doc$OriginalAddress1 <- doc$SITEADD
doc$OriginalAddress2 <- NULL
doc$OriginalCity <- "Durham"
doc$OriginalState <- "North Carolina"
doc$OriginalZip <- NULL
doc$Jurisdiction <- doc$BUILD_DIST
doc$PermitClass <- NULL
doc$PermitClassMapped <- NULL
doc$StatusCurrentMapped <- "Permit Issued"
doc$WorkClass <- NULL
doc$WorkClassMapped <- NULL
doc$PermitType <- "Building"
doc$PermitTypeMapped <- "Building"
doc$PermitTypeDesc <- NULL
doc$StatusDate <- NULL
doc$TotalSqFt	<- NULL
doc$Link <- "https://opendurham.nc.gov/explore/dataset/active-building-permits/table/"
for (i in 1:length(doc$fields$geo_point_2d)) {
  doc$Latitude[i] <- doc$fields$geo_point_2d[[i]][1]
  doc$Longitude[i] <- doc$fields$geo_point_2d[[i]][2]
}
doc$EstProjectCost <- NULL
doc$HousingUnits <- NULL
doc$ContractorCompanyName	<- NULL
doc$ContractorTrade <- NULL
doc$ContractorTradeMapped <- NULL
doc$ContractorLicNum <- NULL
doc$ContractorStateLic <- NULL
doc$ProposedUse <- NULL
doc$AddedSqFt <- NULL
doc$RemovedSqFt <- NULL
doc$MasterPermitNum <- NULL
doc$ExpiresDate <- NULL
doc$COIssuedDate	<- NULL
doc$HoldDate <- NULL
doc$VoidDate <- NULL
doc$ProjectName <- NULL
doc$ProjectID <- NULL
doc$TotalFinishedSqFt <- NULL
doc$TotalUnfinishedSqFt <- NULL
doc$TotalHeatedSqFt <- NULL
doc$TotalUnHeatedSqFt <- NULL
doc$TotalAccSqFt <- NULL
doc$TotalSprinkledSqFt <- NULL
doc$ExtraFields <- NULL
doc$Publisher <- "County of Durham"
doc$Fee <- NULL
doc$ContractorFullName <- NULL
doc$ContractorCompanyDesc <- NULL
doc$ContractorPhone <- NULL
doc$ContractorAddress1 <- NULL
doc$ContractorAddress2 <- NULL
doc$ContractorCity <- NULL
doc$ContractorState <- NULL
doc$ContractorZip <- NULL
doc$ContractorEmail <- NULL
<<<<<<< HEAD

xtotal2 <- smartbind(total, wake)

SocrataEmail <- Sys.getenv("SOCRATA_EMAIL", "stuart.gano@socrata.com")
socrataPassword <- Sys.getenv("SOCRATA_PASSWORD", "Wakeboard1")
=======
total <- smartbind(total, doc, fill=NA)


SocrataEmail <- Sys.getenv("SOCRATA_EMAIL", "xxx@socrata.com")
socrataPassword <- Sys.getenv("SOCRATA_PASSWORD", "xxxx")
>>>>>>> 0e214469f3a8d9688d7741113f206923e515cebb
datasetToAddToUrl <- "https://opendata.socrata.com/resource/9wjv-w4fx.json"
write.socrata(total,datasetToAddToUrl,"UPSERT",socrataEmail,socrataPassword)


