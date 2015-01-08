function [time] = indexParser(x,tempTs)
remain = tempTs{1,1}{x,1};
[hour, ms] = strtok(remain, ':');
[minute, s] = strtok(ms, ':');
[second] = strtok(s, ':');

time = str2double(hour) * 3600 + str2double(minute) * 60 + str2double(second);
 

