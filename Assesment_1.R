#Q1 
# Read the London Crime data into a data frame called london_crime

# Reading csv file 
london_crime <- read.csv("london-crime-data.csv", na = "")

# Show the structure of the London Crime data set
str(london_crime)

# Using the paste() function, amalgamate the month and year variables into a new variable
#called Date

london_crime$Date <- paste(london_crime$year,london_crime$month, sep="/",
                        collapse = NULL, recycle0 = FALSE )
 

#Q2
#convert the variable name

names(london_crime)
names(london_crime)[2]  <- "Borough"
names(london_crime)[3]  <- "MajorCategory"
names(london_crime)[4]  <- "SubCategory"
names(london_crime)[5]  <- "Value"
names(london_crime)[8]  <- "CrimeDate"

names(london_crime)
str(london_crime)
include_list <- names(london_crime) %in% c("Borough", "MajorCategory","SubCategory",
                                           "Value","CrimeDate")
include_list
london_crime_new <- london_crime[(include_list)]
str(london_crime_new)

#Q3
#Convert the CrimeDate variable so that it is a variable of type Date. Confirm that the
#variable has been changed to the required variable type by showing the structure and
#content of the date variable

london_crime_new$CrimeDate <- as.Date(london_crime_new$CrimeDate, "%m/%d/%Y")
str(london_crime_new)

#Q4
#Plot a chart to show the summary of the borough information from the data frame so
#that we can view where most crimes occur. Using the summary() function, display this
#data in a chart with suitable chart title and x and y axis subtitles. Then answer the
#following:
  #• Add a comment in your code to show which borough has the highest level of
#crime.
#• And add a comment in your code to indicate which area has the lowest level of
#crime.

# install Package
install.packages("mice")
library(mice)
# Using mice
md.pattern(london_crime_new) 

install.packages("VIM")
library(VIM)


#Plot a chart to show the summary of the borough information from the data frame so
#that we can view where most crimes occur

attach(london_crime_new)
london_crime_new <- london_crime_new[order(value)]
london_crime_new <- london_crime_new[order(MajorCategory),]
sorted_data <- subset(london_crime_new, select = c(value,MajorCategory))
head(sorted_data, 15)
detach(london_crime_new)

#10
# Using the write.csv() 
write.csv(london-crime-data,file = "london-crime-modified.csv. ")



