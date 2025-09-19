## Started 11 August 2025
## By Ken

## Check master changes

rm(list = ls())
options(stringsAsFactors = FALSE)

# Set your working directory
if(length(grep("lizzie", getwd()) > 0)) { 
  setwd("~/Documents/git/projects/sandbox/analyses")
  par(family="serif")
} else if(length(grep("Ken", getwd()) > 0)){
  setwd("/Users/Ken Michiko Samson/Documents/Temporal Ecology Lab/sandbox/analyses")
} 

# read master log
commit_log <- readLines('output/checking/master_log.txt')

# make new script to show commit changes
script <- c()

script[1] <- paste0('git show ', paste(strsplit(commit_log[1], '')[[1]][8:14], collapse = ''),
                    ' | tee analyses/output/checking/master_4.txt')
script[2] <- paste0('git show ', paste(strsplit(commit_log[2], '')[[1]][8:14], collapse = ''),
                    ' | tee analyses/output/checking/master_3.txt')
script[3] <- paste0('git show ', paste(strsplit(commit_log[2], '')[[1]][16:22], collapse = ''),
                    ' | tee analyses/output/checking/master_2.txt')
script[4] <- paste0('git show ', paste(strsplit(commit_log[20], '')[[1]][8:14], collapse = ''),
                    ' | tee analyses/output/checking/master_1.txt')

writeLines(script, 'output/checking/check_master.sh')

# make list of all files in local master branch
files <- list.files('..', all.files = FALSE, recursive = TRUE)
writeLines(files, 'output/checking/master_files.txt')
