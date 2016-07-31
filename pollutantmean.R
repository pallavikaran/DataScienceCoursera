pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
 all.files <- list.files(directory, full.names = TRUE)
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  df <- data.frame()
  for (i in id) {
    df <- rbind(df, read.csv(all.files[i]))
  }
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  mean(df[, pollutant], na.rm = TRUE)
}
#####################OUTPUT#########################################
pollutantmean("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", "sulfate", 1:10)
pollutantmean("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", "sulfate", 34)
pollutantmean("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", "nitrate", 70:72)
pollutantmean("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", "nitrate")

pollutantmean("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", "sulfate", 34)
[1] 1.477143 
> pollutantmean("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", "sulfate", 1:10)
[1] 4.064128
> pollutantmean("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", "sulfate", 70:72)
[1] 0.9501894
> pollutantmean("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", "nitrate", 70:72)
[1] 1.706047
> pollutantmean("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", "nitrate")
[1] 1.702932

