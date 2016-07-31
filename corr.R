corr <- function(directory, threshold=0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  all.files <- list.files(directory, full.names = TRUE)
  df <- vector(mode = "numeric", length = 0)
  
  for (i in 1:length(all.files)) {
    df1 <- read.csv(all.files[i])
    csum <- sum((!is.na(df1$sulfate)) & (!is.na(df1$nitrate)))
    if (csum > threshold) {
      sulf <- df1[which(!is.na(df1$sulfate)), ]
      nit <- sulf[which(!is.na(sulf$nitrate)), ]
      df <- c(df, cor(nit$sulfate, nit$nitrate))
    }
  }
  ## Return a numeric vector of correlations
  df
} 
#####################OUTPUT#########################################
cr <- corr("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata")
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
> cr <- sort(cr)
> set.seed(868)
> out <- round(cr[sample(length(cr), 5)], 4)
> print(out)
[1]  0.2688  0.1127 -0.0085  0.4586  0.0447

cr <- corr("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)
> cr <- sort(cr)
> n <- length(cr)
> set.seed(197)
> out <- c(n, round(cr[sample(n, 5)], 4))
> print(out)
[1] 243.0000   0.2540   0.0504  -0.1462  -0.1680   0.5969

cr <- corr("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", 2000)                
n <- length(cr)                
cr <- corr("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
> cr <- corr("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", 2000)
Warning messages:
  1: In is.na(df1$sulfate) :
  is.na() applied to non-(list or vector) of type 'NULL'
2: In is.na(df1$nitrate) :
  is.na() applied to non-(list or vector) of type 'NULL'
3: In is.na(df1$sulfate) :
  is.na() applied to non-(list or vector) of type 'NULL'
4: In is.na(df1$nitrate) :
  is.na() applied to non-(list or vector) of type 'NULL'
> n <- length(cr)
> cr <- corr("C:/Users/pallavikaran/Downloads/rprog%2Fdata%2Fspecdata/specdata", 1000)
Warning messages:
  1: In is.na(df1$sulfate) :
  is.na() applied to non-(list or vector) of type 'NULL'
2: In is.na(df1$nitrate) :
  is.na() applied to non-(list or vector) of type 'NULL'
3: In is.na(df1$sulfate) :
  is.na() applied to non-(list or vector) of type 'NULL'
4: In is.na(df1$nitrate) :
  is.na() applied to non-(list or vector) of type 'NULL'
> cr <- sort(cr)
> print(c(n, round(cr, 4)))
[1]  0.0000 -0.0190  0.0419  0.1901
