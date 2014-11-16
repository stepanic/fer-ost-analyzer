function [SampEn] = Sa_entropy(RR, m, r, N)

if nargin < 4
    N=length(RR);
end

u = zeros(N-m+1, m);

for j=1:(N-m+1)
    for k=0:(m-1)
        u(j,k+1)=RR(j+k);
    end
end

d = zeros(N-m+1, N-m+1);
RR_diff_vec = zeros(1,m);

for j=1:(N-m+1)
    for k=1:(N-m+1)
        for n=0:(m-1)
            RR_diff_vec(n+1)=RR(j+n)-RR(k+n);
        end
        d(j,k)=max(abs(RR_diff_vec));
    end
end

C = zeros(1,N-m+1);

for j=1:(N-m+1)
    nbr=0;
    for k=1:(N-m+1)
        if k==j
            continue;
        end
        if d(j,k)<=r
            nbr=nbr+1;
        end
    end
    C(j)=nbr;
end

C = C/(N-m);

C_m = sum(C)/(N-m+1);



m = m+1;


u = zeros(N-m+1, m);

for j=1:(N-m+1)
    for k=0:(m-1)
        u(j,k+1)=RR(j+k);
    end
end

d = zeros(N-m+1, N-m+1);
RR_diff_vec = zeros(1,m);

for j=1:(N-m+1)
    for k=1:(N-m+1)
        for n=0:(m-1)
            RR_diff_vec(n+1)=RR(j+n)-RR(k+n);
        end
        d(j,k)=max(abs(RR_diff_vec));
    end
end

C = zeros(1,N-m+1);

for j=1:(N-m+1)
    nbr=0;
    for k=1:(N-m+1)
        if k==j
            continue;
        end
        if d(j,k)<=r
            nbr=nbr+1;
        end
        C(j)=nbr;
    end
end

C = C/(N-m);

C_m1 = sum(C)/(N-m+1);



SampEn = log(C_m / C_m1);