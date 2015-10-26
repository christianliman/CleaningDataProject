# Getting and Cleaning Data (October 2015) Project Introduction

This is a repository created for the Getting and Cleaning Data course project from an online course that I took at Coursera.

This repo contains the raw data used for the analysis, the ```run_analysis.R``` script used to tidy up the data, and the cleaned data.

The R script provided does the following:
* Loading the relevant raw data into the R environment
* Merging the training and the test data sets into a single data set
* Extracting only a desired type of measurements (in particular, a variable that is obtained by calculating the mean and the standard deviation)
* Labeling the data sets accordingly
* Calculating the average of each variables according to their activities or subjects.
* Printing the output into a new text file