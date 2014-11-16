function [LF,HF] = calculate_LF_HF(Pxx,f)

LF = 0;
HF = 0;

ind = find(f<=0.04);
i = ind(length(ind));

if (f(i) < 0.04)
    a = (Pxx(i+1)-Pxx(i))/(f(i+1)-f(i));
    LF = (Pxx(i+1)+Pxx(i+1)-a*(f(i+1)-0.04))*(f(i+1)-0.04)/2;
    i = i+1;
end

while (f(i+1) <= 0.15)
    LF = LF + (Pxx(i) + Pxx(i+1))*(f(i+1)-f(i))/2;
    i = i+1;
end

if (f(i) < 0.15)
    a = (Pxx(i+1)-Pxx(i))/(f(i+1)-f(i));
    LF = LF + (Pxx(i)+Pxx(i)+a*(0.15-f(i)))*(0.15-f(i))/2;
end




ind = find(f<=0.15);
i = ind(length(ind));

if (f(i) < 0.15)
    a = (Pxx(i+1)-Pxx(i))/(f(i+1)-f(i));
    HF = (Pxx(i+1)+Pxx(i+1)-a*(f(i+1)-0.15))*(f(i+1)-0.15)/2;
    i = i+1;
end

while (f(i+1) <= 0.4)
    HF = HF + (Pxx(i) + Pxx(i+1))*(f(i+1)-f(i))/2;
    i = i+1;
end

if (f(i) < 0.4)
    a = (Pxx(i+1)-Pxx(i))/(f(i+1)-f(i));
    HF = HF + (Pxx(i)+Pxx(i)+a*(0.4-f(i)))*(0.4-f(i))/2;
end