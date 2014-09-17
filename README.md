Getting and Clearing Data
=====================

The program consists of one script (run_analysis.R) It can be executed in R by placing it into your working directory (or changing working directory to the script location) and running `source('run_analysis.R')`. The script require that you have "dplyr" (see [description](http://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html)) package installed.

CodeBook.md contains brief description of the source and resulting data and which variables columns are used. The names of the variables were kept consistent with original data as they descriptive enough and short (wouldn't be too helpful too use word "frequency" in thirty variable), and to help with any possible validation analysis.

The raw data is taken from from [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The actual download link for the zip archive is https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The script would download and unzip data automatically. Make sure that you have write permissions for the folder containing the script. 

The script will produce a tidy data set - one table with each variable in a separate column and every row containing averaged data for one "subject" (test participant) doing one "activity" (WALKING,
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). 

The resulting data set will be stored as activity_avg.txt and can be read back into R by using the following command (assuming your working directory is the same as file location): `read.table('activity_avg.txt', header=TRUE)`.