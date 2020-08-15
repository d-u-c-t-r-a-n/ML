% REQUIRED PKG
% pkg install -forge io
% pkg load io

% This function returns number of feature in a dataset
function [value] = numOfFeature(fileName),
headers = csv2cell(fileName);
headers = headers(1,:);
value = length(headers)-1;
end;