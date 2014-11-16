t=QRSI_new(2:length(QRSI_new));

index=find(QRS_marker==0);
index=index(1:length(index)-1);

RR_new = RR(index);
t_new = t(index);

tt = (1:length(ecg));
interpolated_rr = spline(t_new',RR_new',tt);




hrs=1./interpolated_rr*1000*60;



%{
t=QRSI_new(2:length(QRSI_new));

index=find(QRS_marker==0);
index=index(1:length(index)-1);

RR_new = RR(index);
t_new = t(index)/frequency;

fi=8;

tt = 0:1/fi:ceil(length(ecg)/frequency);
interpolated_rr = spline(t_new',RR_new',tt);




QRSI_for_diff=[];
RR_for_diff=[];
RR_diff=[];

QRSI_chunk=[];

for i=1:length(QRSI_new)
    QRSI_chunk=[QRSI_chunk; QRSI_new(i)];
    if ((QRS_marker(i)==1) || (i==length(QRSI_new)))
        if length(QRSI_chunk)>2
            RR_chunk = (QRSI_chunk(2:length(QRSI_chunk))-QRSI_chunk(1:length(QRSI_chunk)-1))*1000/frequency; %RR u milisekundama
            RR_for_diff = [RR_for_diff;RR_chunk];
            
            RR_diff_chunk = diff(RR_chunk);
            RR_diff = [RR_diff; RR_diff_chunk];
        end
        QRSI_chunk=[];
    end
end
%}


hr=zeros(length(ecg),1);


j=1;
a=-1;

for i=1:length(ecg)

    hr(i) = a;
    if j<=length(t_new)
        if i>=t_new(j);
            a=1/RR_new(j)*1000*60;
            j=j+1;
        end
    end

end


%{
plot(ecg);
hold on;
plot(QRSI_new,ecg(QRSI_new),'r*');
ind_missed = find(1 == QRS_marker);
plot(QRSI_new(ind_missed),ecg(QRSI_new(ind_missed)),'go');
plot(hr,'r');
plot(hrs,'g');
%}

clear a;
clear hrs;
clear i;
clear ind_missed;
clear index;
clear j;
clear t;
clear t_new;
clear tt;