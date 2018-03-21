#setup for median household Income
census <- read.csv("nyc_census.csv")
to.remove <- c("IncomeErr", "IncomePerCap", "IncomePerCapErr", "Poverty", "ChildPoverty", "Native")
`%ni%` <- Negate(`%in%`)
census <- subset(census,select = names(census) %ni% to.remove)
census <- na.omit(census)
#uncomment if you wish to save
#write.csv(census, file = "medianIncome_setup.csv")

#setup for income per capita
census2 <- read.csv("nyc_census.csv")
to.remove <- c("IncomeErr", "Income", "IncomePerCapErr", "Poverty", "ChildPoverty", "Native")
`%ni%` <- Negate(`%in%`)
census2 <- subset(census2,select = names(census2) %ni% to.remove)
census2 <- na.omit(census2)
#uncomment if you wish to save
#write.csv(census2, file = "incomePerCap_setup.csv")






#converts percent race values to "majority race" factor style variable, had a slight negative impact on R^2 in practice
"for (i in 1:nrow(census)){
  #current.row <- census[i,7:11]
  max.value <- max(census[i,7:10])
  census[i,7:10][which(census[i,7:10] < max.value)] <- 0
  census[i,7:10][which(census[i,7:10] == max.value)] <- 1
}

for (i in 1:nrow(census2)){
  max.value <- max(census2[i,7:10])
  census2[i,7:10][which(census2[i,7:10] < max.value)] <- 0
  census2[i,7:1][which(census2[i,7:10] == max.value)] <- 1
}
census[,7:10] <- lapply(census[,7:10], factor)
#ensure two factor levels for each race percentage
lapply(census[,7:10], unique)"
