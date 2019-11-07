#Getting and Cleaning Data - Week 1 Quiz

setwd("C:/Users/Richard/dsprojects/GettingCleaningData")
if (!file.exists("Week1")){
  dir.create("Week1")
}
setwd("./Week1")

#Question  1
q1Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(q1Url,destfile="communities.csv",method="curl")
dateDownloaded <- date()
comsdata <- read.csv("communities.csv")
library(plyr)

count(comsdata, 'VAL') #gives same answer. 53.
rm(list=c("comsdata"))
file.remove("communities.csv")

#Question 3
library(xlsx)
q3Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(q3Url, destfile="q3.xlsx",method="curl")
dateDownloaded <- date()
dat <- read.xlsx("q3.xlsx",sheetIndex=1,header=TRUE,  rowIndex=18:23,
                       colIndex=7:15)
sum(dat$Zip*dat$Ext,na.rm=T)
file.remove("q3.xlsx")
rm(dat)

#Question 4
library(XML)
q4Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(q4Url, destfile="q4.xml", method="curl")
dateDownloaded <- date()
doc <- xmlTreeParse("q4.xml", useInternal=TRUE)
rootNode <- xmlRoot(doc)
zips<-xpathSApply(rootNode,"//zipcode", xmlValue)
zips <- as.numeric(zips)
count(zips==21231)
file.remove("q4.xml")
rm(list=c("doc","rootNode","zips"))

#Question 5
library(data.table)
q5Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(q5Url, destfile="Idaho.csv", method="curl")
dateDownloaded <- date()
DT <- fread(file="Idaho.csv")
DT[,mean(pwgtp15),by=SEX]
rm(DT)
file.remove("Idaho.csv")