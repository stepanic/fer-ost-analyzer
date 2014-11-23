% 1. open as Current folder in MATLAB:
% ./fer-ost-analyzer/parser/Parser/bin/Debug/DemoData
% to be able to open CSV files with data as relative path

% Load transformed CSV file from timestamps.txt to timestamps.csv
% FORMAT:  Time,Info,Type,Stamped Object Type,Label
% EXAMPLE: 00:00:52.9189698,Plus.jpg,StimuliStart,Image,Start IMG 1
%file_timestamps = fopen('Util/timestamps.csv');
%ts = textscan(file_timestamps,'%s%s%s%s%s','delimiter',',');
%fclose(file_timestamps);
translationZ = csvread('Video/Translation_Z.csv');
translationZ=translationZ(:,2)
%translationZ_decimate = decimate(translationZ, 25);
eyeClosureX = csvread('Video/EyeClosureXnas.csv');
%eyeClosure_decimate = decimate(eyeClosureX, 25);
%matrica(1:664) = 1;

%for n = 1*60+56:2*60+21
%    matrica(n) = 0;
%end

tran_neutral1_1 = translationZ(113*25 : 116*25)
tran_neutral1_2 = translationZ(141*25 : 144*25)
tran_neutral1_3 = translationZ(184*25 : 187*25)
tran_neutral1_4 = translationZ(232*25 : 235*25)
tran_neutral1_5 = translationZ(275*25 : 278*25)
tran_stres_1 = translationZ(303*25 : 306*25)
tran_stres_2 = translationZ(336*25 : 339*25)
tran_stres_3 = translationZ(384*25 : 387*25)
tran_neutral2_1 = translationZ(412*25 : 415*25)
tran_neutral2_2 = translationZ(450*25 : 453*25)
tran_neutral2_3 = translationZ(483*25 : 486*25)
tran_neutral2_4 = translationZ(531*25 : 534*25)
tran_neutral2_5 = translationZ(569*25 : 572*25)

tran_neutral1 = vertcat(tran_neutral1_1, tran_neutral1_2,tran_neutral1_3,tran_neutral1_4,tran_neutral1_5)
tran_stres = vertcat(tran_stres_1,tran_stres_2, tran_stres_3)
tran_neutral2 = vertcat(tran_neutral2_1, tran_neutral2_2,tran_neutral2_3,tran_neutral2_4,tran_neutral2_5)

eyeClo_neutral1_1 = translationZ(113*25 : 116*25)
eyeClo_neutral1_2 = translationZ(141*25 : 144*25)
eyeClo_neutral1_3 = translationZ(184*25 : 187*25)
eyeClo_neutral1_4 = translationZ(232*25 : 235*25)
eyeClo_neutral1_5 = translationZ(275*25 : 278*25)
eyeClo_stres_1 = translationZ(303*25 : 306*25)
eyeClo_stres_2 = translationZ(336*25 : 339*25)
eyeClo_stres_3 = translationZ(384*25 : 387*25)
eyeClo_neutral2_1 = translationZ(412*25 : 415*25)
eyeClo_neutral2_2 = translationZ(450*25 : 453*25)
eyeClo_neutral2_3 = translationZ(483*25 : 486*25)
eyeClo_neutral2_4 = translationZ(531*25 : 534*25)
eyeClo_neutral2_5 = translationZ(569*25 : 572*25)

eyeClo_neutral1 = vertcat(eyeClo_neutral1_1, eyeClo_neutral1_2,eyeClo_neutral1_3,eyeClo_neutral1_4,eyeClo_neutral1_5)
eyeClo_stres = vertcat(eyeClo_stres_1,eyeClo_stres_2, eyeClo_stres_3)
eyeClo_neutral2 = vertcat(eyeClo_neutral2_1, eyeClo_neutral2_2,eyeClo_neutral2_3,eyeClo_neutral2_4,eyeClo_neutral2_5)

