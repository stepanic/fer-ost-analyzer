b1 = rel_smooth(1:b1_i);
n1 = rel_smooth(b1_i+1:n1_i);
s = rel_smooth(n1_i+1:s_i);
n2 = rel_smooth(s_i+1:n2_i);
b2 = rel_smooth(n2_i+1:b2_i);

len_control = length(b1) + length(b2) + length(n1) + length(n2) + length(s);


data_rel = allDataGenerator(b1, n1, s, n2, b2); 