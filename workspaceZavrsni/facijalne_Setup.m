i1 = find(facialTime>stimuli.start(1),1);
i2 = find(facialTime>stimuli.start(2),1);
i3 = find(facialTime>stimuli.start(3),1);
i4 = find(facialTime>stimuli.start(4),1);
i4e = find(facialTime>stimuli.stop(4),1) - 1;
i5 = find(facialTime>stimuli.start(5),1);
i5e = find(facialTime>stimuli.stop(5), 1) - 1;

t1 = facialTime(i1:i2-1);
t2 = facialTime(i2:i3-1);
t3 = facialTime(i3:i4-1);
t4 = facialTime(i4:i4e);
t5 = facialTime(i5:i5e);

len(1) = length(t1);
len(2) = length(t2);
len(3) = length(t3);
len(4) = length(t4);
len(5) = length(t5);


t1 = t1-t1(1);
t2 = t2-t1(1);
t3 = t3-t1(1);
t4 = t4-t1(1);
t5 = t5-t1(1);

oda1 = facialODA(i1:i2-1);
oda2 = facialODA(i2:i3-1);
oda3 = facialODA(i3:i4-1);
oda4 = facialODA(i4:i4e);
oda5 = facialODA(i5:i5e);
facialODA = transpose([transpose(oda1), transpose(oda2), transpose(oda3), transpose(oda4), transpose(oda5)]);
facialODA_smooth = smooth(facialODA,150);

real3D1 = facial3DReal(i1:i2-1);
real3D2 = facial3DReal(i2:i3-1);
real3D3 = facial3DReal(i3:i4-1);
real3D4 = facial3DReal(i4:i4e);
real3D5 = facial3DReal(i5:i5e);
facial3DReal = transpose([transpose(real3D1), transpose(real3D2), transpose(real3D3), transpose(real3D4), transpose(real3D5)]);
facial3DReal_smooth = smooth(facial3DReal,150);

facialEye = smooth(facialEye,150);
eye1 = facialEye(i1:i2-1);
eye2 = facialEye(i2:i3-1);
eye3 = facialEye(i3:i4-1);
eye4 = facialEye(i4:i4e);
eye5 = facialEye(i5:i5e);



