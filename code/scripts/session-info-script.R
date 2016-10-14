# Get RMarkdown
library(rmarkdown)

#Get TestThat
library(testthat)

# Write the summaries to output file
sink("session-info.txt")
sessionInfo()
sink()