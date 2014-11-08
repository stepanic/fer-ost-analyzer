% Load CSV file with lab_timestamps.txt
% FORMAT:  Time,Info,Type,Stamped Object Type,Label
% EXAMPLE: 00:00:52.9189698,Plus.jpg,StimuliStart,Image,Start IMG 1
file_timestamps = fopen('Util/lab_timestamps.txt');
data_timestamps = textscan(file_timestamps,'%s%s%s%s%s','delimiter',',');
fclose(file_timestamps);