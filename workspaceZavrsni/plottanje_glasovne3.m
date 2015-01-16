function plottanje_glasovne3(p1, p2, p3)

xmin = 0;
xmax = 5;

ymin = min([min(p1), min(p2), min(p3)]) * 0.99;
ymax = max([max(p1), max(p2), max(p3)]) * 1.01;

figure();
hold on

plot((1:5),p1,'g')
for i=1:5
    plot(i,p1(i),'k*','LineWidth',1)
end

hold on
plot((1:5),p2,'b')
for i=1:5
    plot(i,p2(i),'k*','LineWidth',1)
end

%plottanje_glasovne3(v6_3_1,v6_3_2,v6_3_3)
plot((1:5),p3,'r')
for i=1:5
    plot(i,p3(i),'k*','LineWidth',1)
end


