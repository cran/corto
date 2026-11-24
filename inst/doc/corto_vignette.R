## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse=TRUE,
  comment="#"
)

## ----install, eval=FALSE------------------------------------------------------
# install.packages("corto")

## ----load---------------------------------------------------------------------
library(corto)

## ----load1--------------------------------------------------------------------
load(system.file("extdata","inmat.rda",package="corto"))
inmat[1:5,1:5]

## ----load2--------------------------------------------------------------------
dim(inmat)

## ----load3--------------------------------------------------------------------
load(system.file("extdata","centroids.rda",package="corto"))
centroids[15]

## ----load4--------------------------------------------------------------------
length(centroids)

## ----runcorto,message=FALSE,results="hide"------------------------------------
regulon<-corto(inmat,centroids=centroids,nbootstraps=10,p=1e-30,nthreads=2)
# Input Matrix has 87 samples and 7000 features
# Correlation Coefficient Threshold is: 0.889962633618839
# Removed 64 features with zero variance
# Calculating pairwise correlations
# Initial testing of triplets for DPI
# 115 edges passed the initial threshold
# Building DPI network from 30 centroids and 76 targets
# Running 10 bootstraps with 2 thread(s)
# Calculating edge likelihood
# Generating regulon object

## ----prinregulon--------------------------------------------------------------
regulon[1:2]

## ----prinregulon2-------------------------------------------------------------
length(regulon)

## ----prinregulon3-------------------------------------------------------------
names(regulon)

## ----runcnv, eval=FALSE-------------------------------------------------------
# load(system.file("extdata","cnvmat.rda",package="corto",mustWork=TRUE))
# regulon <- corto(inmat,centroids=centroids,nthreads=2,nbootstraps=10,verbose=TRUE,cnvmat=cnvmat,p=0.01)

## ----mra1, eval=FALSE---------------------------------------------------------
# predicted<-mra(inmat,regulon=regulon)
# predicted$nes[1:5,1:5]

## ----mra2, eval=FALSE---------------------------------------------------------
# bap1<-inmat["BAP1",]
# bap1low<-inmat[,bap1<median(bap1)]
# bap1high<-inmat[,bap1>=median(bap1)]
# predicted<-mra(bap1low,bap1high,regulon=regulon)

## ----mra3, eval=FALSE---------------------------------------------------------
# signature<-(rowMeans(bap1low)-rowMeans(bap1high))/
#   sqrt(apply(bap1low,1,var)/ncol(bap1low)+apply(bap1high,1,var)/ncol(bap1high))
# predicted<-mra(signature,regulon=regulon)

## ----mraplot, eval=FALSE------------------------------------------------------
# mraplot(predicted)

