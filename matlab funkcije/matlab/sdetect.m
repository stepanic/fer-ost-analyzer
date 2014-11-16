Fs=256;

[b,a]=ellip(4,0.1,40,0.05*2/Fs);
scf=filtfilt(b,a,sc);

%w=hanning(25*256);
%scs=convn(sc,w,'same');



% Startle detection program
% Programmer: Jennifer Healey, Dec 13, 1999

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

sf_prime=diff(sf);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find Significant Startles %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Set a threshhold to define significant startle

%thresh=0.005; %thresh=0.003;
%thresh=0.001;
thresh=0.0001;

vector=sf_prime;

overthresh=find(vector>thresh); %overthresh is the values at which the segment is over the threshold

gaps=diff(overthresh);

big_gaps=find(gaps>24); %%big_gaps=find(gaps>31); %big_gaps returns the indices of gaps that exceed 31


%check the results

iend=[];
ibegin=[];

for i=1:length(big_gaps)
    iend=[iend overthresh(big_gaps(i))];
    ibegin=[ibegin overthresh(big_gaps(i)+1)]; 
end;

%%%%%%%%%%%%%%%%%
%% Fine Tuning %%
%%%%%%%%%%%%%%%%%

% The idea being this is to find the zero crossing closet to where it goes 
% over threshold

% find all zero crossings

overzero=find(sf_prime>0);
zerogaps=diff(overzero);
z_gaps=find(zerogaps>1);

iup=[];
idown=[];

for i=1:length(z_gaps)
    idown=[idown overzero(z_gaps(i))];
    iup=[iup overzero(z_gaps(i)+1)];
end;

% find up crossing closest to ibegin

new_begin=[] ;
for i=1:length(ibegin)
    temp=find(iup<ibegin(i));
    %choice=temp(length(temp));
    %new_begin(i)=iup(choice);
    if (isempty(temp))
        new_begin(i)=ibegin(i);
    else
        choice=temp(length(temp));
        new_begin(i)=iup(choice);
    end
end;

% to find the end of the startle, find the maximum between startle
% beginnings

new_end= [] ;

for i=1:(length(new_begin)-1)
    startit=new_begin(i);
    endit=new_begin(i+1);
    [val, loc]=max(s(startit:endit));
    new_end(i)=startit+loc;
end;

if (length(new_begin)>0)
    last_begin=new_begin(length(new_begin));
    [lastval,lastloc]=max(s(last_begin:length(s)-1));
    new_end(length(new_begin))=new_begin(length(new_begin))+lastloc;
end;


s_mag=[];  %initialize a vector of startle magnitudes
s_dur=[];  %initialize a vector of startle durations

for i=1:length(new_end)
    s_dur(i)=new_end(i)-new_begin(i);
    s_mag(i)=s(new_end(i))-s(new_begin(i));
end;

s_freq=length(ibegin);

figure();
plot(t,s);
hold on;
for i=1:length(new_end)
    plot([new_begin(i)/Fs new_end(i)/Fs new_end(i)/Fs], [s(new_begin(i)) s(new_begin(i)) s(new_end(i))],'r')
    plot([new_end(i)/Fs], [s(new_end(i))],'r*')
end;
