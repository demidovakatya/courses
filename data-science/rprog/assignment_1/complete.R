complete <- function(directory, id = 1:332) {
    setwd("~/Documents/_data-science-specialization/rprog/assignment_1")
    setwd(directory)
    filenames <- unlist(list.files())[id]
    nobs <- numeric()
    for (name in filenames) {
        nobs <- append(nobs, sum(complete.cases(read.csv(name))))
    }
    data.frame(id, nobs) 
}

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
