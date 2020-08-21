% Advance optimization function

function [theta] = trainRLR (X, y, lambda)

initialTheta = rand(size(X,2), 1)*0.000001;
costFunction = @(t) regularizedJGrad(X, y, t, lambda);
options = optimset('GradObj', 'on', 'MaxIter', 1000);
theta = fminunc(costFunction, initialTheta, options); 

end;