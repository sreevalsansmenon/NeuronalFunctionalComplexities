% Edge/Functional Complexity estimation
% This program loads timeseries from ROIs saved inside data folder and
% finds instantaneous FC from PCC to estimate the functional complexity
% Menon, S.S.; Krishnamurthy, K. A Study of Brain Neuronal and Functional Complexities Estimated Using Multiscale Entropy in Healthy Young Adults. Entropy 2019, 21, 995.


clc                                                     % Clear command window
clear                                                   % Clear workspace
addpath('./Data/')                                      % Add path to data folder
load('HCP_Subjects.mat')                                % Load HCP Subjects
addpath('./mcode/')                                     % Path to WFDB Toolbox for MATLAB
uppertriangle=find(triu(ones(90),1));                   % Finding the Upper Diagonal Elements Index 

dsamp_en_1=zeros(967,4005,10);dsamp_en_2=zeros(967,4005,10);
dsamp_en_3=zeros(967,4005,10);dsamp_en_4=zeros(967,4005,10);
dsamp_en_5=zeros(967,4005,10);dsamp_en_6=zeros(967,4005,10);

% dsampen_cnn_1=zeros(90,90,10,966);dsampen_cnn_2=dsampen_cnn_1;dsampen_cnn_3=dsampen_cnn_1;

for su_no=601:size(Subjects,1)                                      % Loop for saving the primary data for comparison     
    tic                                                             % Start Timer
    load(['/media/DATA/DATA1/HCP_Timeseries/Resting_StandfordAtlas/Rex_Timeseries/' num2str(Subjects(su_no)) 'timeseries.mat']); % Load timeseries
    

    signaldata=[zscore(detrend(timeseries_lr1)) ;zscore(detrend(timeseries_rl1)) ;zscore(detrend(timeseries_lr2)) ; zscore(detrend(timeseries_rl2)) ];% Detrend and normalize the data
    phasesignal=angle(hilbert(signaldata)); % Find hilbert angle
    idfc=zeros(1200*4,4005);                % Initialize variable to save instantaneous FC  Variable
    iFC=zeros(90,90);                       % Initialize iFC variable
    
    
    for t=1:1200*4                          % Loop over timepoints
        iFC=cos(meshgrid(phasesignal(t,:))-meshgrid(phasesignal(t,:))');     % Find instantaneous FC
        idfc(t,:)=iFC(uppertriangle)';      % Save upper triangular part
    end                                     % Loop terminates
    
    parfor n=1:4005                         % Loop to calculate entropy
        entropy_1(n,:)=msentropy(idfc(:,n),[],[],[],[],[],1,1,10,0.05,0.05);
        if sum(isnan(entropy_1(n,:)))>0
            disp('Failed at m=1 r=0.05')
        end
        if sum(isinf(entropy_1(n,:)))>0
            disp('Failed at m=2 r=0.2')
        end
        entropy_2(n,:)=msentropy(idfc(:,n),[],[],[],[],[],2,2,10,0.1,0.1);
        if sum(isnan(entropy_2(n,:)))>0
            disp('Failed at m=2 r=0.1')
        end
        if sum(isinf(entropy_2(n,:)))>0
            disp('Failed at m=2 r=0.1')
        end
        entropy_3(n,:)=msentropy(idfc(:,n),[],[],[],[],[],3,3,10,0.2,0.2);
        if sum(isnan(entropy_3(n,:)))>0
            disp('Failed at m=3 r=0.2')
        end
        if sum(isinf(entropy_3(n,:)))>0
            disp('Failed at m=3 r=0.2')
        end
    end
    
    dsamp_en_1(su_no,:,:)=entropy_1;    % Save entropy 1 
    dsamp_en_2(su_no,:,:)=entropy_2;    % Save entropy 2
    dsamp_en_3(su_no,:,:)=entropy_3;    % Save entropy 3

    toc                                 % Stop timer
end
save('./Data/HCP_Edge_MSE.mat','dsamp_en_1','dsamp_en_2','dsamp_en_3');% Save data