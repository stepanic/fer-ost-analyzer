min_value_array = HR(floor(indexParser(31,ts)*8):floor((indexParser(33,ts) + 5))*8);
max_value_array = HR(floor(indexParser(33,ts)*8):floor((indexParser(33,ts) + 20)*8));
plot_array = HR(floor(indexParser(31,ts)*8):floor((indexParser(33,ts)+20)*8));
max_value = max(max_value_array(:));
min_value = min(min_value_array(:));
index_min = find(plot_array == min_value);
index_max = find(plot_array == max_value);
index_min = index_min(1:1);
index_max = index_max(end:end);
%index_min = find(min_value_array == min(min_value_array(:)));
%index_min = index_min(1:1);
%index_max = find(max_value_array == max(max_value_array(:)));
%index_max = index_max(1:1);
stres_len = length(plot_array);
t_stres = stres_len - length(max_value_array);
%index_max = index_max + t_stres;
p_i_min = find(plot_array == min(plot_array(:)));
p_i_min = p_i_min(1:1);
p_i_max = find(plot_array == max(plot_array(:)));
p_i_max = p_i_max(1:1);
if t_stres < index_min
    t_ant = NaN;
else
    t_ant = (t_stres - index_min)/8;
end
if index_max < index_min
    t_rise = NaN;
else
    t_rise = (index_max - index_min)/8;
end

