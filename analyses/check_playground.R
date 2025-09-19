## Started 11 August 2025
## By Ken

## Check playground changes

rm(list = ls())
options(stringsAsFactors = FALSE)

# Set your working directory
if(length(grep("lizzie", getwd()) > 0)) { 
  setwd("~/Documents/git/projects/sandbox/analyses")
  par(family="serif")
} else if(length(grep("Ken", getwd()) > 0)){
  setwd("/Users/Ken Michiko Samson/Documents/Temporal Ecology Lab/sandbox/analyses")
} 

# read playground log
commit_log <- readLines('output/checking/playground_log.txt')

# make new script to show commit changes
script <- c()

script[1] <- paste0('git show ', paste(strsplit(commit_log[1], '')[[1]][8:14], collapse = ''),
                    ' | tee analyses/output/checking/playground_3.txt')
script[2] <- paste0('git show ', paste(strsplit(commit_log[7], '')[[1]][8:14], collapse = ''),
                    ' | tee analyses/output/checking/playground_2.txt')
script[3] <- paste0('git show ', paste(strsplit(commit_log[13], '')[[1]][8:14], collapse = ''),
                    ' | tee analyses/output/checking/playground_1.txt')

writeLines(script, 'output/checking/check_playground.sh')

# make list of all files in local master branch
files <- list.files('..', all.files = FALSE, recursive = TRUE)
writeLines(files, 'output/checking/playground_files.txt')