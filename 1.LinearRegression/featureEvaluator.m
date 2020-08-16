% This function finds the correlation between features and actual outputs
% Input: X = matrix of all features (examples x features)
%        y = vector of actual output
%        featureNames = {array} of features names according to X
% Output: result = strings of name, sorted in order of highest correlation to lowest negative correlation
function [result] = featureEvaluator(X, y, featureNames)

featureCorrelation = corr (X,y);
[s, i] = sort(featureCorrelation, 'descend');
result = [];

for featureIndex = 1:length(i)
 feature = featureNames(i(featureIndex));
 result = [result feature]; 
 end;

end;