jL = jitterLocal(:,2);

%Ovo je za zadatak 2 prvi graf
jL_b1 = jL(floor(100*(stimuli.start(1)-0.19)) : floor(100*(stimuli.stop(1)-0.19)));
jL_n1 = jL(floor(100*(stimuli.start(2)-0.19)) : floor(100*(stimuli.stop(2)-0.19)));
jL_s = jL(floor(100*(stimuli.start(3)-0.19)) : floor(100*(stimuli.stop(3)-0.19)));
jL_n2 = jL(floor(100*(stimuli.start(4)-0.19)) : floor(100*(stimuli.stop(4)-0.19)));
jL_b2 = jL(floor(100*(stimuli.start(5)-0.19)) : floor(100*(stimuli.stop(5)-0.19)));

%plottanje(jL_b1,jL_n1,jL_s,jL_n2,jL_b2)

%Ovo je za zadatak 2 drugi graf
% baseline_1
tmp = floor(100*(indexParser(1,ts)-0.19));
jL_b1_2 = jL(tmp : tmp + 1000);
jL_b1_2_0 = jL_b1_2(jL_b1_2>0);
jL_b1_2(jL_b1_2 == 0) = NaN;
% neutral_1
tmp = floor(100*(indexParser(7,ts)-0.19));
jL_n1_21 = jL(tmp : tmp + 1000);
tmp = floor(100*(indexParser(13,ts)-0.19));
jL_n1_22 = jL(tmp : tmp + 1000);
tmp = floor(100*(indexParser(19,ts)-0.19));
jL_n1_23 = jL(tmp : tmp + 1000);
tmp = floor(100*(indexParser(25,ts)-0.19));
jL_n1_24 = jL(tmp : tmp + 1000);
tmp = floor(100*(indexParser(31,ts)-0.19));
jL_n1_25 = jL(tmp : tmp + 1000);
jL_n1_2 = transpose([transpose(jL_n1_21), transpose(jL_n1_22), transpose(jL_n1_23), transpose(jL_n1_24), transpose(jL_n1_25)]);
jL_n1_2_0 = jL_n1_2(jL_n1_2>0);
jL_n1_2(jL_n1_2 == 0) = NaN;
% stres
tmp = floor(100*(indexParser(37,ts)-0.19));
jL_s_21 = jL(tmp : tmp + 1000);
tmp = floor(100*(indexParser(43,ts)-0.19));
jL_s_22 = jL(tmp : tmp + 1000);
tmp = floor(100*(indexParser(49,ts)-0.19));
jL_s_23 = jL(tmp : tmp + 1000);
jL_s_2 = transpose([transpose(jL_s_21), transpose(jL_s_22), transpose(jL_s_23)]);
jL_s_2_0 = jL_s_2(jL_s_2>0);
jL_s_2(jL_s_2 == 0) = NaN;
% neutral_2
tmp = floor(100*(indexParser(55,ts)-0.19));
jL_n2_21 = jL(tmp : tmp + 1000);
tmp = floor(100*(indexParser(61,ts)-0.19));
jL_n2_22 = jL(tmp : tmp + 1000);
tmp = floor(100*(indexParser(67,ts)-0.19));
jL_n2_23 = jL(tmp : tmp + 1000);
tmp = floor(100*(indexParser(73,ts)-0.19));
jL_n2_24 = jL(tmp : tmp + 1000);
tmp = floor(100*(indexParser(79,ts)-0.19));
jL_n2_25 = jL(tmp : tmp + 1000);
jL_n2_2 = transpose([transpose(jL_n2_21), transpose(jL_n2_22), transpose(jL_n2_23), transpose(jL_n2_24), transpose(jL_n2_25)]);
jL_n2_2_0 = jL_n2_2(jL_n2_2>0);
jL_n2_2(jL_n2_2 == 0) = NaN;
% baseline_2
tmp = floor(100*(indexParser(83,ts)-0.19));
jL_b2_2 = jL(tmp : tmp + 1000);
jL_b2_2_0 = jL_b2_2(jL_b2_2>0);
jL_b2_2(jL_b2_2 == 0) = NaN;


glasovneAllData_jL = allDataGenerator(jL_b1_2_0,jL_n1_2_0,jL_s_2_0,jL_n2_2_0,jL_b2_2_0);
