getClimDat <- function (siteID, lat, long, minDate, maxDate, keepFile = FALSE) {
  
  if (as.numeric(format(minDate, "%Y") < 1980))
    stop("Data not avaliable prior to 1980")
  
  yrRng <- paste(seq(as.numeric(stringr::str_sub(maxDate, 1, 4)), 
                     as.numeric(stringr::str_sub(minDate, 1, 4)), collapse = ","))
                 
  dload <- sprintf("https://daymet.ornl.gov/data/send/saveData?lat=%s&lon=%s&measuredParams=tmax,tmin,dayl,prcp,srad,swe,vp&year=%s", 
                         lat, long, yrRng)
  
  x <- try(RCurl::getURL(dload, ssl.verifypeer = FALSE))
  
  if (!inherits(x, "try-error")) {
    dat <- readr::read_csv(textConnection(x), skip = 7)
    names(dat) <- c("year", "julian", "dayl", "prcp", "srad", 
                    "swe", "tmax", "tmin", "vp")
    if (!is.null(siteID)) 
      dat <- data.frame(siteID = siteID, dat)
  }
  else {
    stop("There was an error downloading this file")
  }
  if (keepFile == TRUE) {
    if (is.null(siteID)) 
      siteID <- paste(paste("lat", lat, sep = "."), paste("long", 
                                                       long, sep = "."), sep = ".")
    readr::write.csv(dat, paste(siteID, "_", yrRng[1], "_", yrRng[length(yrRng)], ".csv"))
  }
  return(dat)
}
