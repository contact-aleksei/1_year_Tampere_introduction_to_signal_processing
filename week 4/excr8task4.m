
t=0:1/8192:4;
y=chirp(t,0,1,1000);
b = [0.0675 0.1349 0.0675];
a = [1 -1.143 0.4128];
y1 = filter(b,a,y);

soundsc(y);
pause(3);
soundsc(y1);

figure(1);
subplot(2,1,1);
spectrogram(y); title("Original signal");
subplot(2,1,2);
spectrogram(y1);title("Filtered signal");

figure(2); freqz(b,a); title("Amplitude response of the filter");
