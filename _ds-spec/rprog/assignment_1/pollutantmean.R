pollutantmean <- function(directory, pollutant, id = 1:332) {
    setwd("~/Documents/_data-science-specialization/rprog/assignment_1")
    setwd(directory)
    filenames <- list.files()
    pollutantdata <- do.call("rbind", lapply(filenames[id], read.csv, header = TRUE))
    round(colMeans(pollutantdata[pollutant], na.rm=T), 5)
}

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")
