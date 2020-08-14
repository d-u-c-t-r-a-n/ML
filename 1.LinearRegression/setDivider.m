% This function divides given dataset into 60/100 training set,
% 20/100 cross-validation set, and 20/100 test set

function [trainingSet, CVSet, testSet] = setDivider(X)

m = length(X);
trainingLength = round(m*0.6);
CVLength = testLength = round(m*0.2);

trainingSet = X(1:trainingLength,:);
CVSet = X(trainingLength+1:trainingLength+CVLength,:);
testSet = X(trainingLength+CVLength+1:end,:);

end;