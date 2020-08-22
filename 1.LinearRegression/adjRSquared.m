% This function calculates adjusted R^2 of the model
% The higher & closer adjR2 to 1, the better the model
function [adjR2] = adjRSquared (predictedVector, y, numberOfFeatures)

n = length(y);
mu = mean(y);
SS_tot = sum((y-mu).^2);
SS_res = sum((y-predictedVector).^2);
R2 = 1 - (SS_res/SS_tot);
adjR2 = 1 - (1-R2) * ( (n-1) / (n-numberOfFeatures-1) );

end;