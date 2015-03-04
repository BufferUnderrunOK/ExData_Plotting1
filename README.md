## Cleaning Data

To clean the data set, I first replaced all the ? with the string NA.  
For speed's sake, I used perl.

`cp household_power_consumption.txt cleaned_household_power_consumption.txt`  
`perl -pi.bak -e 's/\?/NA/gi;' cleaned_household_power_consumption.txt`  

