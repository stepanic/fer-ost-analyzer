function [new_begin,new_end,s_dur,s_mag,s,Fs] = sdetect2_fun(sc,Fs)

[b,a]=ellip(4,0.1,40,0.05*2/Fs);
scf=filtfilt(b,a,sc);

%w=hanning(25*1250);
%scs=convn(sc,w,'same');



% Startle detection program
% Programmer:Davor Kukolja, Nov 26, 2010

% The signals is "s" the sampling frequency is "Fs"
% the results are s_freq, s_mags and s_dur


s=decimate(sc,8);
Fs=Fs/8; % Fs = 32;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Filter out the high frequency noise %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lgsr=length(s);
lgsr2=lgsr/2;
t=(1:lgsr)/Fs;
[b,a]=ellip(4,0.1,40,4*2/Fs);
[H,w]=freqz(b,a,lgsr); 
sf=filtfilt(b,a,s);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find Skin Conductance Level %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

w=hanning(5*Fs);  %w=hanning(25*Fs);
scl=convn(s,w,'same');
scl=scl/sum(w);

sf_prime=s-scl;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find Significant Startles %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Find zero-crossings
zcross_pos=[];
zcross_neg=[];

overzero=find(sf_prime>0);
zerogaps=diff(overzero);
zcross_pos=overzero(find(zerogaps>1));

belowzero=find(sf_prime<0);
zerogaps=diff(belowzero);
zcross_neg=belowzero(find(zerogaps>1));


for i=1:(length(zcross_pos)-1)
    pom = s(zcross_pos(i):zcross_neg(i));
    [m ibegin(i)] = min(pom);
    ibegin(i) = ibegin(i) + zcross_pos(i) - 1;
    pom = s(zcross_neg(i):zcross_pos(i+1));
    [m iend(i)] = max(pom);
    iend(i) = iend(i) + zcross_neg(i) - 1;
end;


%{
vector=sf_prime;

overthresh=find(vector>thresh); %overthresh is the values at which the segment is over the threshold

gaps=diff(overthresh);

big_gaps=find(gaps>31); %big_gaps returns the indices of gaps that exceed 31
%}

%check the results



new_end=[];
new_begin=[];


for i=1:(length(zcross_pos)-1)
    %%if((iend(i)-ibegin(i))>24) 
        %%if((iend(i)-ibegin(i))>31)
            if((iend(i)-ibegin(i))>71)
    new_begin = [new_begin; ibegin(i)];
    new_end = [new_end; iend(i)];
    end;
end;


s_mag=[];  %initialize a vector of startle magnitudes
s_dur=[];  %initialize a vector of startle durations

for i=1:length(new_end)
    s_dur(i)=new_end(i)-new_begin(i);
    s_mag(i)=s(new_end(i))-s(new_begin(i));
end;
