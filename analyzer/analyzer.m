% 1. open as Current folder in MATLAB:
% ./fer-ost-analyzer/parser/Parser/bin/Debug/DemoData
% to be able to open CSV files with data as relative path

% Load transformed CSV file from timestamps.txt to timestamps.csv
% FORMAT:  Time,Info,Type,Stamped Object Type,Label
% EXAMPLE: 00:00:52.9189698,Plus.jpg,StimuliStart,Image,Start IMG 1
%file_timestamps = fopen('Util/timestamps.csv');
%ts = textscan(file_timestamps,'%s%s%s%s%s','delimiter',',');
%fclose(file_timestamps);

% LOAD data from CSV, which are transformed from XML 
% <X>data_x</X><Y>data_y</Y>    to     data_x,data_y
%ECG_XY = csvread('Phisiology/ECG 1.csv');
%GSR_XY  = csvread('Phisiology/GSR.csv');
%hr = csvread('Phisiology\HR.csv');
%frequency = 256; % READ from presentation, find is L1, L2 or L3 level

% DEMO, how to get data
% timestamp - second column (Info), 10th row - matrix syntax {column}{row}
%ts{2}{10}
% data - EXAMPLE: ecg - vector syntax (row)(column), column1-X, column2-Y
%ecg(1000,2)

% Implement statistic and all other analyze with loaded data
% ...
%ecg=ECG_XY(:,2);
%sc=GSR_XY(:,2);
%HDR=qrsdetect(ecg,frequency,2)
%QRSI_new=HDR.EVENT.POS;
%examine_HDR
%examine_HDR
%examine_HDR
%detect_missed_qrs
%hr_rr_calculation
%figure()
%plot((1:length(hr))/frequency,hr)
%axis(0 700 50 120)
%data = feature_calculation(stimuli,frequency,20,1,hr,sc,QRSI_new,1,1)



