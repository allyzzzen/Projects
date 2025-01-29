###Classification Activity###
##Allison Zeanchock

#Load the Iris dataset and packages
data(iris)
install.packages("rpart")
install.packages("rpart.plot")

#Explore the dataset
summary(iris)
str(iris)

##1. Split the data with 110 going to training data and the rest going to testing data. Use sample()
# Set a seed for reproducibility
set.seed(123)

# Shuffle the data
shuffled_indices <- sample(1:nrow(iris))
shuffled_data <- iris[shuffled_indices, ]

# Split the data
training_data <- shuffled_data[1:110, ]
testing_data <- shuffled_data[111:nrow(iris), ]

##2. Build the model using rpart
# Load required package
library(rpart)

# Build the decision tree model
model <- rpart(Species ~ ., data = training_data, method = "class")

##3 Plot the tree. Interpret the tree
# Load the rpart.plot package
library(rpart.plot)

# Plot the decision tree
rpart.plot(model, type = 4, extra = 101)

# Interpretation: The root node being “Petal.Length < 2.5” shows a high-confidence prediction with 37/37 points 
#     classified as setosa. If the “Petal.Length >= 2.5” then the tree moves to the split based on “Petal.Width”. 
#     The first split shows  a prediction of “Petal.Width < 1.8” with 33/40 points are classified as versicolor with 
#     the remaining 4 points being classified as virginica. If the “Petal.Width >= 1.8” the prediction with 36/40 points 
#     are classified as virginica. Overall, setosa is easily separated by the first split where versicolor and virginica 
#     are more difficult to distinguish so it requires another split based on petal width.

##4. Create a confusion matrix and interpret it
# Make predictions
predictions <- predict(model, testing_data, type = "class")

# Create a confusion matrix
library(caret)
cm <- confusionMatrix(predictions, as.factor(testing_data$Species))

# Print the confusion matrix
print(cm)

# Interpretation: The model seems to have correctly predicted all instances of setosa as setosa 
#   and all instances of virginica as virginica. The model correctly predicted only 17 instances 
#   of versicolor as versicolor with 1 misclassified instance. This could indicate some overlap in 
#   the feature space between these two classes, but overall, the model did a great job of distinguishing 
#   between the species.

##5. What's your conclusion? 
# Accuracy calculation
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
cat("Accuracy:", accuracy)

# Conclusion: A high accuracy of 97.5% means the model correctly predicted the species for 97.5% of the
#     instances in the testing set. The accuracy suggests that the model only made a few mistakes.


