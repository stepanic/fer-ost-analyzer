b1 = oda_smooth(1:b1_i);
n1 = oda_smooth(b1_i+1:n1_i);
s = oda_smooth(n1_i+1:s_i);
n2 = oda_smooth(s_i+1:n2_i);
b2 = oda_smooth(n2_i+1:b2_i);

len_control = length(b1) + length(b2) + length(n1) + length(n2) + length(s);


data_oda = allDataGenerator(b1, n1, s, n2, b2); 