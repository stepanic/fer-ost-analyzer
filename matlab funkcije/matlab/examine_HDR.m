for i = 1:3

    if QRSI_new(i)<11
        [m ind]=max(ecg(1:QRSI_new(i)+10));
        QRSI_new(i)=ind;
    else
        [m ind]=max(ecg(QRSI_new(i)-10:QRSI_new(i)+10));
        QRSI_new(i)=QRSI_new(i)+ind-11;
    end

end

for i = 4:length(QRSI_new)-4

    [m ind]=max(ecg(QRSI_new(i)-10:QRSI_new(i)+10));
    QRSI_new(i)=QRSI_new(i)+ind-11;

end

for i = length(QRSI_new)-3:length(QRSI_new)

    if QRSI_new(i)>length(ecg)-10
        [m ind]=max(ecg(QRSI_new(i)-10:length(ecg)));
        QRSI_new(i)=QRSI_new(i)+ind-11;
    else
        [m ind]=max(ecg(QRSI_new(i)-10:QRSI_new(i)+10));
        QRSI_new(i)=QRSI_new(i)+ind-11;
    end

end



for i = 1:length(QRSI_new)-1

    if (QRSI_new(i)==QRSI_new(i+1))
        QRSI_new(i)=0;
    end

end

sort(QRSI_new);
index=find(QRSI_new);
QRSI_new=QRSI_new(index);


l=5000;

for i = 1:length(ecg)/l

    hold off;

    ind = find(((1+(i-1)*l-100) <= QRSI_new) & (QRSI_new <= (i*l)+100));

    plot(1+(i-1)*l:i*l,ecg(1+(i-1)*l:i*l));
    hold on;
    plot(QRSI_new(ind),ecg(QRSI_new(ind)),'r*');
    xlim([1+(i-1)*l-100,i*l+100])

    thr = input('Enter ili Threshold: ')

    if (~isempty(thr))

        if (thr~=0)

            j=ind(1);
            while j<=(ind(length(ind)))
                if ecg(QRSI_new(j))<thr
                    QRSI_new(j)=0;
                end
                j=j+1;
            end

            sort(QRSI_new);
            index=find(QRSI_new);
            QRSI_new=QRSI_new(index);

        else

            j = input('Dalje/Brisanje/Dodavanje ')

            if j==1

                ind = find(((1+(i-1)*l) <= QRSI_new) & (QRSI_new <= (i*l)));
                pom = 0;

                for k = ind(1):ind(length(ind))

                    k = k-pom;

                    hold off;
                    plot(1+(i-1)*l:i*l,ecg(1+(i-1)*l:i*l));
                    hold on;
                    plot(QRSI_new(ind),ecg(QRSI_new(ind)),'r*');
                    plot(QRSI_new(k),ecg(QRSI_new(k)),'g*');
                    xlim([1+(i-1)*l-100,i*l+100])

                    b = input('Brisanje ')

                    if b==0
                        break;
                    end

                    if b==1
                        QRSI_new(k)=0;
                        sort(QRSI_new);
                        index=find(QRSI_new);
                        QRSI_new=QRSI_new(index);

                        pom=pom+1;
                    end

                end



            end

            if j==2
                index = input('Unesi vrijednost ')

                while 1==1

                    hold off;
                    plot(1+(i-1)*l:i*l,ecg(1+(i-1)*l:i*l));
                    hold on;
                    plot(QRSI_new(ind),ecg(QRSI_new(ind)),'r*');
                    plot(index,ecg(index),'g*');
                    xlim([1+(i-1)*l-100,i*l+100])

                    k = input('Pomak ')
                    if k==0
                        k = input('Dodati ')
                        if k==1
                            QRSI_new=union(QRSI_new,index);
                        end
                        k = input('Zavrsiti ')
                        if k==1
                            break;
                        else
                            index = input('Unesi vrijednost ')
                        end
                    end
                    index = index+k;
                end

            end


        end

    end

end




clear ans;
clear i;
clear ind;
clear index;
clear j;
clear k;
clear l;
clear m;
clear thr;