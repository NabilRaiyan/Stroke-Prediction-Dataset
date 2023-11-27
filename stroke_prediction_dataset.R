

stroke_prediction_dataset <- read.csv("E:/Courses/Data Science Projects/Stroke Prediction Dataset/stroke_prediction_dataset.csv")
stroke_prediction_dataset

head(stroke_prediction_dataset)
tail(stroke_prediction_dataset)
str(stroke_prediction_dataset)

summary(stroke_prediction_dataset)
colSums(is.na(stroke_prediction_dataset))
names(stroke_prediction_dataset)

is.na(stroke_prediction_dataset)
dim(stroke_prediction_dataset)