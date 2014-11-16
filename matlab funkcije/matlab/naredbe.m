%Uèitati sc
%Uèitati ecg

frequency=256;

HDR=qrsdetect(ecg,frequency); %alternativno HDR=qrsdetect(ecg,frequency,2);
QRSI_new=HDR.EVENT.POS; 

%save(filename) - treba prilagoditi

% Tu bi se umjesto examine_HDR trebao koristiti program za reanotaciju R zubaca
examine_HDR % nekoliko puta ponovi.
examine_HDR % Ctrl+Break
examine_HDR % Ctrl+Break
examine_HDR % Ctrl+Break
examine_HDR % Ctrl+Break
examine_HDR % Ctrl+Break
examine_HDR % Ctrl+Break
examine_HDR % Ctrl+Break
examine_HDR
detect_missed_qrs
hr_rr_calculation
plot(hr) %plot((1:length(hr))/frequency,hr)

% Treba realizirati dodavanje stimulacija - kada poèinju, kada završavaju,
% koliko traju, koje su klase

% Za raèunanje znaèajki

% data = feature_calculation(stimuli,frequency,window_length,interval,hr,sc,QRSI,add_SCR,add_HRV)
data = feature_calculation(stimuli,frequency,20,1,hr,sc,QRSI_new,1,1);

%save(filename) - treba prilagoditi