window_length = 20;
dataHR = feature_calculation(stimuli,8,20,1,HR,HR,[],0,0);
dataGSR = feature_calculation(stimuli,256,20,1,GSR,GSR,[],0,0);

ind_b1_HR = find(dataHR.data.class==1);
STD_b1_HR = dataHR.data.features(ind_b1_HR,2);
ind_n1_HR = find(dataHR.data.class==2);
STD_n1_HR = dataHR.data.features(ind_n1_HR,2);
ind_s_HR = find(dataHR.data.class==3);
STD_s_HR = dataHR.data.features(ind_s_HR,2);
ind_n2_HR = find(dataHR.data.class==4);
STD_n2_HR = dataHR.data.features(ind_n2_HR,2);
ind_b2_HR = find(dataHR.data.class==5);
STD_b2_HR = dataHR.data.features(ind_b2_HR,2);


ind_b1_GSR = find(dataGSR.data.class==1);
STD_b1_GSR = dataGSR.data.features(ind_b1_GSR,16);
ind_n1_GSR = find(dataGSR.data.class==2);
STD_n1_GSR = dataGSR.data.features(ind_n1_GSR,16);
ind_s_GSR = find(dataGSR.data.class==3);
STD_s_GSR = dataGSR.data.features(ind_s_GSR,16);
ind_n2_GSR = find(dataGSR.data.class==4);
STD_n2_GSR = dataGSR.data.features(ind_n2_GSR,16);
ind_b2_GSR = find(dataGSR.data.class==5);
STD_b2_GSR = dataGSR.data.features(ind_b2_GSR,16);

STD_GSR = allDataGenerator(STD_b1_GSR, STD_n1_GSR, STD_s_GSR, STD_n2_GSR, STD_b2_GSR);
STD_HR = allDataGenerator(STD_b1_HR, STD_n1_HR, STD_s_HR, STD_n2_HR, STD_b2_HR);

nan_val = [NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN];

std_b1_gsr = transpose([nan_val, transpose(STD_b1_GSR), nan_val]);
std_n1_gsr = transpose([nan_val, transpose(STD_n1_GSR), nan_val]);
std_s_gsr = transpose([nan_val, transpose(STD_s_GSR), nan_val]);
std_n2_gsr = transpose([nan_val, transpose(STD_n2_GSR), nan_val]);
std_b2_gsr = transpose([nan_val, transpose(STD_b2_GSR), nan_val]);
std_b1_hr = transpose([nan_val, transpose(STD_b1_HR), nan_val]);
std_n1_hr = transpose([nan_val, transpose(STD_n1_HR), nan_val]);
std_s_hr = transpose([nan_val, transpose(STD_s_HR), nan_val]);
std_n2_hr = transpose([nan_val, transpose(STD_n2_HR), nan_val]);
std_b2_hr = transpose([nan_val, transpose(STD_b2_HR), nan_val]);

% GSR
%plottanje_5_2(std_b1_gsr, std_n1_gsr, std_s_gsr, std_n2_gsr, std_b2_gsr)
% HR
%plottanje_5_2(std_b1_hr, std_n1_hr, std_s_hr, std_n2_hr, std_b2_hr)
