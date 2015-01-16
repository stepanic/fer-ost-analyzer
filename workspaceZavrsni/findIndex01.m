function [index] = findIndex01(temp_vB_s)
index = 1;
for num = 1 : length(temp_vB_s)
  if (temp_vB_s(num)== 0)
      index = num;
     break;
  end
end

for num = index : length (temp_vB_s)
    if (temp_vB_s(num) ~= 0)
        index = num;
        break;
    end
end
