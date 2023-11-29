
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

# BMI attribute 
avg_glucose_level_outliers <- boxplot(stroke_prediction_dataset$avg_glucose_level, main = "Boxplot for Avg Glucose level attribute", ylab = "Avg Glucose level")$out
cat("Potentials outliers for Avg Glucose level are: ", avg_glucose_level_outliers, "\n")
