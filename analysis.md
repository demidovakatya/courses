---
title: 'Reproducible Research: Peer Assessment 2'
author: "Katya Demidova"
date: "28 November 2015"
output: html_document
---

## Synopsis

The goal of this project is to analyze how severe weather events affect public health and economy of the United States. Our research addresses two main questions:

1. which types of events are most harmful with respect to population health?

2. which types of events have the greatest economic consequences?

We have found out that tornadoes are significantly more harmful to population health than any other type of events; floods, lightnings, excessive heat and thunderstorm winds cause many injuries and fatalities as well.

Floods, hurricane typhoons, tornadoes, and storm surges cause most property damage (40-140 $ billions). And the most harmful for crops are drought, floods, and ice storms. 
Summing up, tornadoes and floods cause dramatically huge public health and economic problems for communities and municipalities, and preventing such outcomes to the extent possible is a key concern.

## Data

The data for this assignment (comma-separated-value file compressed via the bzip2 algorithm):

* [Storm Data][1] [47Mb]

Documentation of the database:

* National Weather Service [Storm Data Documentation][2]
* National Climatic Data Center Storm Events [FAQ][3]

[1]: https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2
[2]: https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf
[3]: https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2FNCDC%20Storm%20Events-FAQ%20Page.pdf

The events in the database start in the year 1950 and end in November 2011. In the earlier years of the database there are generally fewer events recorded, most likely due to a lack of good records. More recent years should be considered more complete.

## Setting up


```r
echo = TRUE # to ensure that all code will be shown

options(scipen = 1)

library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
## 
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library(tidyr)
library(ggplot2)
```

```
## Need help? Try the ggplot2 mailing list: http://groups.google.com/group/ggplot2.
```

```r
library(data.table)
```

```
## data.table 1.9.6  For help type ?data.table or https://github.com/Rdatatable/data.table/wiki
## The fastest way to learn (by data.table authors): https://www.datacamp.com/courses/data-analysis-the-data-table-way
## 
## Attaching package: 'data.table'
## 
## The following objects are masked from 'package:dplyr':
## 
##     between, last
```

```r
library(R.utils)
```

```
## Loading required package: R.oo
## Loading required package: R.methodsS3
## R.methodsS3 v1.7.0 (2015-02-19) successfully loaded. See ?R.methodsS3 for help.
## R.oo v1.19.0 (2015-02-27) successfully loaded. See ?R.oo for help.
## 
## Attaching package: 'R.oo'
## 
## The following objects are masked from 'package:methods':
## 
##     getClasses, getMethods
## 
## The following objects are masked from 'package:base':
## 
##     attach, detach, gc, load, save
## 
## R.utils v2.1.0 (2015-05-27) successfully loaded. See ?R.utils for help.
## 
## Attaching package: 'R.utils'
## 
## The following object is masked from 'package:tidyr':
## 
##     extract
## 
## The following object is masked from 'package:utils':
## 
##     timestamp
## 
## The following objects are masked from 'package:base':
## 
##     cat, commandArgs, getOption, inherits, isOpen, parse, warnings
```

```r
library(knitr)
```

## Import the data

The CSV file is very large (561.6 MB), so to load the data for the first time we use `fread()` method. In R Documentation `fread {data.table}` is described as similar to `read.table` but faster and more convenient.

After reading in the original CSV file, we save the dataset as an RDS file so we could restore the dataset via `readRDS()`. `readRDS()` is considered faster than other `read` methods.

The following chunk of code checks if there is an RDS file (if there isn't, it creates it (from the CSV file which is created by unpacking the BZ2 package)) and loads the data into workspace.


```r
# Download and import the data

if (!file.exists("StormData.rds")) {
  # If we don't have the csv, we need to unpack the .bz2 file
  if (!file.exists("StormData.csv")) {
    # If we don't have the .bz2 file, we need to download it
    if (!file.exists("StormData.csv.bz2")) {
      download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2",
                    "StormData.csv.bz2")
    }
    bunzip2("StormData.csv.bz2")
  }
  raw.storm <- fread("StormData.csv", na.strings = c("NA", ""))
  saveRDS(storm, "StormData.rds")
  file.remove("StormData.csv")
}

# Load the data into workspace unless we it already exists
if (!exists("raw.storm")) {
  raw.storm <- readRDS("StormData.rds")
}

#============================================================== Create a subset ???????
```

## Data Processing

Quick overview of the internal structure of the dataset and its first three rows:


```r
str(raw.storm)
```

```
## Classes 'data.table' and 'data.frame':	902297 obs. of  37 variables:
##  $ STATE__   : num  1 1 1 1 1 1 1 1 1 1 ...
##  $ BGN_DATE  : chr  "4/18/1950 0:00:00" "4/18/1950 0:00:00" "2/20/1951 0:00:00" "6/8/1951 0:00:00" ...
##  $ BGN_TIME  : chr  "0130" "0145" "1600" "0900" ...
##  $ TIME_ZONE : chr  "CST" "CST" "CST" "CST" ...
##  $ COUNTY    : num  97 3 57 89 43 77 9 123 125 57 ...
##  $ COUNTYNAME: chr  "MOBILE" "BALDWIN" "FAYETTE" "MADISON" ...
##  $ STATE     : chr  "AL" "AL" "AL" "AL" ...
##  $ EVTYPE    : chr  "TORNADO" "TORNADO" "TORNADO" "TORNADO" ...
##  $ BGN_RANGE : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ BGN_AZI   : chr  NA NA NA NA ...
##  $ BGN_LOCATI: chr  NA NA NA NA ...
##  $ END_DATE  : chr  NA NA NA NA ...
##  $ END_TIME  : chr  NA NA NA NA ...
##  $ COUNTY_END: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ COUNTYENDN: logi  NA NA NA NA NA NA ...
##  $ END_RANGE : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ END_AZI   : chr  NA NA NA NA ...
##  $ END_LOCATI: chr  NA NA NA NA ...
##  $ LENGTH    : num  14 2 0.1 0 0 1.5 1.5 0 3.3 2.3 ...
##  $ WIDTH     : num  100 150 123 100 150 177 33 33 100 100 ...
##  $ F         : chr  "3" "2" "2" "2" ...
##  $ MAG       : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ FATALITIES: num  0 0 0 0 0 0 0 0 1 0 ...
##  $ INJURIES  : num  15 0 2 2 2 6 1 0 14 0 ...
##  $ PROPDMG   : num  25 2.5 25 2.5 2.5 2.5 2.5 2.5 25 25 ...
##  $ PROPDMGEXP: chr  "K" "K" "K" "K" ...
##  $ CROPDMG   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ CROPDMGEXP: chr  NA NA NA NA ...
##  $ WFO       : chr  NA NA NA NA ...
##  $ STATEOFFIC: chr  NA NA NA NA ...
##  $ ZONENAMES : chr  NA NA NA NA ...
##  $ LATITUDE  : num  3040 3042 3340 3458 3412 ...
##  $ LONGITUDE : num  8812 8755 8742 8626 8642 ...
##  $ LATITUDE_E: num  3051 0 0 0 0 ...
##  $ LONGITUDE_: num  8806 0 0 0 0 ...
##  $ REMARKS   : chr  NA NA NA NA ...
##  $ REFNUM    : num  1 2 3 4 5 6 7 8 9 10 ...
##  - attr(*, ".internal.selfref")=<externalptr>
```

```r
head(raw.storm, n = 3)
```

```
##    STATE__          BGN_DATE BGN_TIME TIME_ZONE COUNTY COUNTYNAME STATE
## 1:       1 4/18/1950 0:00:00     0130       CST     97     MOBILE    AL
## 2:       1 4/18/1950 0:00:00     0145       CST      3    BALDWIN    AL
## 3:       1 2/20/1951 0:00:00     1600       CST     57    FAYETTE    AL
##     EVTYPE BGN_RANGE BGN_AZI BGN_LOCATI END_DATE END_TIME COUNTY_END
## 1: TORNADO         0      NA         NA       NA       NA          0
## 2: TORNADO         0      NA         NA       NA       NA          0
## 3: TORNADO         0      NA         NA       NA       NA          0
##    COUNTYENDN END_RANGE END_AZI END_LOCATI LENGTH WIDTH F MAG FATALITIES
## 1:         NA         0      NA         NA   14.0   100 3   0          0
## 2:         NA         0      NA         NA    2.0   150 2   0          0
## 3:         NA         0      NA         NA    0.1   123 2   0          0
##    INJURIES PROPDMG PROPDMGEXP CROPDMG CROPDMGEXP WFO STATEOFFIC ZONENAMES
## 1:       15    25.0          K       0         NA  NA         NA        NA
## 2:        0     2.5          K       0         NA  NA         NA        NA
## 3:        2    25.0          K       0         NA  NA         NA        NA
##    LATITUDE LONGITUDE LATITUDE_E LONGITUDE_ REMARKS REFNUM
## 1:     3040      8812       3051       8806      NA      1
## 2:     3042      8755          0          0      NA      2
## 3:     3340      8742          0          0      NA      3
```

There are 37 columns and 902297 rows in this dataset.


```r
dim(raw.storm)
```

```
## [1] 902297     37
```

```r
names(raw.storm)
```

```
##  [1] "STATE__"    "BGN_DATE"   "BGN_TIME"   "TIME_ZONE"  "COUNTY"    
##  [6] "COUNTYNAME" "STATE"      "EVTYPE"     "BGN_RANGE"  "BGN_AZI"   
## [11] "BGN_LOCATI" "END_DATE"   "END_TIME"   "COUNTY_END" "COUNTYENDN"
## [16] "END_RANGE"  "END_AZI"    "END_LOCATI" "LENGTH"     "WIDTH"     
## [21] "F"          "MAG"        "FATALITIES" "INJURIES"   "PROPDMG"   
## [26] "PROPDMGEXP" "CROPDMG"    "CROPDMGEXP" "WFO"        "STATEOFFIC"
## [31] "ZONENAMES"  "LATITUDE"   "LONGITUDE"  "LATITUDE_E" "LONGITUDE_"
## [36] "REMARKS"    "REFNUM"
```

Since these column names are not obvious, I've made an attempt to explain these variables. You can see the results in [this table](https://github.com/demidovakatya/repdata-peer-assessment-2/blob/master/variable_explanation.md).

These variables may be useful for further analysis:

Variable name | Class | Explanation
--------------|-------|------------
BGN_DATE | chr | Date when the event began
STATE | chr | State where the event happened
EVTYPE | chr | Event type
FATALITIES | num | Number of fatalities caused by the event
INJURIES | num | Number of injuries caused by the event
PROPDMG | num | Property damage caused by the event
PROPDMGEXP | chr | Property damage multiplier
CROPDMG | num | Crops damage caused by the event
CROPDMGEXP | chr | Crops damage multiplier

Create a new dataset from these columns:


```r
storm <- raw.storm %>% 
  select(one_of(c("BGN_DATE", "STATE", "EVTYPE", "FATALITIES", "INJURIES", "PROPDMG", "CROPDMG", "PROPDMGEXP", "CROPDMGEXP")))

colnames(storm) <- tolower(colnames(storm))
```

Convert multipliers in `propdmgexp` and `cropdmgexp` columns into numeric values:


```r
# A helper function is needed here
storm$propdmgexp <- toupper(storm$propdmgexp)
storm$propdmgexp[storm$propdmgexp=="B"] <- 9
storm$propdmgexp[storm$propdmgexp=="M"] <- 6
storm$propdmgexp[storm$propdmgexp=="K"] <- 3
storm$propdmgexp[storm$propdmgexp=="H"] <- 2
storm$propdmgexp[storm$propdmgexp=="?" | storm$propdmgexp=="+" | storm$propdmgexp=="-"] <- 0
storm$propdmgexp[is.na(storm$propdmgexp)] <- 0
storm$propdmgexp <- as.numeric(storm$propdmgexp)
storm$cropdmgexp <- toupper(storm$cropdmgexp)
storm$cropdmgexp[storm$cropdmgexp=="B"] <- 9
storm$cropdmgexp[storm$cropdmgexp=="M"] <- 6
storm$cropdmgexp[storm$cropdmgexp=="K"] <- 3
storm$cropdmgexp[storm$cropdmgexp=="H"] <- 2
storm$cropdmgexp[storm$cropdmgexp=="?" | storm$cropdmgexp=="+" | storm$cropdmgexp=="-"] <- 0
storm$cropdmgexp[is.na(storm$cropdmgexp)] <- 0
storm$cropdmgexp <- as.numeric(storm$cropdmgexp)
```

Apply the multipliers:


```r
storm <- storm %>% mutate(propdmg=propdmg * 10 ^ propdmgexp)
storm <- storm %>% mutate(cropdmg=cropdmg * 10 ^ cropdmgexp)

# Remove ~dmgexp columns
storm <- storm %>% select(-ends_with("dmgexp"))
```

Convert `state` into factor variable:


```r
storm$state <- as.factor(storm$state)
```

Convert dates:

```r
storm$bgn_date <- as.Date(storm$bgn_date, format = "%m/%d/%Y %H:%M:%S")
```

The last thing is to tidy up the `evtype` column. Let's save it to a separate variable and then have a look at it:

```r
head(data.frame(table(storm$evtype)), n=20)
```

```
##                      Var1 Freq
## 1      HIGH SURF ADVISORY    1
## 2           COASTAL FLOOD    1
## 3             FLASH FLOOD    1
## 4               LIGHTNING    1
## 5               TSTM WIND    4
## 6         TSTM WIND (G45)    1
## 7              WATERSPOUT    1
## 8                    WIND    1
## 9                       ?    1
## 10        ABNORMAL WARMTH    4
## 11         ABNORMALLY DRY    2
## 12         ABNORMALLY WET    1
## 13   ACCUMULATED SNOWFALL    4
## 14    AGRICULTURAL FREEZE    6
## 15          APACHE COUNTY    1
## 16 ASTRONOMICAL HIGH TIDE  103
## 17  ASTRONOMICAL LOW TIDE  174
## 18               AVALANCE    1
## 19              AVALANCHE  386
## 20           BEACH EROSIN    1
```

We can see similar values, for example:
- "Freezing rain"
- "Freezing Rain"
- "FREEZING RAIN"
- "FREEZING RAIN AND SLEET"

or:
- "HIGH WIND/SEAS"
- "HIGH WIND/WIND CHILL"
- "HIGH WIND/WIND CHILL/BLIZZARD" 
- "HIGH WINDS"
- "HIGH WINDS 55"
- "HIGH WINDS 57"
- "HIGH WINDS 58"
- "HIGH WINDS 63"
- "HIGH WINDS 66"                 
- "HIGH WINDS 67".

From my point of view, these values may be considered equal. So, I'll convert all values in `evtype` column to uppercase strings, trim them, and delete punctuation and digits.


```r
storm$evtype <- toupper(storm$evtype)
storm$evtype <- gsub("[[:digit:]]+", "", storm$evtype)
storm$evtype <- gsub("&", " AND ", storm$evtype)
storm$evtype <- gsub("[[:punct:]]+", " ", storm$evtype)
storm$evtype <- gsub("^\\s+|\\s+$|\\s\\s+", "", storm$evtype)

storm$evtype <- as.factor(storm$evtype)
```

Now we still have things like `AVALANCHE` and `AVALANCE`, but we can consider them insignificant.

## Results

There are two questions to be answered in the assignment:

1. Across the United States, which types of events are most harmful with respect to population health?
2. Across the United States, which types of events have the greatest economic consequences?

To begin with, I'll create a table containing data summarized by event type:


```r
event.types <- storm %>% group_by(evtype) %>% 
  summarise(fatalities = sum(fatalities), injuries = sum(injuries),
            propdmg = sum(propdmg), cropdmg = sum(cropdmg))

kable(head(event.types, n = 10))
```



|evtype                    | fatalities| injuries|     propdmg|    cropdmg|
|:-------------------------|----------:|--------:|-----------:|----------:|
|TORNADO                   |       5633|    91346| 56947380676|  414953270|
|TSTM WIND                 |        504|     6957|  4493127495|  554007350|
|HAIL                      |         15|     1361| 15735819513| 3026044473|
|FREEZING RAIN             |          7|       23|     8146500|          0|
|SNOW                      |          5|       31|    14827550|      10000|
|ICE STORM FLASH FLOOD     |          0|        2|           0|          0|
|SNOW ICE                  |          0|        0|       30000|          0|
|WINTER STORM              |        206|     1321|  6688497251|   26944000|
|HURRICANE OPAL HIGH WINDS |          2|        0|   100000000|   10000000|
|THUNDERSTORM WINDS        |         64|      909|  1944695859|  190654788|

### Events causing most fatalities:

```r
fatality.events <- storm %>% group_by(evtype) %>% 
  summarise(fatalities=sum(fatalities)) %>% 
  top_n(20, wt = fatalities) %>% 
  arrange(desc(fatalities))

kable(fatality.events)
```



|evtype                  | fatalities|
|:-----------------------|----------:|
|TORNADO                 |       5633|
|EXCESSIVE HEAT          |       1903|
|FLASH FLOOD             |        978|
|HEAT                    |        937|
|LIGHTNING               |        817|
|TSTM WIND               |        504|
|FLOOD                   |        470|
|RIP CURRENT             |        368|
|HIGH WIND               |        248|
|AVALANCHE               |        224|
|WINTER STORM            |        206|
|RIP CURRENTS            |        204|
|HEAT WAVE               |        172|
|EXTREME COLD            |        162|
|THUNDERSTORM WIND       |        133|
|HEAVY SNOW              |        127|
|EXTREME COLD WIND CHILL |        125|
|HIGH SURF               |        104|
|STRONG WIND             |        103|
|BLIZZARD                |        101|

```r
qplot(evtype, fatalities, data=fatality.events, geom="bar", stat="identity", xlab="Event type", main="20 events causing most fatalities", fill=fatalities) + scale_fill_continuous(low="red", high="black") + theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position="none")
```

![plot of chunk unnamed-chunk-13](figure/unnamed-chunk-13-1.png) 

### Events causing most injuries:

```r
injury.events <- storm %>% group_by(evtype) %>% 
  summarise(injuries=sum(injuries)) %>% 
  top_n(20, wt = injuries) %>% 
  arrange(desc(injuries))

kable(injury.events)
```



|evtype             | injuries|
|:------------------|--------:|
|TORNADO            |    91346|
|TSTM WIND          |     6957|
|FLOOD              |     6789|
|EXCESSIVE HEAT     |     6525|
|LIGHTNING          |     5230|
|HEAT               |     2100|
|ICE STORM          |     1975|
|FLASH FLOOD        |     1777|
|THUNDERSTORM WIND  |     1488|
|HAIL               |     1361|
|WINTER STORM       |     1321|
|HURRICANE TYPHOON  |     1275|
|HIGH WIND          |     1138|
|HEAVY SNOW         |     1021|
|WILDFIRE           |      911|
|THUNDERSTORM WINDS |      909|
|BLIZZARD           |      805|
|FOG                |      734|
|WILD FOREST FIRE   |      545|
|DUST STORM         |      440|

```r
qplot(evtype, injuries, data=injury.events, geom="bar", stat="identity", xlab="Event type", main="20 events causing most injuries", fill=injuries) + scale_fill_continuous(low="white", high="darkblue") + theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position="none")
```

![plot of chunk unnamed-chunk-14](figure/unnamed-chunk-14-1.png) 

### Events causing most property damage:

```r
property.damage.events <- storm %>% group_by(evtype) %>%
  summarise(property.damage=sum(propdmg)) %>% 
  top_n(20, wt = property.damage) %>% 
  arrange(desc(property.damage))

kable(property.damage.events)
```



|evtype                    | property.damage|
|:-------------------------|---------------:|
|FLOOD                     |    144657709807|
|HURRICANE TYPHOON         |     69305840000|
|TORNADO                   |     56947380676|
|STORM SURGE               |     43323536000|
|FLASH FLOOD               |     16823223978|
|HAIL                      |     15735819513|
|HURRICANE                 |     11868319010|
|TROPICAL STORM            |      7703890550|
|WINTER STORM              |      6688497251|
|HIGH WIND                 |      5270056295|
|RIVER FLOOD               |      5118945500|
|WILDFIRE                  |      4765114000|
|STORM SURGE TIDE          |      4641188000|
|TSTM WIND                 |      4493127495|
|ICE STORM                 |      3944927860|
|THUNDERSTORM WIND         |      3483122472|
|HURRICANE OPAL            |      3172846000|
|WILD FOREST FIRE          |      3001829500|
|HEAVY RAIN SEVERE WEATHER |      2500000000|
|THUNDERSTORM WINDS        |      1944695859|

```r
qplot(evtype, property.damage/10^9, data=property.damage.events, geom="bar", stat="identity", xlab="Event type", ylab="Property damage cost ($ billions)", main="20 events causing most property damage", fill=property.damage) + scale_fill_continuous(low="green", high="black") + theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position="none")
```

![plot of chunk unnamed-chunk-15](figure/unnamed-chunk-15-1.png) 

### Events causing most crop damage:

```r
crop.damage.events <- storm %>% group_by(evtype) %>% 
  summarise(crop.damage=sum(cropdmg)) %>% 
  top_n(20, wt = crop.damage) %>% 
  arrange(desc(crop.damage))

kable(crop.damage.events)
```



|evtype            | crop.damage|
|:-----------------|-----------:|
|DROUGHT           | 13972566000|
|FLOOD             |  5661968450|
|RIVER FLOOD       |  5029459000|
|ICE STORM         |  5022113500|
|HAIL              |  3026044473|
|HURRICANE         |  2741910000|
|HURRICANE TYPHOON |  2607872800|
|FLASH FLOOD       |  1421317100|
|EXTREME COLD      |  1312973000|
|FROST FREEZE      |  1094186000|
|HEAVY RAIN        |   733399800|
|TROPICAL STORM    |   678346000|
|HIGH WIND         |   638571300|
|TSTM WIND         |   554007350|
|EXCESSIVE HEAT    |   492402000|
|FREEZE            |   456725000|
|TORNADO           |   414953270|
|THUNDERSTORM WIND |   414846050|
|HEAT              |   401461500|
|DAMAGING FREEZE   |   296230000|

```r
qplot(evtype, crop.damage/10^9, data=crop.damage.events, geom="bar", stat="identity", xlab="Event type", ylab = "Crop damage cost ($ billions)", main="20 events causing most crop damage", fill=crop.damage) + scale_fill_continuous(low="yellow", high="black") + theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position="none")
```

![plot of chunk unnamed-chunk-16](figure/unnamed-chunk-16-1.png) 
