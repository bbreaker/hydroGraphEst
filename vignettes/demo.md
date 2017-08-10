Using Daymet, Random Forest, and USGS streamflow data for daily hydrograph simulation
================

Overview
--------

The function *getClimDat()* can be used to get daily climate data from [Daymet](https://daymet.ornl.gov/overview.html). Climate variables returned from Daymet include;

| variable         | description                                                         |
|------------------|---------------------------------------------------------------------|
| prcp             | Daily total precipitation in millimeters per day                    |
| srad             | Incident shortwave radiation flux density in watts per square meter |
| swe              | Snow water equivalent in kilograms per square meter                 |
| tmax             | Daily maximum 2-meter air temperature in degrees Celsius            |
| tmin             | Daily minimum 2-meter air temperature in degrees Celsius            |
| vp               | Water vapor pressure in pascals                                     |
| rad (derived)    | Daily total radiation (MJ/m<sup>2</sup>/day)                        |
| harET0 (derived) | Evapotranspiration from the Hargreaves Equation                     |

In order to retrieve climate data for the locations of interest, one or more pairs of lat/long coordinates are needed. For this example, we will use three streamgages on the Buffalo River in AR. Two gages will be used to predict daily streamflow data for one gage and the results will be compared to observed streamflow data. One point will be used to get climate data for the basins, the basin centroid. In larger basins, multiple points may be considered.

``` r
summary(cars)
```

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

Including Plots
---------------

You can also embed plots, for example:

![](demo_files/figure-markdown_github-ascii_identifiers/pressure-1.png)

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
