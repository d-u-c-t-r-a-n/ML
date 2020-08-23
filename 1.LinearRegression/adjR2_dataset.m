% REQUIRED PKG
% pkg install -forge io
% pkg load io

% This function computes the adjusted R Squared for 
% the desired dataset with target features
% Input:    fileName = string of name of fileName
%           k = number of features 
% Output:   adjR2 = vector of value
%           allPossiblePairs = matrix of all compared combination of features
%           headers = headers from dataset

function [adjR2, allPossiblePairs, headers] = adjR2_dataset (fileName, k)

    %%% Preprocessing

    % Load data. Ensure the first column is y (feature we are trying to predict)
    data = csvread(fileName);
    headers = csv2cell(fileName);

    % Separate labels from data
    headers = headers(1,:);
    data = data(2:end,:);

    % Initialization
    y = data(:,1);
    [y, y_CV, y_test] = setDivider(y);
    adjR2 = [];

    allPossiblePairs = nchoosek(2:length(headers), k);


    %{
    % Ranking the features relevances to price
    X = [];
    for i = 2:(size(data,2)),
    feature = data(:,i);
    X = [X feature];
    end;
    topFeatures = featureEvaluator(X, y, headers)

    % Top Features:
    % 1.  sqft_Living
    % 2.  grade
    % 3.  sqft_above
    % 4.  sqft_living15
    % 5.  bathrooms
    % 6.  view
    % 7.  sqft_basement
    % 8.  bedrooms
    % 9.  lat
    % 10. waterfront
    % 11. floors
    % 12. yr_renovated
    % 13. sqft_lot
    % 13. sqft_lot15
    % 14. year_built
    % 15. condition
    % 16. long
    % 17. zipcode

    %}


    %% S1: Local Initilization

    for i = 1:size(allPossiblePairs,1),
    targetVector = allPossiblePairs(i,:);
    X = [];
    for j = 1:length(targetVector),
    index = targetVector(j);
    feature = data(:,index);
    X = [X feature];
    end;

    % Divide set
    [X, X_CV, X_test] = setDivider(X); 

    % Normalize
    [X, Xmean, Xsigma] = featureNormalize(X);
    [X_CV, X_CVmean, X_CVsigma] = featureNormalize(X_CV);
    [X_test, X_testmean, X_testsigma] = featureNormalize(X_test);

    % Add x0
    X = [ones(size(X,1),1) X]; 
    X_CV = [ones(size(X_CV,1),1) X_CV];
    X_test = [ones(size(X_test,1),1) X_test];

    %% S2: Optimizing Linear Regression Using Advanced Optimizer
    theta = trainRLR(X, y, 1);

    %% S3: Evaluate Model
    predictedVector = X_CV * theta;
    numberOfFeatures = size(X_CV, 2);
    adjR2 = [adjR2 adjRSquared(predictedVector, y_CV, numberOfFeatures)];
    end;
end;