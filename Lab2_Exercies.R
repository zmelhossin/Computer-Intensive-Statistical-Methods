#  install the required packages
install.packages("dplyr", dependencies = TRUE)
install.packages("ggplot2", dependencies = TRUE)
install.packages("ggpubr", dependencies = TRUE)
install.packages("gcookbook", dependencies = TRUE)

# load the required packages
library(dplyr)
library(ggplot2)
library(ggpubr)
library(gcookbook)

#Exercises
#First find the formula for the BMI and calculate it for the data set (heightweight)
data(heightweight)
heightweight['heightM'] = heightweight$heightIn / 39.37 # to convert the height from inch to meter.
heightweight['BMI'] = heightweight$weightLb / (heightweight$heightM)^2 # adding BMI column to the dataset >>>> BMI = w / h^2 .

#Draw the ecdf for the BMI 
ggplot(heightweight, aes(x = BMI)) + stat_ecdf()

#According to the following BMI category and the drawn ecdf, can you determine the percentage of people 
#that are Underweight and Overweight. Underweight = < 18.5   Overweight = 25-29.9
sum(heightweight$BMI < 18.5) #Underweight percentages = Zero.
nrow(heightweight[heightweight$BMI >= 25 & heightweight$BMI <= 29.9, ])# Overwight percentages = 1/236
