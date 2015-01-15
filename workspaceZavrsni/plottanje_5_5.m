function plottanje_5_5(plot_array, index_max, index_min, value_min, value_max, index_stres)

y_min = min(plot_array)*0.9;
y_max = max(plot_array)*1.1;

x_max = length(plot_array);
x_min = 0;

figure();
hold on
plot((1:x_max), plot_array)
line('XData', [index_stres index_stres], 'YData', [y_min y_max], 'LineStyle', '-', 'LineWidth', 2, 'Color','k')
%plot(index_stres, (y_min:y_max))
plot(index_min, value_min, 'r*', 'LineWidth', 6)
plot(index_max, value_max, 'r*', 'LineWidth', 6)
%pdecirc(index_min,value_min,1)
axis([x_min x_max y_min y_max])

