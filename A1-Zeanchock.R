###Assignment 1 - Allison Zeanchock###
##Dataset chosen: Apple Sales 2024
##Question: What factors influence whether a particular product's sales are above or below the median sales in 2024? 
##Target variable: Whether the product's sales are "above" median or "below" median

##Load dataset
getwd() #Gets the current working directory
setwd("/Users/allyzzzen/Data Mining") #Sets the working directory to the folder that contains the dataset
apple24 <- read.csv("apple_sales_2024.csv", stringsAsFactors = FALSE) #Loads the dataset as a data frame

#Explore the data
str(apple24) #Views the structure of the dataset
summary(apple24) #Gets statistical summaries of each column

##Normalizing the data
normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))} #Defines the normalize function

apple24[, 3:7] <- lapply(apple24[, 3:7], normalize) #Applies the normalize function 

##Target variable
apple24$TotalSales <- rowSums(apple24[, c("iPhone.Sales..in.million.units.", 
                                          "iPad.Sales..in.million.units.", 
                                          "Mac.Sales..in.million.units.", 
                                          "Wearables..in.million.units.")]) #Calculates total sales

apple24$SalesAboveMedian <- ifelse(apple24$TotalSales > median(apple24$TotalSales), 1, 0) #Creates binary target var. based on if total sales are above the median

##Spliting the data
part <- sample(2, nrow(apple24), replace=TRUE, prob=c(0.8, 0.2)) #Randomly splits the dataset into two parts with a 80-20 ratio

trainData <- apple24[part==1,] #Training data (80%)
testData <- apple24[part==2,] #Testing data (20%)

##K-NN Model
install.packages ("class")
library(class)
predictions <- knn(train = trainData[, 3:7], test = testData[, 3:7], 
                   cl = trainData$SalesAboveMedian, k = 5) #Predicts on test data with k = 5

install.packages('caret')
library(caret)
cm <- confusionMatrix(predictions, as.factor(testData$SalesAboveMedian)) #Compares predictions with actual values
print(cm)