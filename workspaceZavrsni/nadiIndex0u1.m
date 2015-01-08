function [index] = nadiIndex0u1(tempVadBin)
    len = length(tempVadBin);
    for i = 1 : len
        if tempVadBin{i} == 0
            a = i;
            break;
        end
    end
    for j = a : len
        if tempVadBin{j} == 1
            index = j;
            break;
        end
    end
    



