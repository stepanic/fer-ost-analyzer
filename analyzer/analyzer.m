% 1. open as Current folder in MATLAB:
% ./fer-ost-analyzer/parser/Parser/bin/Debug/DemoData

% Load transformed CSV file from timestamps.txt to timestamps.csv
% FORMAT:  Time,Info,Type,Stamped Object Type,Label
% EXAMPLE: 00:00:52.9189698,Plus.jpg,StimuliStart,Image,Start IMG 1
file_timestamps = fopen('Util/timestamps.csv');
dts = textscan(file_timestamps,'%s%s%s%s%s','delimiter',',');
fclose(file_timestamps);