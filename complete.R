complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  all.files <- list.files(directory, full.names = TRUE)
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  df <- data.frame()
  
  for (i in id) {
    df1 <- read.csv(all.files[i])
    nobs <- sum(complete.cases(df1))
    tmp <- data.frame(i, nobs)
    df <- rbind(df, tmp)
  }
  
  colnames(df) <- c("id", "nobs")
  df
}
#####################OUTPUT#########################################
cc <- complete("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", 54)
print(cc$nobs)

set.seed(42)
cc <- complete("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])


> cc <- complete("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", c(6, 10, 20, 34, 100, 200, 310))
> print(cc$nobs)
[1] 228 148 124 165 104 460 232
> cc <- complete("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", 54)
> print(cc$nobs)
[1] 219
> set.seed(42)
> cc <- complete("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", 332:1)
> use <- sample(332, 10)
> print(cc[use, "nobs"])
[1] 711 135  74 445 178  73  49   0 687 237