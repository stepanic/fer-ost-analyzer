i1 = find(facialTime>stimuli.start(1),1);
i2 = find(facialTime>stimuli.start(2),1);
i3 = find(facialTime>stimuli.start(3),1);
i4 = find(facialTime>stimuli.start(4),1);
i4e = find(facialTime>stimuli.stop(4),1) - 1;
i5 = find(facialTime>stimuli.start(5),1);
i5e = find(facialTime>stimuli.stop(5), 1) - 1;

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
rel_data = allDataGenerator(rel_smooth);
