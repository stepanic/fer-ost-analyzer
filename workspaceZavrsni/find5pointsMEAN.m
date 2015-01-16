function [points] = find5pointsMEAN(temp_jL_s,tempIndex)
p1 = 0;
p2 = 0;
p3 = 0;
p4 = 0;
p5 = 0;

if((tempIndex + 81) < length(temp_jL_s))
    p1 = mean(temp_jL_s(tempIndex : tempIndex + 81));
    tempIndex = tempIndex + 81;
end

if((tempIndex + 81) < length(temp_jL_s))
    p2 = mean(temp_jL_s(tempIndex : tempIndex + 81));
    tempIndex = tempIndex + 81;
end
if((tempIndex + 81) < length(temp_jL_s))
    p3 = mean(temp_jL_s(tempIndex : tempIndex + 81));
    tempIndex = tempIndex + 81;
end
if((tempIndex + 81) < length(temp_jL_s))
    p4 = mean(temp_jL_s(tempIndex : tempIndex + 81));
    tempIndex = tempIndex + 81;
end
if((tempIndex + 81) < length(temp_jL_s))
    p5 = mean(temp_jL_s(tempIndex : tempIndex + 81));
end

p1(p1 == 0) = NaN;
p2(p2 == 0) = NaN;
p3(p3 == 0) = NaN;
p4(p4 == 0) = NaN;
p5(p5 == 0) = NaN;

points = [p1 p2 p3 p4 p5]