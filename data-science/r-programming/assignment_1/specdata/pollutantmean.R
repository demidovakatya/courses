pollutantmean <- function(directory, pollutant, id = 1:332) {
  setwd(directory)
  filenames <- list.files()
  pollutantdata <- do.call("rbind", lapply(filenames[id], read.csv, header = TRUE))
  round(colMeans(pollutantdata[pollutant], na.rm=T), 5)
}