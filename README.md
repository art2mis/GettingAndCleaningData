---
title: "README.md"
author: "Diana Duncan"
date: "August 23, 2015"
output: html_document
---

README - Subject/Activity means of collected means and standard deviations
===================================================================================

  Original data here: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
  Description of original data sets: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The methodology for obtaining the "tidy" dataset was as follows:

- The training and test sets were appended together into a single data frame
- The activities and subjects were included as columns in the data.frame.  
- The column names were gleaned from the features.txt file, with substitutions make for readability.  
    - I did not understand the "angle" features well enough to make meaningful substitutions, so left them as-is so as not to introduce error on my part.

- The columns containing the "mean" or "std" were selected from the data set
- The data was grouped by Subject and Activity, and each column was averaged within that group

There is a single R script, run_analysis.R.  It must have the unzipped data files in the working directory.

TODO: Have the script download and unzip the file

It creates a meansAndStds data frame and a subjectActivityAvgs data frame, and writes the subjectActivityAvgs to a file

