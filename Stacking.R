

#library(installr)
#updateR() # actualizar R.
#install.packages("modeest")
library (mise)
mise()
library(car)
install.packages("caret")
library(caret)
set.seed(123)



setwd("D:/Users/caordone3/Documents/Angela 2018/uniandes/Proyecto final Deep Learning")
dir()
y=read.csv("Y_test.csv",sep=",")
head(y)
modeltext=read.csv("Y_validation_RN5.csv",sep=",")[-1]
dim(modeltext)
head(modeltext)
modelimg=read.csv("pred_val_RF.csv",sep=",")[-1]
dim(modelimg)
#validation=read.csv("dataTesting.csv",sep=",")
#head(validation)

ModelText=read.csv("pred_genres_text_RN5.csv", sep=",")[-1]
ModelImg=read.csv("pred_genres_colimg_RF.csv", sep=",")[-1]


predTest=data.frame(ModelText,ModelImg)
predDF <- data.frame(modeltext,modelimg)

modelStack <- train(y ~ ., data = predDF, method = "rf")
combPred <- predict(modelStack, predDF)
confusionMatrix(combPred, y)$overall[1] 


stacking=predict_proba(modelStack,predTest )

