baseline1 = ApEn1_baseline1
neutral1 = ApEn1_neutral1
stres = ApEn1_stres
neutral2 = ApEn1_neutral2
baseline2= ApEn1_baseline2

len1 = length(ApEn1_baseline1)
len2 = length(ApEn1_neutral1)
len3 = length(ApEn1_stres)
len4 = length(ApEn1_neutral2)
len5 = length(ApEn1_baseline2)


figure()
plot((1:len1),baseline1)
hold on
line('XData', [len1 len1], 'YData', [0 120], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
plot(((len1+1):(len1+len2)),neutral1)
line('XData', [(len1+len2) (len1+len2)], 'YData', [0 120], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
plot(((len1 + len2 +1):(len1+len2+ len3)),stres)
line('XData', [(len1+len2+len3) (len1+len2+len3)], 'YData', [0 120], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
plot(((len1 + len2 + len3 +1):(len1+len2+ len3 + len4)),neutral2)
line('XData', [(len1+len2+len3+len4) (len1+len2+len3+len4)], 'YData', [0 120], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
line('XData', [(len1+len2+len3+len4) (len1+len2+len3+len4)], 'YData', [0 120], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')
plot(((len1 + len2 + len3 + len4 +1):(len1+len2+ len3 + len4 + len5)),baseline2)
line('XData', [(len1+len2+len3+len4+len5) (len1+len2+len3+len4+len5)], 'YData', [0 120], 'LineStyle', '-', 'LineWidth', 2, 'Color','k')
line('XData', [(len1+len2+len3+len4+2) (len1+len2+len3+len4+2)], 'YData', [0 120], 'LineStyle', '-', 'LineWidth', 2, 'Color','m')


line('XData', [ 1 len1], 'YData', [mean(baseline1) mean(baseline1)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ len1 (len1+len2)], 'YData', [mean(neutral1) mean(neutral1)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ (len1+len2) (len1+len2+len3)], 'YData', [mean(stres) mean(stres)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ (len1+len2+len3) (len1+len2+len3+len4)], 'YData', [mean(neutral2) mean(neutral2)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')
line('XData', [ (len1+len2+len3+len4) (len1+len2+len3+len4+len5)], 'YData', [mean(baseline2) mean(baseline2)], 'LineStyle', '-', 'LineWidth', 2, 'Color','g')

axis([0 700 0.2 1.2])


