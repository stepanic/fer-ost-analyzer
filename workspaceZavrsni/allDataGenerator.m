function [generatedData] = allDataGenerator(b1,n1,s,n2,b2)

mean_values = [mean(b1), mean(n1), mean(s), mean(n2), mean(b2)];
generatedData{1,1} = mean_values;

std_values = [std(b1), std(n1), std(s), std(n2), std(b2)];
generatedData{1,2} = std_values;

[~,p(1)] =  ttest2(b1, n1, 0.05, 'both', 'unequal');
[~,p(2)] =  ttest2(b1, s, 0.05, 'both', 'unequal');
[~,p(3)] =  ttest2(b1, b2, 0.05, 'both', 'unequal');
[~,p(4)] =  ttest2(n1, s, 0.05, 'both', 'unequal');
[~,p(5)] =  ttest2(n1, n2, 0.05, 'both', 'unequal');
[~,p(6)] =  ttest2(s, n2, 0.05, 'both', 'unequal');
[~,p(7)] =  ttest2(s, b2, 0.05, 'both', 'unequal');
[~,p(8)] =  ttest2(n2, b2, 0.05, 'both', 'unequal');
generatedData{1,3} = p;




