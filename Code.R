The R code which Rafa runs in this video is available here:


  https://github.com/genomicsclass/labs/blob/master/intro/getting_started.Rmd
  
You can download the individual Rmd scripts from Github by clicking on the filename, and then the 'Raw' button.  Save this file to your computer, and then open it in RStudio.
Running Lab Code
All software used for the class is free and open source:
  R can be downloaded and installed from CRAN (Comprehensive R Archive Network). If possible download the latest release.
We recommend using RStudio, a slick visual interface for R.


First assessment: Exercises

 Bookmark this page 
To download R and R studio, please visit the Course Materials section of the course.

If you have not done so already, download, install and load the swirl package. 


install.packages("swirl")
library(swirl)

Go through the R Programming Basic Building Blocks tutorial and then use the skills you have just learned to answer the following questions. 


Textbook

We will be using the textbook Data Analysis for the Life Science which is freely available here (link to textbook). The book is written in R markdown which includes the R code used for several of the analysis shown in the course. The book includes links to the specific R markdown documents but you can access all of these in this GitHub repository described below. We also provide an html version of the book here.

https://leanpub.com/dataanalysisforthelifesciences


https://rmarkdown.rstudio.com/

https://github.com/genomicsclass/labs

http://genomicsclass.github.io/book/

https://github.com/genomicsclass

https://github.com/genomicsclass/dagdata/tree/master/inst/extdata


library(dplyr)

## Filter and Select

dat <- read.csv("femaleMiceWeights.csv")
dat
View(dat)

controls <- filter (dat, Diet=="chow")

select(dat, Bodyweight)

controls <- select(dat, Bodyweight)

unlist(controls)


controls <- filter(dat, Diet=="chow")%>%select(Bodyweight)%>%unlist

controls 

mean(controls)

treatment <- filter(dat, Diet=="hf")%>% select(Bodyweight)%>%unlist
treatment 

mean(treatment)

mean(treatment)-mean(controls)

population <- read.csv("femaleControlsPopulation.csv")

population <- unlist(population) # to convert data.frame to numeric

sample(population, 12)

mean(sample(population, 12)) # run several times it gives differ means

# observation

obs <- mean(treatment)- mean(controls)

class(population)

# Null Hypothesis, high fiber ,"hf", has not effect. 

control <- sample (population, 12)
treatment <- sample (population, 12) # treatment is not treatment, 
                                      # treatment comes from same population

mean(treatment)-mean(control) # running the 3 commands over and over gives different
                              # differences

# For loops

n <- 1000
nulls <- vector("numeric", n)
for (i in 1:n) {
  control<- sample(population, 12)
  treatment <- sample (population, 12)
  nulls[i]<- mean(treatment)-mean(control)
}

# p value logic

nulls > obs # how many times nulls >obs is TRUE

sum(nulls > obs) # count the TRUES

sum(nulls>obs)/n # proportion of times of the TRUES. THIS IS THE P VALUE, proortion
                # of times nulls is TRUE when null hypothesis is true 

mean(nulls>obs) # the same. THIS IS THE P VALUE, proportion
                  # of times nulls is TRUE when null hypothesis is true

mean (abs(nulls)>obs) # the same , actually better , "two tails".proportion
                     # of times nulls is higher or less than obs 
                      # when null hypothesis is true (that hf has no effect )










max (nulls)

hist(nulls)






