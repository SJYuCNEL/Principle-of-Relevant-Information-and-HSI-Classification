clear
close all; 
clc; 
%% Load dataset
load('./Indian_pines/Indian_pines_corrected'); 
load('./Indian_pines/Indian_pines_gt'); 
%% Normalization
Min=min(min(min(indian_pines_corrected)));
Max=max(max(max(indian_pines_corrected)));
for i=1:size(indian_pines_corrected,1)
    for j=1:size(indian_pines_corrected,2)
         indian_pines_corrected(i,j,:)=(indian_pines_corrected(i,j,:)-Min)/(Max-Min);
    end
end

%% Parameters 
Nclass=16; % The number of classes.
Trnum=0.02; % Percentage of the training samples.
Iteration=10; % The number of the trials

DLNet.NumStages = 5;% The number of layers
DLNet.NumScale = [6 6 6 6 6];% The number of scales
DLNet.NumLDA=[15 15 15 15 15];% The number of LDA filters
DLNet.delta=[0.3 0.3 0.3 0.3 0.3 0.3];% % kernel parameters
DLNet.beta=[2 2.5 3];% Multi-beta

fprintf('\n ====== Parameters ======= \n')
DLNet
%% MPRI
[kappa, acc, acc_O, acc_A]=MPRI(indian_pines_corrected,indian_pines_gt,DLNet,Nclass,Iteration,Trnum);
