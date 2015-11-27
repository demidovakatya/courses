# Reproducible Research Peer Assessment 2

:closed_book: The result is located [here](https://github.com/demidovakatya/repdata-peer-assessment-2/blob/master/analysis.md).

## Introduction

Storms and other severe weather events can cause both public health and economic problems for communities and municipalities. Many severe events can result in fatalities, injuries, and property damage, and preventing such outcomes to the extent possible is a key concern.

This project involves exploring the U.S. National Oceanic and Atmospheric Administration's (NOAA) storm database. This database tracks characteristics of major storms and weather events in the United States, including when and where they occur, as well as estimates of any fatalities, injuries, and property damage.

## Data

The data for this assignment come in the form of a comma-separated-value file compressed via the bzip2 algorithm to reduce its size. You can download the file from the course web site:

- :package: [Storm Data](https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2) [47Mb] There is also some documentation of the database available. Here you will find how some of the variables are constructed/defined.
- :ledger: [National Weather Service Storm Data Documentation](https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf) [PDF]
- :ledger: [National Climatic Data Center Storm Events FAQ](https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2FNCDC%20Storm%20Events-FAQ%20Page.pdf) [PDF]

The events in the database start in the year 1950 and end in November 2011. In the earlier years of the database there are generally fewer events recorded, most likely due to a lack of good records. More recent years should be considered more complete.

## Assignment

The basic goal of this assignment is to explore the NOAA Storm Database and answer some basic questions about severe weather events. You must use the database to answer the questions below and show the code for your entire analysis. Your analysis can consist of tables, figures, or other summaries. You may use any R package you want to support your analysis.

### Questions

Your data analysis must address the following questions:

1. Across the United States, which types of events (as indicated in the `EVTYPE` variable) are most harmful with respect to population health?
2. Across the United States, which types of events have the greatest economic consequences?

Consider writing your report as if it were to be read by a government or municipal manager who might be responsible for preparing for severe weather events and will need to prioritize resources for different types of events. However, there is no need to make any specific recommendations in your report.

### Requirements

For this assignment you will need some specific tools

- RStudio: You will need RStudio to publish your completed analysis document to RPubs. You can also use RStudio to edit/write your analysis.

- knitr: You will need the knitr package in order to compile your R Markdown document and convert it to HTML

### Document Layout

- Language: Your document should be written in English.
- Title: Your document should have a title that **briefly** summarizes your data analysis
- Synopsis: Immediately after the title, there should be a **synopsis** which describes and summarizes your analysis in at **most 10 complete sentences**.
- There should be a section titled **Data Processing** which describes (in words and code) how the data were loaded into R and processed for analysis. In particular, your analysis _must_ start from the raw CSV file containing the data. You cannot do any preprocessing outside the document. If preprocessing is time-consuming you may consider using the `cache = TRUE` option for certain code chunks.
- There should be a section titled **Results** in which your results are presented.
- You may have other sections in your analysis, but Data Processing and Results are **required**.
- The analysis document must have **at least one figure** containing a plot.
- Your analyis must have **no more than three figures**. Figures may have multiple plots in them (i.e. panel plots), but there cannot be more than three figures total.
- You must **show all your code** for the work in your analysis document. This may make the document a bit verbose, but that is okay. In general, you should ensure that `echo = TRUE` for every code chunk (this is the default setting in knitr).

### Publishing Your Analysis

For this assignment you will need to publish your analysis on [RPubs.com](http://rpubs.com/). If you do not already have an account, then you will have to create a new account. After you have completed writing your analysis in RStudio, you can publish it to RPubs by doing the following:

1. In RStudio, make sure your R Markdown document (`.Rmd`) document is loaded in the editor
2. Click the `Knit HTML` button in the doc toolbar to preview your document.
3. In the preview window, click the `Publish` button.

Once your document is published to RPubs, you should get a unique URL to that document. **Make a note of this URL** as you will need it to submit your assignment.

**NOTE**: If you are having trouble connecting with RPubs due to proxy-related or other issues, you can upload your final analysis document file as a PDF to Coursera instead.

### Submitting Your Assignment

In order to submit this assignment, you must copy the RPubs URL for your completed data analysis document in to the peer assessment question.
