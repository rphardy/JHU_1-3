### Quiz - Week 4

rm(list=ls())

setwd("C:/Users/Richard/dsprojects/GettingCleaningData")

if(!file.exists("./Week4")){dir.create("./Week4")}
setwd("./Week4")

##q1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile="acs.csv")
acs <- read.csv("acs.csv")

splitNames <- strsplit(names(acs),"wgtp")
splitNames[[123]] #returns [1] ""   "15"

#rm(fileUrl,splitNames,acs)

##q2
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl,destfile="gdp.csv")
gdp <- read.csv("gdp.csv")
gdp <- gdp[5:194,]
names(gdp)[1]="SID"
names(gdp)[2]="Ranking"
names(gdp)[4]="CountryNames"
names(gdp)[5]="grossDomesticProduct(USDm)"
keepvars <- c("SID","Ranking","CountryNames","grossDomesticProduct(USDm)")
gdp <- gdp[keepvars]
gdp$SID <- as.character(gdp$SID)
gdp$Ranking <- as.numeric(as.character((gdp$Ranking)))

#Alternatively, one could play with getting this to work: 
#d <- read.table(file.name, header = T, skip = 5, sep=",", nrows = 190)

gdp$`grossDomesticProduct(USDm)`= gsub(",","",gdp$`grossDomesticProduct(USDm)`)
str(gdp$`grossDomesticProduct(USDm)`)
gdp$`grossDomesticProduct(USDm)` = as.numeric(gdp$`grossDomesticProduct(USDm)`)
str(gdp$`grossDomesticProduct(USDm)`)

print(mean(gdp$`grossDomesticProduct(USDm)`)) #returns 377652.4

##q3
grep("^United",gdp$CountryNames)
#returns [1]  1  6 32

##q4
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl2,destfile="edu.csv")
edu <- read.csv("edu.csv")
names(edu); names(gdp)
merged <- merge(gdp,edu,by.x="SID",by.y="CountryCode") #189 matches.
length(grep("^[Ff]iscal year end: June", merged$Special.Notes)) #returns 13
View(merged[c((grep("^(.*)June", merged$Special.Notes))),]) #Views everything
#where June is mentioned in Special.Notes. 16 matches

##q5
library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
year <- year(sampleTimes)
weekday <- wday(sampleTimes,label=TRUE)
sum(year==2012) #returns 250
sum(year==2012 & weekday=="Mon") #returns 47

#file.remove(c("gdp.csv","edu.csv","acs.csv"))
#rm(fileUrl,keepvars,fileUrl2,edu,gdp,merged)
#rm(list=ls())