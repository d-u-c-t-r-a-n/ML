% This function returns REGULARIZED cost J and partial derivatives gradient GRAD
function [J, grad] = regularizedJGrad(X, y, theta, lambda)

% Initialization
J = 0;
grad = zeros(size(theta));

m = length(y); 
hypothesisFunction = X*theta;
J = 1/(2*m) * sum((hypothesisFunction-y).^2) + lambda/(2*m) * sum(theta(2:end).^2);

lengthTheta = length(theta);

% Separating term 0 (theta_0,...) from the rest
regularizedTheta = theta(2:lengthTheta, :);
regularizedTheta_leftOver = theta(1,:);

regularizedHypothesisFunction = hypothesisFunction(2:end, :);
regularizedHypothesisFunction_leftOver = hypothesisFunction(1, :);

regularizedY = y(2:end, :);
regularizedY_leftOver = y(1, :);

regularizedX = X(:, 2:end);
regularizedX_leftOver = X(:, 1);

a = ((1/m) .* ((hypothesisFunction - y) .* regularizedX));

grad(2:end,:) = (sum(a))' + ((lambda/m) .* regularizedTheta);

%CALCULATING GRADIENT 0

temp = zeros(size(theta));
temp = sum((1/m) * ((hypothesisFunction-y) .* X));
grad(1) = temp(1);
grad = grad(:);

end
