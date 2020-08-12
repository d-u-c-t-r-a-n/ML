% This function computes cost function J for Linear Regression
function J = costFunction(X, y, theta)
m = length(y);
hypothesisFunction = X * theta;
squaredErrors = (hypothesisFunction - y).^2;
J = 1/(2*m) * sum(squaredErrors);
end;