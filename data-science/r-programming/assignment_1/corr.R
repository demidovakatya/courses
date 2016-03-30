corr <- function(directory, threshold = 0) {
    wdirectory <- paste("~/Documents/_data-science-specialization/rprog/assignment_1", directory, sep = "/")
    
    setwd(wdirectory)
    correlations <- numeric()
    for (i in list.files(pattern = "*.csv")) {
        currenttable <- read.csv(i)
        a <- currenttable["nitrate"]
        b <- currenttable["sulfate"]
        if (sum(complete.cases(currenttable)) > threshold) {
            correlation <- cor(a, b, use = "pairwise.complete.obs")
            correlations <- append(correlations, round(correlation, 5))
        } 
    }
  
  return(correlations)
}

cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
