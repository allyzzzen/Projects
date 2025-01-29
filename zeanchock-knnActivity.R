###Allison Zeanchock K-nn Activity###

###1.	Open the Iris data set with “data(Iris).”   
#   You can look at the dataset with summary(), str(), and table().

#Load the Iris dataset
data(iris) 

#Explore the dataset
summary(iris)
str(iris)
table(iris$Species)

###2.	Split the data into 70% training and 30% test data sets.  
#    Remove the factor variable from training and test datasets.

# Split the dataset
part <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))

trainData <- iris[part==1,]
testData <- iris[part==2,]

# Remove the factor variable
trainData1 <- trainData[-5]
testData1 <- testData[-5]

#Define labels
train_labels <- trainData$Species
test_labels <- testData$Species

###3.	Use the class library to run knn. 
install.packages ("class")
library(class)
knn_pred <- knn(train = trainData1, test = testData1, cl = train_labels, k = 21)


###4.	Determine the accuracy for different values for k.  
#   Try to improve the accuracy using different values for k.  
#   Create a ConfusionMatrix for what you believe to be the best value for k in terms of accuracy.   
#   Evaluate the output. What does kappa, the no information rate, sensitivity, and specificity tell you about your model?  
install.packages('caret')
library(caret)

i=1                          # declaration to initiate for loop
k.optm=1                     # declaration to initiate for loop
for (i in 1:28){ 
  knn.mod <-  knn(train=trainData1, test=testData1, cl=train_labels, k=i)
  k.optm[i] <- 100 * sum(test_labels == knn.mod)/NROW(test_labels)
  k=i  
  cat(k,'=',k.optm[i],'\n')       # to print % accuracy 
}

test_pred <- knn(train = trainData1, test = testData1, 
                      cl = train_labels, k=5)

confusionMatrix(test_labels,test_pred)

###5.	Write a conclusion.  What did you do, why did you do it, and what do the results mean?  
#   Is the model a good one?  Why or why not? Support your answer.   
#   Be as complete as possible in your answers. 

##What I did
#I explored the Iris dataset, split it into training and test sets, and used the KNN algorithm with different k values to find the best one. I then analyzed the results with a confusion matrix and various metrics like accuracy, sensitivity, specificity, and Kappa.

##Why I did it
#The KNN algorithm is a common method for classification tasks. By testing different k values, I aimed to find the best balance for accurate predictions. The confusion matrix and metrics helped assess the model's performance and reliability

##What the results mean
#Accuracy: 95.74% shows good overall performance, but other metrics are also important.
#Confidence Interval: (85.46%, 99.48%) suggests the model's accuracy is stable but not perfect.
#No Information Rate: 36.17% is the baseline for comparison, showing the model performs much better than random guessing.
#P-Value: < 2.2e-16 indicates the accuracy is statistically significant and not due to chance.
#Kappa: 0.936 shows almost perfect agreement between the model’s predictions and the true labels.

##Is the model a good one?
#Yes, the KNN model is effective. It has high accuracy, a near-perfect Kappa score, and performs well across all classes, including the minority class. It also has a low error rate, making it a reliable model for classifying Iris flower species