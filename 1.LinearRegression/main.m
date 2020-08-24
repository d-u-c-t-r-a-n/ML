% REQUIRED PKG
% pkg install -forge io
% pkg load io

%%%% INITIALIZATION
clear; close all; clc

numberOfFeature = numOfFeature("kc_house_data.csv");

for k = 1:numberOfFeature % plz change back to 1:

    [adjR2, allPossiblePairs, headers] = adjR2_dataset("kc_house_data.csv", k);
    [s, i] = sort(adjR2, "descend");
    allNames = {};

    for j = 1:length(allPossiblePairs),
    target = allPossiblePairs(j,:);
    feature = "";

    for l = 1:length(target),
    name = headers{target(l)};
    if length(feature) > 0,
    feature = cstrcat(feature, " & ", name);
    else,
    feature = name;
    end;
    end;
    allNames = {allNames{:}, feature};
    end;

    fprintf('\t COMPUTING ADJ R2 OF %.0f FEATURES\n',k);
    fprintf('--------------------------------------------------\n'); 
    fprintf('Feature Name\t\t\tAdjusted R Squared\n');
    fprintf('------------\t\t\t------------------\n');

    for m = 1:3,
    index = i(m);
    fprintf('%-35s %f\n', allNames{index}, adjR2(index));
    end;
    fprintf('\n');
end;