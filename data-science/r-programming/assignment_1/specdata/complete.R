complete <- function(directory, id = 1:332) {
  setwd(directory)
  filenames <- unlist(list.files())[id]
  nobs <- numeric()
  for (name in filenames) {
    nobs <- append(nobs, sum(complete.cases(read.csv(name))))
  }
  data.frame(id, nobs) 
}
