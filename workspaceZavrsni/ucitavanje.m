% Load transformed CSV file from timestamps.txt to timestamps.csv
% FORMAT:  Time,Info,Type,Stamped Object Type,Label
% EXAMPLE: 00:00:52.9189698,Plus.jpg,StimuliStart,Image,Start IMG 1



file_timestamps = fopen(strcat(path, 'Util/timestamps.csv'));
ts = textscan(file_timestamps,'%s%s%s%s%s','delimiter',',');
fclose(file_timestamps);

% LOAD data from CSV, which are transformed from XML 
% <X>data_x</X><Y>data_y</Y>    to     data_x,data_y
hr = csvread(strcat(path, 'Phisiology/HR.csv'));
gsr  = csvread(strcat(path, 'Phisiology/GSR.csv'));
frequencyGSR = 256; % READ from presentation, find is L1, L2 or L3 level
frequencyHR = 8;

F0 = csvread(strcat(path, 'Audio/F0.csv'));
jitterLocal = csvread(strcat(path,'Audio/jitterLocal.csv'));
vadBin = csvread(strcat(path,'Audio/vadBin.csv'));

facialTime = csvread(strcat(path, 'Video/time.csv'));
facialTime = facialTime/1000;
facialODA = csvread(strcat(path, 'Video/Overall_Dist_Activity.csv'));
facial3DReal = csvread(strcat(path, 'Video/8,3 (D)(3DRel).csv'));
facialEye = csvread(strcat(path, 'Video/Eye Closure X.csv'));