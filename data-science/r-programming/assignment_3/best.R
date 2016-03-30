# Set working directory
setwd("~/Documents/_data-science-specialization/rprog/assignment_3")


best <- function(state, outcome) {
    # Read outcome data
    test <- read.csv("outcome-of-care-measures.csv", 
                     colClasses = "character", 
                     na.strings="Not Available")
    states <- test$State
    outcomes <- c("heart attack", "heart failure", "pneumonia")
    
    # Check
    if (!(state %in% states)) {stop ("invalid state")}
    if (!(outcome %in% outcomes)) {stop ("invalid outcome")}
    
    # Find
    if (outcome == "heart attack") { x<-11 }
    else if (outcome == "heart failure") { x<-17 }
    else if (outcome == "pneumonia") { x<-23 }
    stateTest <- subset(test, (State==state) & !is.na(test[,x]))
    bestHospital <- stateTest$Hospital.Name[which.min(stateTest[,x])]
    return(bestHospital)
}

best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")
