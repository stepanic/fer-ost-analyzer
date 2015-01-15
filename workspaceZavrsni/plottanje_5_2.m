%primjer pozivanja funkcije

%plottanje(decimate(HR_b1,8),decimate(HR_n1,8),decimate(HR_s,8),decimate(HR_n2,8),decimate(HR_b2,8))

%plottanje(decimate(GSR_b1,256),decimate(GSR_n1,256),decimate(GSR_s,256),decimate(GSR_n2,256),decimate(GSR_b2,256))
function plottanje(b1, n1, s, n2, b2)

len1 = length(b1);
len2 = length(n1);
len3 = length(s);
len4 = length(n2);
len5 = length(b2);

xmin = 0;
xmax = len1 + len2 + len3 + len4 + len5;

ymin = min([min(b1), min(n1), min(s), min(n2), min(b2)]) * 0.99;
ymax = max([max(b1), max(n1), max(s), max(n2), max(b2)]) * 1.01;

figure();
hold on

plot((1:len1),b1)
hold on
line('XData', [len1 len1], 'YData', [ymin ymax], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
plot(((len1+1):(len1+len2)),n1)
line('XData', [(len1+len2) (len1+len2)], 'YData', [ymin ymax], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
plot(((len1 + len2 +1):(len1+len2+ len3)),s)
line('XData', [(len1+len2+len3) (len1+len2+len3)], 'YData', [ymin ymax], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
plot(((len1 + len2 + len3 +1):(len1+len2+ len3 + len4)),n2)
line('XData', [(len1+len2+len3+len4) (len1+len2+len3+len4)], 'YData', [ymin ymax], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
plot(((len1 + len2 + len3 + len4 +1):(len1+len2+ len3 + len4 + len5)),b2)
line('XData', [(len1+len2+len3+len4+len5) (len1+len2+len3+len4+len5)], 'YData', [ymin ymax], 'LineStyle', '-', 'LineWidth', 2, 'Color','k')
line('XData', [(len1+len2+len3+len4+2) (len1+len2+len3+len4+2)], 'YData', [ymin ymax], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')

b1 = b1(11:length(b1) - 10);
n1 = n1(11:length(b1) - 10);
s = s(11:length(b1) - 10);
n2 = n2(11:length(b1) - 10);
b2 = b2(11:length(b1) - 10);

line('XData', [ 1 len1], 'YData', [(mean(b1) + std(b1)) (mean(b1) + std(b1))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ len1 (len1+len2)], 'YData', [(mean(n1) + std(n1)) (mean(n1) + std(n1))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2) (len1+len2+len3)], 'YData', [(mean(s) + std(s)) (mean(s) + std(s))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2+len3) (len1+len2+len3+len4)], 'YData', [(mean(n2) + std(n2)) (mean(n2) + std(n2))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2+len3+len4) (len1+len2+len3+len4+len5)], 'YData', [(mean(b2) + std(b2)) (mean(b2) + std(b2))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')

line('XData', [ 1 len1], 'YData', [mean(b1) mean(b1)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ len1 (len1+len2)], 'YData', [mean(n1) mean(n1)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ (len1+len2) (len1+len2+len3)], 'YData', [mean(s) mean(s)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ (len1+len2+len3) (len1+len2+len3+len4)], 'YData', [mean(n2) mean(n2)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ (len1+len2+len3+len4) (len1+len2+len3+len4+len5)], 'YData', [mean(b2) mean(b2)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')

line('XData', [ 1 len1], 'YData', [(mean(b1) - std(b1)) (mean(b1) - std(b1))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ len1 (len1+len2)], 'YData', [(mean(n1) - std(n1)) (mean(n1) - std(n1))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2) (len1+len2+len3)], 'YData', [(mean(s) - std(s)) (mean(s) - std(s))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2+len3) (len1+len2+len3+len4)], 'YData', [(mean(n2) - std(n2)) (mean(n2) - std(n2))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2+len3+len4) (len1+len2+len3+len4+len5)], 'YData', [(mean(b2) - std(b2)) (mean(b2) - std(b2))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')



axis([xmin xmax ymin ymax])

end

