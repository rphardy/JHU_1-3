##Week 3 - Quiz q1
setwd("C:/Users/Richard/dsprojects/GettingCleaningData")
if (!file.exists("./Week3")){dir.create("./Week3")}
setwd("./Week3")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="./acsdata.csv",method ="curl")
dateDownloaded <- date()

acs <- read.csv("acsdata.csv")
keepvars <- c("ACR","AGS")
acsq1 <- acs[keepvars]
library(dplyr)
library(tidyr)
# Create logical vector to look at  households on greater than 10 acres 
# who sold more than $10,000 worth of agriculture products:

agricultureLogical <- acsq1$ACR == 3 & acsq1$AGS == 6
# List in the first 3 observations
which(agricultureLogical)[1:3]

rm(list=ls())
file.remove("acsdata.csv")

##Week 3 Quiz q2
library(jpeg)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl, destfile="q2jpeg.jpg")

jeff <- readJPEG("q2jpeg.jpg",native=TRUE)
quantile(jeff,0.30)
quantile(jeff,0.80)

rm(list=ls())
file.remove("q2jpeg.jpg")

##Week 3 Quiz q3
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl1, destfile="gdp.csv", method="curl")

fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl2, destfile="edu.csv", method ="curl")

gdp <- read.csv("gdp.csv")
edu <- read.csv("edu.csv")

# The following tidies the gdp dataset and
# produces tidy data for the 190 Ranked countries.
gdp <- gdp[5:194,]
names(gdp)[1]="SID"
names(gdp)[2]="Ranking"
names(gdp)[4]="Economy"
names(gdp)[5]="grossDomesticProduct(USDm)"
keepvars <- c("SID","Ranking","Economy","grossDomesticProduct(USDm)")
gdp <- gdp[keepvars]
gdp$SID <- as.character(gdp$SID)
gdp$Ranking <- as.numeric(as.character((gdp$Ranking)))
names(edu); names(gdp)
merged <- merge(gdp,edu,by.x="SID",by.y="CountryCode") #189 matches.

#sort by descending rank: return the 13th Country
merged <- arrange(merged,desc(Ranking))
merged[13,c(1,2,3)]

##Week 3 - Quiz 1q4
library(tidyr)
library(dplyr)
str(merged$Income.Group)
by_IncomeGroup <- group_by(merged,Income.Group)
by_IncomeGroup %>% summarise(mean = mean(Ranking))

##Week 3 - Quiz 1q5
#Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries
#are Lower middle income but among the 38 nations with highest GDP?
merged %>% mutate(quintile = ntile(Ranking, 5)) -> merged_five #dplyr command-ntile
View(merged_five)
merged_five %>% group_by(quintile)
table(merged_five$Income.Group,merged_five$quintile)

rm(list=ls())
file.remove(c("edu.csv","gdp.csv"))
