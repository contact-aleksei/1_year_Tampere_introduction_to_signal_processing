load handel;

Fs=8192;
%soundsc(outhi);


figure(1);
h=fir1(50,1100/8000,'low');
outhi = filter(h,1,y);
freqz(h);
%soundsc(outhi);

figure(3);
h=fir1(50,1650/8000,'high');
freqz(h);
outhi = filter(h,1,y);

soundsc(outhi);

figure(5);
h=fir1(50,[1750/8000 3250/8000],'bandpass');
freqz(h);

%soundsc(outhi);

figure(7);
h=fir1(50,[625/8000 2750/8000],'stop');
freqz(h);

%soundsc(outhi);






