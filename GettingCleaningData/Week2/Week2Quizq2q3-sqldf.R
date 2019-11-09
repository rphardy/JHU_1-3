setwd("C:/Users/Richard/dsprojects/GettingCleaningData/Week2")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile="acs.csv")
dateDonloaded <- date()

acs <- read.csv("acs.csv")

install.packages("sqldf")
library(sqldf)
#Question 2 - Which selects probweights for ages less than 50
a<-sqldf("select pwgtp1 from acs where AGEP < 50")
b<-sqldf("select * from acs where AGEP < 50")
c<-sqldf("select * from acs")
d<-sqldf("select pwgtp1 from acs")
#Question 3 - which returns the same data as unique(acs$AGEP)
a<-sqldf("select unique AGEP from acs") #unique not a SQL command
b<-sqldf("select distinct AGEP from acs") #returns df.
c<-sqldf("select AGEP where unique from acs") #unique not a SQL command
d<-sqldf("select distinct pwgtp1 from acs") #wrong field - pwgtp1

file.remove("acs.csv")
