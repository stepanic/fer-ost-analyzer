% Load transformed CSV file from timestamps.txt to timestamps.csv
% FORMAT:  Time,Info,Type,Stamped Object Type,Label
% EXAMPLE: 00:00:52.9189698,Plus.jpg,StimuliStart,Image,Start IMG 1
file_timestamps = fopen('Util/timestamps.csv');
ts = textscan(file_timestamps,'%s%s%s%s%s','delimiter',',');
fclose(file_timestamps);

% LOAD data from CSV, which are transformed from XML 
% <X>data_x</X><Y>data_y</Y>    to     data_x,data_y
hr = csvread('Phisiology/HR.csv');
gsr  = csvread('Phisiology/GSR.csv');
frequencyGSR = 256; % READ from presentation, find is L1, L2 or L3 level
frequencyHR = 8;

F0 = csvread('Audio/F0.csv');
