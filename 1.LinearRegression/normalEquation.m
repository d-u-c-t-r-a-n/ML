% This function uses Normal Equation
function [theta] = normalEquation(X, y)

theta = pinv(X'*X) * X' * y;

end
