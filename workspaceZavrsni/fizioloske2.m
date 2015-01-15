window_length = 20;
%dataHR = feature_calculation(stimuli,8,20,1,HR,HR,[],0,0)
%dataGSR = feature_calculation(stimuli,256,20,1,GSR,GSR,[],0,0)

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

