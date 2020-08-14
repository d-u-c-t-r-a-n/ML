% This function normalizes X
function [X_result, mu, sigma] = featureNormalize(X)

mu = mean(X); sigma = std(X);
X_result = (X-mu)./sigma;

end;