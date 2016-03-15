install.packages("dplyr")
install.packages("tidyr")

long.DF <- gather(GDP.Growth.Rate.,year,GDPGrowth,X1961:X2015, na.rm = TRUE)
socrataEmail <- Sys.getenv("SOCRATA_EMAIL", "stuart.gano@socrata.com")
socrataPassword <- Sys.getenv("SOCRATA_PASSWORD", "XXXX")

datasetToAddToUrl <- "https://opendata.socrata.com/resource/qvqx-yuvy.json"
write.socrata(long.DF,datasetToAddToUrl,"UPSERT",socrataEmail,socrataPassword
