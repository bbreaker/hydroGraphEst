getBasinPts <- function(site, basin) {
  
  basin <- sp::spTransform(basin, sp::CRS("+init=epsg:4326"))
  
  drnArea <- (rgeos::gArea(basin)/1e6) * 0.3861
  
  basin <- sp::spTransform(basin, sp::CRS("+proj=longlat +datum=NAD83"))
  
  if (drnArea <= 5) {
    
    crds <- rgeos::gCentroid(basin)@coords
    
  }
  
  else if (drnArea > 5 & drnArea <= 50) {
    
    
    
  }
  
}