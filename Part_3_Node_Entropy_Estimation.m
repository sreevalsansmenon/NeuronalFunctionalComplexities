% Node/Neuronal Complexity estimation
% This program loads timeseries from ROIs saved inside data folder and
% estimate the neuronal complexity
% Menon, S.S.; Krishnamurthy, K. A Study of Brain Neuronal and Functional Complexities Estimated Using Multiscale Entropy in Healthy Young Adults. Entropy 2019, 21, 995.% This program finds and save the static and dynamic fc and performs connectome fingerprinting (Results section 1).  Note the data input to the program is 4 resting state data available for subjects


clc                                                     % Clear command window
clear                                                   % Clear workspace
addpath('./Data/')                                      % Add path to data folder
load('HCP_Subjects.mat')                                % Load HCP Subjects
addpath('./mcode/')                                     % Path to WFDB Toolbox for MATLAB
samp_en_1=zeros(967,90,10);samp_en_2=zeros(967,90,10);samp_en_3=zeros(967,90,10); % Initialize variable

for su_no=1:size(Subjects,1)                            % Loop over subject     
    
    tic                                                 % Start Stopwatch
    load(['/media/DATA/DATA1/HCP_Timeseries/Resting_StandfordAtlas/Rex_Timeseries/' num2str(Subjects(su_no)) 'timeseries.mat']);                % Load timeseries data
    signaldata=[zscore(detrend(timeseries_lr1)) ;zscore(detrend(timeseries_rl1)) ;zscore(detrend(timeseries_lr2)) ; zscore(detrend(timeseries_rl2)) ]; % detrend and zscore normalize timeseries and concat 4 sessions
    parfor n=1:90                                       % Loop over ROIs to calculate entropy for each ROI
        entropy_1(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.05,0.05);
        if sum(isnan(entropy_1(n,:)))>0
            disp('Failed at m=1 r=0.05')
        end
        if sum(isinf(entropy_1(n,:)))>0
            disp('Failed at m=2 r=0.2')
        end
        entropy_2(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.1,0.1);
        if sum(isnan(entropy_2(n,:)))>0
            disp('Failed at m=2 r=0.1')
        end
        if sum(isinf(entropy_2(n,:)))>0
            disp('Failed at m=2 r=0.1')
        end
        entropy_3(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.2,0.2);
        if sum(isnan(entropy_3(n,:)))>0
            disp('Failed at m=3 r=0.2')
        end
        if sum(isinf(entropy_3(n,:)))>0
            disp('Failed at m=3 r=0.2')
        end
    end
    samp_en_1(su_no,:,:)=entropy_1;                         % Save entropy of the subject with parameter configuraion 1
    samp_en_2(su_no,:,:)=entropy_2;                         % Save entropy of the subject with parameter configuraion 2
    samp_en_3(su_no,:,:)=entropy_3;                         % Save entropy of the subject with parameter configuraion 3
    toc                                                     % Stop Stopwatch
    
end                                                         % Loop terminates
save('./Data/HCP_Static_MSE.mat','samp_en_1','samp_en_2','samp_en_3'); % Save data 