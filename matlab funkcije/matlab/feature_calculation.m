function [calculated_features] = feature_calculation(stimuli,frequency,window_length,interval,hr,sc,QRSI,add_SCR,add_HRV)
% izraèunavanje znaèajki

% stimuli - podaci o stimulacijama
% frequency - frekvencija
% window_length - duljina prozora za izraèun znaèajki (u sekundama)
% interval - vremenski interval izmeðu dva  uzoraka (u sekundama)
% hr - heart rate
% sc - vodljivost kože
% QRSI - indeksi QRS kompleksa
% add_SCR - da li se dodaju znaèajke odgovora vodljivosti kože
% add_HRV - da li se dodaju mjere varijabilnosti srèanog pulsa

% data - podaci za analizu


signal_number = 2; % signal_number - broj fizioloških signala korištenih za raèunanje znaèajki
signals = {'hr','sc'}; % signal_number - broj fizioloških signala korištenih za raèunanje znaèajki oznake fizioloških signala korištenih za raèunanje znaèajki


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% obrada podataka %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


ph_signals(:,1) = hr;
ph_signals(:,2) = sc;


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% podaci za analizu %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

calculated_features.data.features=[];
calculated_features.data.class=[];

data=[];

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% podaci za analizu %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

calculated_features.number_of_samples = 0;

calculated_features.number_of_features=14*signal_number;


for k=1:signal_number

    features=[];
    class=[];

    ph_signal=ph_signals(:,k);


    % izvlaèenje znaèajki iz signala
    for l=1:stimuli.number


        temp2=stimuli.start(l)*frequency;


        number_of_samples=floor((stimuli.duration(l)-window_length)/interval)+1;

        calculated_features.number_of_samples=calculated_features.number_of_samples+number_of_samples;

        for m=1:number_of_samples

            ph_mean=mean(ph_signal(round(temp2+1+(m-1)*interval*frequency):round(temp2+(m-1)*interval*frequency+window_length*frequency)));
            ph_std=std(ph_signal(round(temp2+1+(m-1)*interval*frequency):round(temp2+(m-1)*interval*frequency+window_length*frequency)));
            ph_mean_fd=(-ph_signal(round(temp2+1+(m-1)*interval*frequency))+ph_signal(round(temp2+(m-1)*interval*frequency+window_length*frequency)))/(window_length-1/frequency);
            ph_min=min(ph_signal(round(temp2+1+(m-1)*interval*frequency):round(temp2+(m-1)*interval*frequency+window_length*frequency)));
            ph_max=max(ph_signal(round(temp2+1+(m-1)*interval*frequency):round(temp2+(m-1)*interval*frequency+window_length*frequency)));
            ph_mean_diff=ph_mean-mean(ph_signal(round(temp2+1+(m-2)*interval*frequency):round(temp2+(m-2)*interval*frequency+window_length*frequency)));
            ph_mean_offset=mean(ph_signal(round(temp2+1+(m-1)*interval*frequency):round(temp2+(m-1)*interval*frequency+window_length*frequency)))-ph_signal(round(temp2+(m-1)*interval*frequency));
            ph_min_offset=min(ph_signal(round(temp2+1+(m-1)*interval*frequency):round(temp2+(m-1)*interval*frequency+window_length*frequency)))-ph_signal(round(temp2+(m-1)*interval*frequency));
            ph_max_offset=max(ph_signal(round(temp2+1+(m-1)*interval*frequency):round(temp2+(m-1)*interval*frequency+window_length*frequency)))-ph_signal(round(temp2+(m-1)*interval*frequency));
            ph_mean_fd_diff=ph_mean_fd-(-ph_signal(round(temp2+1+(m-1)*interval*frequency-window_length*frequency))+ph_signal(round(temp2+(m-1)*interval*frequency)))/(window_length-1/frequency);
            ph_std_diff=ph_std-std(ph_signal(round(temp2+1+(m-1)*interval*frequency-window_length*frequency):round(temp2+(m-1)*interval*frequency)));

            ph_mean_abs_fd=mean(abs(diff(ph_signal(round(temp2+1+(m-1)*interval*frequency):round(temp2+(m-1)*interval*frequency+window_length*frequency)))));
            ph_mean_abs_fd2=mean(abs((ph_signal(round(temp2+1+(m-1)*interval*frequency+2):round(temp2+(m-1)*interval*frequency+window_length*frequency))-ph_signal(round(temp2+1+(m-1)*interval*frequency):round(temp2+(m-1)*interval*frequency+window_length*frequency-2)))));


            features=[features; ...
                ph_mean ph_std ph_mean_fd ph_min ph_max ph_mean_diff (ph_max-ph_min) ...
                ph_mean_offset ph_min_offset ph_max_offset ph_mean_fd_diff ph_std_diff ...
                ph_mean_abs_fd ph_mean_abs_fd2];

            class=[class; stimuli.class(l)];

        end

    end

    data=[data,features];

end


calculated_features.data.class=[calculated_features.data.class; class];
calculated_features.data.features=[calculated_features.data.features;data];



if (add_SCR == 1)

    calculated_features.number_of_features = calculated_features.number_of_features + 6;
    SCR_features = [];
    
    calculated_features.number_of_samples=0;

    % %% detekcija SCR
    [new_begin1,new_end1,s_dur1,s_mag1,s,Fs_s] = sdetect_fun(sc,frequency);
    [new_begin,new_end,s_dur,s_mag,s,Fs_s] = sdetect2_fun(sc,frequency);

    % IZNIMKA - ako nije detektiran niti jedan SCR - dodati jedan na sami kraj
    if (isempty(new_end))
        new_begin = length(sc)/frequency*Fs_s;
        new_end = new_begin+1;
        s_dur = 1;
        s_mag = 1;
    end

    % %% uzeti detekcije SCRa na temelju funkcije sdetect2 te dodati detekcije na temelju funkcije sdetect za zadnjih 5 sekundi

    sdetect_last = new_end(length(new_end));

    for i=1:length(new_end1)
        if (sdetect_last < new_begin1(i))
            new_begin=[new_begin; new_begin1(i)];
            new_end=[new_end; new_end1(i)];
            s_dur=[s_dur s_dur1(i)];
            s_mag=[s_mag s_mag1(i)];
        end
    end


    for l=1:stimuli.number

        temp2=stimuli.start(l)*Fs_s;

        number_of_samples=floor((stimuli.duration(l)-window_length)/interval)+1;

        calculated_features.number_of_samples=calculated_features.number_of_samples+number_of_samples;

        for m=1:number_of_samples

            set1 = find((new_begin >= round(temp2+1+(m-1)*interval*Fs_s)));
            set2 = find(new_begin < (temp2+(m-1)*interval*Fs_s+window_length*Fs_s));
            SCR_index = intersect(set1,set2);

            s_dur_stim = s_dur(SCR_index);
            s_mag_stim = s_mag(SCR_index);
                
            
            % features
            if (isempty(s_dur_stim))
                SCR_features = [SCR_features;...
                    0 0 0 0 0 0];
            else
                SCR_features = [SCR_features;...
                    length(s_dur_stim)/window_length max(s_mag_stim) mean(s_mag_stim) s_mag_stim(1) mean(s_dur_stim) ...
                    sum(s_mag_stim.*s_dur_stim)/window_length];

            end

        end

    end

    calculated_features.data.features=[calculated_features.data.features SCR_features];

end










if (add_HRV == 1)

    calculated_features.number_of_features = calculated_features.number_of_features + 16;
    HRV_features = [];
    calculated_features.number_of_samples=0;





    RR_MISSED_LIMIT = 1.66;

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







    t=QRSI(2:length(QRSI));

    index=find(QRS_marker==0);
    index=index(1:length(index)-1);

    RR_new = RR(index);

    % detrend

    z = RR_new; %z = RR_new';
    T = length(z);
    lambda = 10;
    I = speye(T);
    D2 = spdiags(ones(T-2,1)*[1 -2 1],[0:2],T-2,T);
    z_stat = (I-inv(I+lambda^2*D2'*D2))*z;

    RR_new = z_stat;
    t_new = t(index)/frequency;

    fi=8;

    tt = 0:1/fi:ceil(length(hr)/frequency);
    interpolated_rr = spline(t_new',RR_new',tt);






    %{
    RR=(QRSI(2:length(QRSI))-QRSI(1:length(QRSI)-1))*1000/frequency; %RR u milisekundama

    % detrend

    z = RR; %z = RR';
    T = length(z);
    lambda = 10;
    I = speye(T);
    D2 = spdiags(ones(T-2,1)*[1 -2 1],[0:2],T-2,T);
    z_stat = (I-inv(I+lambda^2*D2'*D2))*z;

    RR = z_stat;


    t=QRSI(2:length(QRSI))/frequency;

    fi=8;

    tt = 0:1/fi:stimuli.stop;
    interpolated_rr = spline(t,RR,tt);
    %}

    % izvlaèenje znaèajki
    for l=1:stimuli.number

        temp2=stimuli.start(l)*fi;
        temp3=stimuli.start(l)*frequency;

        number_of_samples=floor((stimuli.duration(l)-window_length)/interval)+1;

        calculated_features.number_of_samples=calculated_features.number_of_samples+number_of_samples;

        for m=1:number_of_samples

            index = round(temp2+(m-1)*interval*fi+window_length*fi);
            if (index > length(interpolated_rr))
                index = length(interpolated_rr);
            end

            rr=interpolated_rr(round(temp2+1+(m-1)*interval*fi):index);
            [Pxx,f] = pburg(rr,20,fi*1000,fi);
            [LF,HF] = calculate_LF_HF(Pxx,f);


            set1 = find(QRSI>round(temp3+1+(m-1)*interval*frequency));
            set2 = find(QRSI<round(temp3+(m-1)*interval*frequency+window_length*frequency));
            QRS_index = intersect(set1,set2);


            RR_for_diff=[];
            RR_diff=[];

            QRSI_chunk=[];

            for i=min(QRS_index):max(QRS_index)
                QRSI_chunk=[QRSI_chunk; QRSI(i)];
                if ((QRS_marker(i)==1) || (i==max(QRS_index)))
                    if length(QRSI_chunk)>2
                        RR_chunk = (QRSI_chunk(2:length(QRSI_chunk))-QRSI_chunk(1:length(QRSI_chunk)-1))*1000/frequency; %RR u milisekundama
                        RR_for_diff = [RR_for_diff;RR_chunk];

                        RR_diff_chunk = diff(RR_chunk);
                        RR_diff = [RR_diff; RR_diff_chunk];
                    end
                    QRSI_chunk=[];
                end
            end
            N = length(RR_diff);

            SDNN = std(RR_for_diff);
            SDSD = std(RR_diff);
            RMSSD = sqrt(sum(RR_diff.*RR_diff)/(N));
            RR50 = find(abs(RR_diff)>50);
            PNN50 = length(RR50)/(N)*100;
            RR20 = find(abs(RR_diff)>20);
            PNN20 = length(RR20)/(N)*100;

            meanRR = mean(RR_for_diff);
            meanHR = mean(hr(round(temp3+1+(m-1)*interval*frequency):round(temp3+(m-1)*interval*frequency+window_length*frequency)));
            stdHR = std(hr(round(temp3+1+(m-1)*interval*frequency):round(temp3+(m-1)*interval*frequency+window_length*frequency)));

            FF = SDNN * SDNN / meanRR;
            r=0.15*SDNN;
            ApEn1 = Ap_entropy(RR_for_diff, 1, r);
            ApEn2 = Ap_entropy(RR_for_diff, 2, r);
            ApEn3 = Ap_entropy(RR_for_diff, 3, r);
            ApEn4 = Ap_entropy(RR_for_diff, 4, r);
            SampEn = Sa_entropy(RR_for_diff, 2, r);


            HRV_features=[HRV_features; ...
                LF LF/(LF+HF) HF HF/(LF+HF) LF/HF SDNN SDSD RMSSD PNN50 PNN20 ...
                FF ApEn1 ApEn2 ApEn3 ApEn4 SampEn];
        end

    end

    calculated_features.data.features=[calculated_features.data.features HRV_features];

end





% odreðivanje parametara za normiranje podataka

calculated_features.data.max=max(calculated_features.data.features);
calculated_features.data.min=min(calculated_features.data.features);