setwd("~/Documents/_data-science-specialization/rprog/assignment_3")

rankall <- function(outcome, num = "best") {
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings="Not Available")
    
    outcomes <- c("heart attack","heart failure","pneumonia")
    if (!outcome %in% outcomes) { stop("invalid outcome")}
    states <- unique(data$State)
    
    outcome.column.names.full <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                                   "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", 
                                   "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    outcome.column.name <- outcome.column.names.full[match(outcome,outcomes)]
    
    hospital<-character(0)
    
    for (i in seq_along(states)) {
        ## Return hospital name in that state with the given rank 30-day death rate
        data.state <- data[data$State==states[i],]
        
        # order data by outcome
        data.state.sorted <- data.state[order(as.numeric(data.state[[outcome.column.name]]),
                                              data.state[["Hospital.Name"]],
                                              decreasing=FALSE,
                                              na.last=NA), ]
        
        this.num = num
        if (this.num=="best") this.num = 1
        if (this.num=='worst') this.num = nrow(data.state.sorted)
        
        hospital[i] <- data.state.sorted[this.num,"Hospital.Name"]
    }
    
    ## Return a data frame with the hospital names and the (abbreviated) state name
    data.frame(hospital=hospital,state=states,row.names=states)
}

r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)

r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)

r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)
