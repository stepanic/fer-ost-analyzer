HR = hr(:,2);
GSR =  gsr(:,2);

HR_b1 = HR(floor(stimuli.start(1) * 8) : floor(stimuli.stop(1)*8));
HR_n1 = HR(floor(stimuli.start(2) * 8) : floor(stimuli.stop(2)*8));
HR_s = HR(floor(stimuli.start(3) * 8) : floor(stimuli.stop(3)*8));
HR_n2 = HR(floor(stimuli.start(4) * 8) : floor(stimuli.stop(4)*8));
HR_b2 = HR(floor(stimuli.start(5) * 8) : floor(stimuli.stop(5)*8));


GSR_b1 = GSR(floor(stimuli.start(1) * 256) : floor(stimuli.stop(1)*256));
GSR_n1 = GSR(floor(stimuli.start(2) * 256) : floor(stimuli.stop(2)*256));
GSR_s = GSR(floor(stimuli.start(3) * 256) : floor(stimuli.stop(3)*256));
GSR_n2 = GSR(floor(stimuli.start(4) * 256) : floor(stimuli.stop(4)*256));
GSR_b2 = GSR(floor(stimuli.start(5) * 256) : floor(stimuli.stop(5)*256));

mean_HR_b1 = mean(HR_b1);
std_HR_b1 = std(HR_b1);
mean_HR_n1 = mean(HR_n1);
std_HR_n1 = std(HR_n1);
mean_HR_s = mean(HR_s);
std_HR_s = std(HR_s);
mean_HR_n2 = mean(HR_n2);
std_HR_n2 = std(HR_n2);
mean_HR_b2 = mean(HR_b2);
std_HR_b2 = std(HR_b2);

mean_GSR_b1 = mean(GSR_b1);
std_GSR_b1 = std(GSR_b1);
mean_GSR_n1 = mean(GSR_n1);
std_GSR_n1 = std(GSR_n1);
mean_GSR_s = mean(GSR_s);
std_GSR_s = std(GSR_s);
mean_GSR_n2 = mean(GSR_n2);
std_GSR_n2 = std(GSR_n2);
mean_GSR_b2 = mean(GSR_b2);
std_GSR_b2 = std(GSR_b2);

