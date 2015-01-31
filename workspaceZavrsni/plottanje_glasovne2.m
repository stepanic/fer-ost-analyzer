%primjer pozivanja funkcije

%plottanje(decimate(HR_b1,8),decimate(HR_n1,8),decimate(HR_s,8),decimate(HR_n2,8),decimate(HR_b2,8))

%plottanje(decimate(GSR_b1,256),decimate(GSR_n1,256),decimate(GSR_s,256),decimate(GSR_n2,256),decimate(GSR_b2,256))
function plottanje_glasovne2(b1, n1, s, n2, b2)

len1 = length(b1);
len2 = length(n1);
len3 = length(s);
len4 = length(n2);
len5 = length(b2);

mean1 = mean(b1(~isnan(b1)));
mean2 = mean(n1(~isnan(n1)));
mean3 = mean(s(~isnan(s)));
mean4 = mean(n2(~isnan(n2)));
mean5 = mean(b2(~isnan(b2)));

std1 = std(b1(~isnan(b1)));
std2 = std(n1(~isnan(n1)));
std3 = std(s(~isnan(s)));
std4 = std(n2(~isnan(n2)));
std5 = std(b2(~isnan(b2)));

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


line('XData', [ 1 len1], 'YData', [(mean1 + std1) (mean1 + std1)], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ len1 (len1+len2)], 'YData', [(mean2 + std2) (mean2 + std2)], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2) (len1+len2+len3)], 'YData', [(mean3 + std3) (mean3 + std3)], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2+len3) (len1+len2+len3+len4)], 'YData', [(mean4 + std4) (mean4 + std4)], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2+len3+len4) (len1+len2+len3+len4+len5)], 'YData', [(mean5 + std5) (mean5 + std5)], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')

line('XData', [ 1 len1], 'YData', [mean1 mean1], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ len1 (len1+len2)], 'YData', [mean2 mean2], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ (len1+len2) (len1+len2+len3)], 'YData', [mean3 mean3], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ (len1+len2+len3) (len1+len2+len3+len4)], 'YData', [mean4 mean4], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ (len1+len2+len3+len4) (len1+len2+len3+len4+len5)], 'YData', [mean5 mean5], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')

line('XData', [ 1 len1], 'YData', [(mean1 - std1) (mean1 - std1)], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ len1 (len1+len2)], 'YData', [(mean2 - std2) (mean2 - std2)], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2) (len1+len2+len3)], 'YData', [(mean3 - std3) (mean3 - std3)], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2+len3) (len1+len2+len3+len4)], 'YData', [(mean4 - std4) (mean4 - std4)], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2+len3+len4) (len1+len2+len3+len4+len5)], 'YData', [(mean5 - std5) (mean5 - std5)], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')



axis([xmin xmax ymin ymax])

end

