function plot_facial(mv, sv, normal_array, smooth_array, tl, time)

% len1 = length(b1);
% len2 = length(n1);
% len3 = length(s);
% len4 = length(n2);
% len5 = length(b2);

xmin = 0;
xmax = tl(5);

ymin = min([min(normal_array), min(smooth_array)]) * 0.99;
ymax = max([max(normal_array), max(smooth_array)]) * 1.01;

figure();
hold on
plot(time, normal_array, time, smooth_array)

% plot((1:len1),b1)
% hold on
line('XData', [tl(1) tl(1)], 'YData', [ymin ymax], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
% plot(((len1+1):(len1+len2)),n1)
line('XData', [tl(2) tl(2)], 'YData', [ymin ymax], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
% plot(((len1 + len2 +1):(len1+len2+ len3)),s)
line('XData', [tl(3) tl(3)], 'YData', [ymin ymax], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
% plot(((len1 + len2 + len3 +1):(len1+len2+ len3 + len4)),n2)
line('XData', [tl(4) tl(4)], 'YData', [ymin ymax], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
% plot(((len1 + len2 + len3 + len4 +1):(len1+len2+ len3 + len4 + len5)),b2)
line('XData', [tl(5) tl(5)], 'YData', [ymin ymax], 'LineStyle', '-', 'LineWidth', 2, 'Color','k')
% line('XData', [(len1+len2+len3+len4+2) (len1+len2+len3+len4+2)], 'YData', [ymin ymax], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
% 
% 
line('XData', [ 1 tl(1)], 'YData', [(mv(1) + sv(1)) (mv(1) + sv(1))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ tl(1) tl(2)], 'YData', [(mv(2) + sv(2)) (mv(2) + sv(2))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ tl(2) tl(3)], 'YData', [(mv(3) + sv(3)) (mv(3) + sv(3))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ tl(3) tl(4)], 'YData', [(mv(4) + sv(4)) (mv(4) + sv(4))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ tl(4) tl(5)], 'YData', [(mv(5) + sv(5)) (mv(5) + sv(5))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
% 
line('XData', [ 1 tl(1)], 'YData', [mv(1) mv(1)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ tl(1) tl(2)], 'YData', [mv(2) mv(2)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ tl(2) tl(3)], 'YData', [mv(3) mv(3)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
% line('XData', [ (len1+len2+len3) (len1+len2+len3+len4)], 'YData', [mean(n2) mean(n2)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
% line('XData', [ (len1+len2+len3+len4) (len1+len2+len3+len4+len5)], 'YData', [mean(b2) mean(b2)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
% 
% line('XData', [ 1 len1], 'YData', [(mean(b1) - std(b1)) (mean(b1) - std(b1))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
% line('XData', [ len1 (len1+len2)], 'YData', [(mean(n1) - std(n1)) (mean(n1) - std(n1))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
% line('XData', [ (len1+len2) (len1+len2+len3)], 'YData', [(mean(s) - std(s)) (mean(s) - std(s))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
% line('XData', [ (len1+len2+len3) (len1+len2+len3+len4)], 'YData', [(mean(n2) - std(n2)) (mean(n2) - std(n2))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
% line('XData', [ (len1+len2+len3+len4) (len1+len2+len3+len4+len5)], 'YData', [(mean(b2) - std(b2)) (mean(b2) - std(b2))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
% 
% 
% 
axis([xmin xmax ymin ymax])

end
