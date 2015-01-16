%primjer poziva 
%find5points(jL_s_3, findIndex01(vB_s_3))
jL = jitterLocal(:,2);
vB = vadBin(:,2);

vB_s = F0(floor(100*(stimuli.start(3)-0.19)) : floor(100*(stimuli.stop(3)-0.19)));

tmp = floor(100*(indexParser(37,ts)-0.19));
vB_s_1 = vB(tmp : tmp + 1000);
jL_s_1 = jL(tmp : tmp + 1000);

tmp = floor(100*(indexParser(43,ts)-0.19));
vB_s_2 = vB(tmp : tmp + 1000);
jL_s_2 = jL(tmp : tmp + 1000);

tmp = floor(100*(indexParser(49,ts)-0.19));
vB_s_3 = vB(tmp : tmp + 1000);
jL_s_3 = jL(tmp : tmp + 1000);

vB_s = transpose([transpose(vB_s_1), transpose(vB_s_2), transpose(vB_s_3)]);

v6_3_1 = find5points(jL_s_1, findIndex01(vB_s_1));
v6_3_2 = find5points(jL_s_2, findIndex01(vB_s_2));
v6_3_3 = find5points(jL_s_3, findIndex01(vB_s_3));