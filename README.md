# Getting and Cleaning Data (October 2015) Project Introduction

This is a repository created for the Getting and Cleaning Data course project from an online course that I took at Coursera.

This repo contains the raw data used for the analysis, the ```run_analysis.R``` script used to tidy up the data, and the cleaned data.

The R script provided does the following:
1. Loading the relevant raw data into the R environment
2. Merging the training and the test data sets into a single data set
3. Extract only a desired type of measurements (in particular, a variable that is obtained by calculating the mean and the standard deviation)
4. Labeling the data sets accordingly
5. Calculating the average of each variables according to their activities or subjects.
6. Printing the output into a new text file