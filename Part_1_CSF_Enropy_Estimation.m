% CSF Entropy Estimation
% Menon, S.S.; Krishnamurthy, K. A Study of Brain Neuronal and Functional Complexities Estimated Using Multiscale Entropy in Healthy Young Adults. Entropy 2019, 21, 995.% This program finds and save the static and dynamic fc and performs connectome fingerprinting (Results section 1).  Note the data input to the program is 4 resting state data available for subjects
% Here we have subject variable name with _csf_timeseries.mat saved
% which contain timeseries from CSF for four sessions viz. lr1,lr2,rl1 and
% rl2. the msentropy function used is downloaded from WFDB Toolbox for MATLAB-https://physionet.org/physiotools/matlab/wfdb-app-matlab
clc                             % Clear command window
clear                           % Clear workspace memory
close all                       % Close all figures
addpath('./Data/')              % Folder containing data
addpath('./mcode/')             % Folder with msentropy functions
load('HCP_Subjects.mat')        % Load HCP subject Ids

samp_en=[];                     % Initialize variable
for su_no=1:size(Subjects,1)                                           % Loop to calculate entropy
    tic                                                                % Start timer
    load(['/media/DATA/DATA1/HCP_Timeseries/Resting_StandfordAtlas/Rex_Timeseries/' num2str(Subjects(su_no)) '_csf_timeseries.mat']);                % Load signaldata
    signaldata=[zscore(detrend(timeseries_lr1_csf)) ;zscore(detrend(timeseries_rl1_csf)) ;zscore(detrend(timeseries_lr2_csf)) ; zscore(detrend(timeseries_rl2_csf)) ]; % Detrend and zscore normalize the data
    
    parfor n=1:size(signaldata,2) % Calculate Entropy
        entropy11(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.05,0.05);
        entropy12(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.1,0.1);
        entropy13(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.15,0.15);
        entropy14(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.2,0.2);
        entropy15(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.25,0.25);
        entropy16(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.3,0.3);
        entropy17(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.35,0.35);
        entropy18(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.4,0.4);
        entropy19(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.45,0.45);
        entropy110(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.5,0.5);
        entropy111(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.55,0.55);
        entropy112(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.6,0.6);
        entropy113(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.65,0.65);
        entropy114(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.7,0.7);
        entropy115(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.75,0.75);
        entropy116(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],1,1,10,0.8,0.8);
        
        entropy21(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.05,0.05);
        entropy22(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.1,0.1);
        entropy23(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.15,0.15);
        entropy24(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.2,0.2);
        entropy25(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.25,0.25);
        entropy26(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.3,0.3);
        entropy27(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.35,0.35);
        entropy28(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.4,0.4);
        entropy29(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.45,0.45);
        entropy210(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.5,0.5);
        entropy211(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.55,0.55);
        entropy212(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.6,0.6);
        entropy213(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.65,0.65);
        entropy214(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.7,0.7);
        entropy215(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.75,0.75);
        entropy216(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],2,2,10,0.8,0.8);
        
        entropy31(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.05,0.05);
        entropy32(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.1,0.1);
        entropy33(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.15,0.15);
        entropy34(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.2,0.2);
        entropy35(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.25,0.25);
        entropy36(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.3,0.3);
        entropy37(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.35,0.35);
        entropy38(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.4,0.4);
        entropy39(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.45,0.45);
        entropy310(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.5,0.5);
        entropy311(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.55,0.55);
        entropy312(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.6,0.6);
        entropy313(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.65,0.65);
        entropy314(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.7,0.7);
        entropy315(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.75,0.75);
        entropy316(n,:)=msentropy(signaldata(:,n),[],[],[],[],[],3,3,10,0.8,0.8);
        
    end
    save(['./StaticMSE_CSF/' num2str(Subjects(su_no)) 'Static_CSF_Entropy.mat'],'entropy11','entropy12','entropy13','entropy14','entropy15','entropy16','entropy17','entropy18','entropy19','entropy110','entropy111','entropy112','entropy113','entropy114','entropy115','entropy116',.......
        'entropy21','entropy22','entropy23','entropy24','entropy25','entropy26','entropy27','entropy28','entropy29','entropy210','entropy211','entropy212','entropy213','entropy214','entropy215','entropy216',........
        'entropy31','entropy32','entropy33','entropy34','entropy35','entropy36','entropy37','entropy38','entropy39','entropy310','entropy311','entropy312','entropy313','entropy314','entropy315','entropy316'); %Save variables with entropy values
    toc                 % Stop timer
end                     % Loop terminates
