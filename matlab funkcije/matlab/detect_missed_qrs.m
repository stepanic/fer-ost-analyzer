RR_MISSED_LIMIT = 1.66;

QRSI = QRSI_new;
QRS_marker = zeros(length(QRSI),1);

RR=(QRSI(2:length(QRSI))-QRSI(1:length(QRSI)-1))*1000/frequency; %RR u milisekundama

RR_selected = [RR(1) RR(2) RR(3) RR(4) RR(5) RR(6) RR(7) RR(8)];
RR_mean = mean(RR_selected);

for i = 9:length(RR)
    if RR(i) > RR_mean*RR_MISSED_LIMIT;
        QRS_marker(i) = 1;
    else
        RR_selected = [RR_selected(2) RR_selected(3) RR_selected(4) RR_selected(5) RR_selected(6) RR_selected(7) RR_selected(8) RR(i)];
        RR_mean = mean(RR_selected);
    end
end

l=5000;

for i = 1:length(ecg)/l

    hold off;

    ind = find(((1+(i-1)*l) <= QRSI_new) & (QRSI_new <= (i*l)));
    ind_missed = find(1 == QRS_marker);

    plot(1+(i-1)*l:i*l,ecg(1+(i-1)*l:i*l));
    hold on;
    plot(QRSI_new(ind),ecg(QRSI_new(ind)),'r*');
    plot(QRSI_new(ind_missed),ecg(QRSI_new(ind_missed)),'go');
    xlim([1+(i-1)*l-100,i*l+100])

    in = input('');

end


clear QRSI;
clear RR_MISSED_LIMIT;
clear i;
clear ind;
clear ind_missed;
clear in;
clear RR_selected;
clear RR_mean;
clear l;