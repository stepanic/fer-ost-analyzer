baseline1 = MEAN_OFFSET_SC_baseline1
neutral1 = MEAN_OFFSET_SC_neutral1
stres = MEAN_OFFSET_SC_stres
neutral2 = MEAN_OFFSET_SC_neutral2
baseline2= MEAN_OFFSET_SC_baseline2

len1 = length(baseline1)
len2 = length(neutral1)
len3 = length(stres)
len4 = length(neutral2)
len5 = length(baseline2)


figure()
plot((1:len1),baseline1)
hold on
line('XData', [len1 len1], 'YData', [-1 120], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
plot(((len1+1):(len1+len2)),neutral1)
line('XData', [(len1+len2) (len1+len2)], 'YData', [-1 120], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
plot(((len1 + len2 +1):(len1+len2+ len3)),stres)
line('XData', [(len1+len2+len3) (len1+len2+len3)], 'YData', [-1 120], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
plot(((len1 + len2 + len3 +1):(len1+len2+ len3 + len4)),neutral2)
line('XData', [(len1+len2+len3+len4) (len1+len2+len3+len4)], 'YData', [-1 120], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
line('XData', [(len1+len2+len3+len4) (len1+len2+len3+len4)], 'YData', [-1 120], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
plot(((len1 + len2 + len3 + len4 +1):(len1+len2+ len3 + len4 + len5)),baseline2)
line('XData', [(len1+len2+len3+len4+len5) (len1+len2+len3+len4+len5)], 'YData', [-1 120], 'LineStyle', '-', 'LineWidth', 2, 'Color','k')
line('XData', [(len1+len2+len3+len4+2) (len1+len2+len3+len4+2)], 'YData', [-1 120], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')


line('XData', [ 1 len1], 'YData', [mean(baseline1) mean(baseline1)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ len1 (len1+len2)], 'YData', [mean(neutral1) mean(neutral1)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ (len1+len2) (len1+len2+len3)], 'YData', [mean(stres) mean(stres)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ (len1+len2+len3) (len1+len2+len3+len4)], 'YData', [mean(neutral2) mean(neutral2)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ (len1+len2+len3+len4) (len1+len2+len3+len4+len5)], 'YData', [mean(baseline2) mean(baseline2)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')


line('XData', [ 1 len1], 'YData', [(mean(baseline1) + std(baseline1)) (mean(baseline1) + std(baseline1))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ len1 (len1+len2)], 'YData', [(mean(neutral1) + std(neutral1)) (mean(neutral1) + std(neutral1))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2) (len1+len2+len3)], 'YData', [(mean(stres) + std(stres)) (mean(stres) + std(stres))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2+len3) (len1+len2+len3+len4)], 'YData', [(mean(neutral2) + std(neutral2)) (mean(neutral2) + std(neutral2))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2+len3+len4) (len1+len2+len3+len4+len5)], 'YData', [(mean(baseline2) + std(baseline2)) (mean(baseline2) + std(baseline2))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')



line('XData', [ 1 len1], 'YData', [(mean(baseline1) - std(baseline1)) (mean(baseline1) - std(baseline1))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ len1 (len1+len2)], 'YData', [(mean(neutral1) - std(neutral1)) (mean(neutral1) - std(neutral1))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2) (len1+len2+len3)], 'YData', [(mean(stres) - std(stres)) (mean(stres) - std(stres))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2+len3) (len1+len2+len3+len4)], 'YData', [(mean(neutral2) - std(neutral2)) (mean(neutral2) - std(neutral2))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')
line('XData', [ (len1+len2+len3+len4) (len1+len2+len3+len4+len5)], 'YData', [(mean(baseline2) - std(baseline2)) (mean(baseline2) - std(baseline2))], 'LineStyle', ':', 'LineWidth', 2, 'Color','r')



axis([0 700 -0.15 0.15])


