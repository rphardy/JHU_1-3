#Week 3 - Quiz 1q1
setwd("C:/Users/Richard/dsprojects/GettingCleaningData")
if (!file.exists("./Week3")){dir.create("./Week3")}
setwd("./Week3")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="./acsdata.csv",method ="curl")
dateDownloaded <- date()
acs <- read.csv("acsdata.csv")
library(dplyr)
library(tidyr)

agricultureLogical <- acs$ACR == 3 & acs$AGS == 6
#agricultureLogical <- acs %>% filter(ACR == 3, AGS == 6) - picks all obs.
which(agricultureLogical)[1:3]