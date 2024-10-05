library("derfinder")
library("derfinderData")
library("GenomicRanges")
library("knitr")

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }

 }

run <- function() {}

output <- function(outputfile) {
myregions <- readRDS(paste(pfix, parameters["chr21", 2], sep="/"))
genes <- readRDS(paste(pfix, parameters["genes", 2], sep="/"))
suppressPackageStartupMessages(library("bumphunter"))

#####################################################################################
# MATCH GENES
annoNear <- matchGenes(myregions, genes)
#####################################################################################

write.csv(annoNear, outputfile)
}
