% t - indexi vremena pocetaka stimulacija
temp_t = t;
temp_t(29) = t_end;
fac_f0(1:28) = NaN;
for i=1:28
    index = find(eye(temp_t(i):temp_t(i+1)) == 0, 1);
    try
        fac_f0(i) = (fac_time(temp_t(i) + index - 1) - fac_time(temp_t(i)))*1000;
    catch
        fac_f0(i) = (fac_time(temp_t(i+1)-1) - fac_time(temp_t(i)))*1000;
    end
end
bar(1:28, fac_f0);
number_of_zeros(1:28)=NaN;
for i=1:28
    number_of_zeros(i) = length(find(eye(temp_t(i):temp_t(i+1))==0));
end
% bar(1:28, number_of_zeros)