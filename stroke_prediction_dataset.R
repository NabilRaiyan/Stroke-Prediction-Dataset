
# importing the data set
stroke_prediction_dataset <- read.csv("E:/Courses/Data Science Projects/Stroke Prediction Dataset/stroke_prediction_dataset.csv")
stroke_prediction_dataset


# Inspecting the data set

head(stroke_prediction_dataset)
tail(stroke_prediction_dataset)
str(stroke_prediction_dataset)

summary(stroke_prediction_dataset)
colSums(is.na(stroke_prediction_dataset))
names(stroke_prediction_dataset)

is.na(stroke_prediction_dataset)
dim(stroke_prediction_dataset)

# Gender attribute
stroke_prediction_dataset$gender <-  ifelse(stroke_prediction_dataset$gender == "Male", 1, ifelse(stroke_prediction_dataset$gender == "Female", 0, NA))




# Age attribute
age_outliers <- boxplot(stroke_prediction_dataset$age, main = "Boxplot for age attribute", ylab = "Age")$out
cat("Potentials outliers on age attribute are: ", age_outliers, "\n")


# BMI attribute 
avg_glucose_level_outliers <- boxplot(stroke_prediction_dataset$avg_glucose_level, main = "Boxplot for Avg Glucose level attribute", ylab = "Avg Glucose level")$out
cat("Potentials outliers for Avg Glucose level are: ", avg_glucose_level_outliers, "\n")
