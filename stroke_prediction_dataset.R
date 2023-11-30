
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

# Finding missing value row of gender 
missing_value_row_gender <- which(is.na(stroke_prediction_dataset$gender))
cat("Row number of missing value in gender is: ", missing_value_row_gender, "\n")

# Recovering missing value of gender column using mode and median
mode_gender <- as.numeric(names(sort(table(stroke_prediction_dataset$gender), decreasing = TRUE)[1]))
stroke_prediction_dataset$gender[is.na(stroke_prediction_dataset$gender)] <- mode_gender

median_gender <- median(stroke_prediction_dataset$gender, na.rm = TRUE)
stroke_prediction_dataset$gender[is.na(stroke_prediction_dataset$gender)] <- median_gender



# Age attribute
age_outliers <- boxplot(stroke_prediction_dataset$age, main = "Boxplot for age attribute", ylab = "Age")$out
cat("Potentials outliers on age attribute are: ", age_outliers, "\n")


# Finding mode and median value of age column
median_age <- median(stroke_prediction_dataset$age, na.rm = TRUE)
mode_age <- as.numeric(names(sort(table(stroke_prediction_dataset$age), decreasing = TRUE)[1]))

#Finding rows of age outliers in age column
age_outliers_rows <- which(stroke_prediction_dataset$age > 100 | stroke_prediction_dataset$age < 0)
cat("Potential rows of age outliers: ", age_outliers_rows, "\n")

# Recovering age outliers with mode and median value
stroke_prediction_dataset$age[c(4988, 5010, 5022, 5027)] <- mode_age
stroke_prediction_dataset$age[c(4988, 5010, 5022, 5027)] <- median_age


# Finding rows of missing values in Age column
missing_value_row_age <- which(is.na(stroke_prediction_dataset$age))
cat("Row number of missing value in age column: ", missing_value_row_age, "\n")

# Recovering missing values of age column using mode and median
stroke_prediction_dataset$age[is.na(stroke_prediction_dataset$age)] <- mode_age
stroke_prediction_dataset$age[is.na(stroke_prediction_dataset$age)] <- medain_age

# Avg Glucose level attribute 
avg_glucose_level_outliers <- boxplot(stroke_prediction_dataset$avg_glucose_level, main = "Boxplot for Avg Glucose level attribute", ylab = "Avg Glucose level")$out
cat("Potentials outliers for Avg Glucose level are: ", avg_glucose_level_outliers, "\n")

# Finding rows of oultliers in avg_glucose_level column
avg_glucose_level_outliers_rows <- which(stroke_prediction_dataset$avg_glucose_level > 115)
cat("Potential rows for outliers in avg glucose level column: ", avg_glucose_level_outliers_rows, "\n")

# Finding mode and median of avg glucose level column
mode_glucose_level <- as.numeric(names(sort(table(stroke_prediction_dataset$avg_glucose_level), decreasing = TRUE)[1]))
median_glucose_level <- median(stroke_prediction_dataset$avg_glucose_level, na.rm = TRUE)

# Recovering outliers with mode value in avg glucose column

for (i in 1: length(stroke_prediction_dataset$avg_glucose_level)){
  if (stroke_prediction_dataset$avg_glucose_level[i] > 115){
    stroke_prediction_dataset$avg_glucose_level[i] <- mode_glucose_level
  }
}


# Ever married attribute

# Converting ever married column video to yes = 1 and no = 0 
stroke_prediction_dataset$ever_married <- ifelse(stroke_prediction_dataset$ever_married == "Yes", 1, ifelse(stroke_prediction_dataset$ever_married == "No", 0, NA))


# BMI attribute

median_bmi <- median(stroke_prediction_dataset$bmi, na.rm = TRUE)


# Convert non-numeric values to NA
stroke_prediction_dataset$bmi <- as.numeric(as.character(stroke_prediction_dataset$bmi))

# Boxplot for bmi column
bmi_outliers <- boxplot(stroke_prediction_dataset$bmi, main = "Boxplot for BMI column", ylab = "BMI")$out
cat("Potential outliers of BMI column: ", bmi_outliers, "\n")

# Finding rows of outliers of bmi column
bmi_outliers_rows <- which(stroke_prediction_dataset$bmi < 0 | stroke_prediction_dataset$bmi > 47)
cat("Potetial rows of outliers of BMI column: ", bmi_outliers_rows, "\n")




