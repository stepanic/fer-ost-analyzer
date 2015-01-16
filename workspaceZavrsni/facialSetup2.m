i1 = find(facialTime>stimuli.start(1),1);
i2 = find(facialTime>stimuli.start(2),1);
i3 = find(facialTime>stimuli.start(3),1);
i4 = find(facialTime>stimuli.start(4),1);
i4e = find(facialTime>stimuli.stop(4),1) - 1;
i5 = find(facialTime>stimuli.start(5),1);
i5e = find(facialTime>stimuli.stop(5), 1) - 1;

t(1) = find(facialTime>indexParser(1, ts), 1);
t(2) = find(facialTime>indexParser(2, ts), 1);
t(3) = find(facialTime>indexParser(7, ts), 1);
t(4) = find(facialTime>indexParser(9, ts), 1);
t(5) = find(facialTime>indexParser(13, ts), 1);
t(6) = find(facialTime>indexParser(15, ts), 1);
t(7) = find(facialTime>indexParser(19, ts), 1);
t(8) = find(facialTime>indexParser(21, ts), 1);
t(9) = find(facialTime>indexParser(25, ts), 1);
t(10) = find(facialTime>indexParser(27, ts), 1);
t(11) = find(facialTime>indexParser(31, ts), 1);
t(12) = find(facialTime>indexParser(33, ts), 1);
t(13) = find(facialTime>indexParser(37, ts), 1);
t(14) = find(facialTime>indexParser(39, ts), 1);
t(15) = find(facialTime>indexParser(43, ts), 1);
t(16) = find(facialTime>indexParser(45, ts), 1);
t(17) = find(facialTime>indexParser(49, ts), 1);
t(18) = find(facialTime>indexParser(51, ts), 1);
t(19) = find(facialTime>indexParser(55, ts), 1);
t(20) = find(facialTime>indexParser(57, ts), 1);
t(21) = find(facialTime>indexParser(61, ts), 1);
t(22) = find(facialTime>indexParser(63, ts), 1);
t(23) = find(facialTime>indexParser(67, ts), 1);
t(24) = find(facialTime>indexParser(69, ts), 1);
t(25) = find(facialTime>indexParser(73, ts), 1);
t(26) = find(facialTime>indexParser(75, ts), 1);
t(27) = find(facialTime>indexParser(79, ts), 1);
t(28) = find(facialTime>indexParser(83, ts), 1) - 3*25;
t_end = find(facialTime>indexParser(84, ts), 1) - t(1) - 3*25;
t = t - t(1) + 1;


len(1) = i2 - i1;
len(2) = i3 - i2;
len(3) = i4 - i3;
len(4) = i4e - i4 +1;
len(5) = i5e - i5 + 1;



b1_i = len(1);
n1_i = len(1) + len(2);
s_i = len(1) + len(2) + len(3);
n2_i = s_i + len(4);
b2_i = n2_i + len(5);



t1 = facialTime(i1:i4e);
t2 = facialTime(i5:i5e);
fac_time = transpose([transpose(t1), transpose(t2)]);
fac_time = fac_time - fac_time(1);

time_3(1:28) = NaN;
for i=1:28
    time_3(i) = fac_time(t(i));
end
tl_end = fac_time(t_end);

time(1) = fac_time(len(1));
time(2) = fac_time(len(1) + len(2));
time(3) = fac_time(len(1) + len(2) + len(3));
time(4) = fac_time(len(1) + len(2) + len(3) + len(4));
time(5) = fac_time(len(1) + len(2) + len(3) + len(4) + len(5));



o1 = facialODA(i1:i4e);
o2 = facialODA(i5:i5e);
oda = transpose([transpose(o1), transpose(o2)]);
oda_smooth = smooth(oda, 150);


e1 = facialEye(i1:i4e);
e2 = facialEye(i5:i5e);
eye = transpose([transpose(e1), transpose(e2)]);
eye_smooth = smooth(eye, 150);

r1 = facial3DReal(i1:i4e);
r2 = facial3DReal(i5:i5e);
rel = transpose([transpose(r1), transpose(r2)]);
rel_smooth = smooth(rel, 150);


