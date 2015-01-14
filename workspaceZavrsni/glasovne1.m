F0 = F0(:,2);

%Ovo je za zadatak 1 prvi graf
F0_b1 = F0(floor(100*(stimuli.start(1)-0.19)) : floor(100*(stimuli.stop(1)-0.19)));
F0_n1 = F0(floor(100*(stimuli.start(2)-0.19)) : floor(100*(stimuli.stop(2)-0.19)));
F0_s = F0(floor(100*(stimuli.start(3)-0.19)) : floor(100*(stimuli.stop(3)-0.19)));
F0_n2 = F0(floor(100*(stimuli.start(4)-0.19)) : floor(100*(stimuli.stop(4)-0.19)));
F0_b2 = F0(floor(100*(stimuli.start(5)-0.19)) : floor(100*(stimuli.stop(5)-0.19)));

%ovo je za zadatak 1 drugi graf
% baseline_1
tmp = floor(100*(indexParser(1,ts)-0.19));
F0_b1_2 = F0(tmp : tmp + 1000);
% neutral_1
tmp = floor(100*(indexParser(7,ts)-0.19));
F0_n1_21 = F0(tmp : tmp + 1000);
tmp = floor(100*(indexParser(13,ts)-0.19));
F0_n1_22 = F0(tmp : tmp + 1000);
tmp = floor(100*(indexParser(19,ts)-0.19));
F0_n1_23 = F0(tmp : tmp + 1000);
tmp = floor(100*(indexParser(25,ts)-0.19));
F0_n1_24 = F0(tmp : tmp + 1000);
tmp = floor(100*(indexParser(31,ts)-0.19));
F0_n1_25 = F0(tmp : tmp + 1000);
F0_n1_2 = transpose([transpose(F0_n1_21), transpose(F0_n1_22), transpose(F0_n1_23), transpose(F0_n1_24), transpose(F0_n1_25)]);
% stres
tmp = floor(100*(indexParser(37,ts)-0.19));
F0_s_21 = F0(tmp : tmp + 1000);
tmp = floor(100*(indexParser(43,ts)-0.19));
F0_s_22 = F0(tmp : tmp + 1000);
tmp = floor(100*(indexParser(49,ts)-0.19));
F0_s_23 = F0(tmp : tmp + 1000);
F0_s_2 = transpose([transpose(F0_s_21), transpose(F0_s_22), transpose(F0_s_23)]);
% neutral_2
tmp = floor(100*(indexParser(55,ts)-0.19));
F0_n2_21 = F0(tmp : tmp + 1000);
tmp = floor(100*(indexParser(61,ts)-0.19));
F0_n2_22 = F0(tmp : tmp + 1000);
tmp = floor(100*(indexParser(67,ts)-0.19));
F0_n2_23 = F0(tmp : tmp + 1000);
tmp = floor(100*(indexParser(73,ts)-0.19));
F0_n2_24 = F0(tmp : tmp + 1000);
tmp = floor(100*(indexParser(79,ts)-0.19));
F0_n2_25 = F0(tmp : tmp + 1000);
F0_n2_2 = transpose([transpose(F0_n2_21), transpose(F0_n2_22), transpose(F0_n2_23), transpose(F0_n2_24), transpose(F0_n2_25)]);
% baseline_2
tmp = floor(100*(indexParser(83,ts)-0.19));
F0_b2_2 = F0(tmp : tmp + 1000);


glasovneAllData = allDataGenerator(F0_b1_2,F0_n1_2,F0_s_2,F0_n2_2,F0_b2_2);



 