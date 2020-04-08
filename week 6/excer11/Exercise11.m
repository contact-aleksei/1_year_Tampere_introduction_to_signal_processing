load laughter
display(y);
z=zeros(length(y)*2,1);
z(1:2:end) = y; 
%soundsc(y,Fs);
subplot(3,1,1)
spectrogram (y, Fs); 
pause(3)
%soundsc(z,2*Fs);
subplot(3,1,2)

h = fir1(100,1/2);
filtered = 2*conv(h,z);
spectrogram (filtered,Fs);
pause(3)
soundsc(filtered,2*Fs);
subplot(3,1,3)
spectrogram (z, Fs); 

%% Task 5 
load laughter
h1 = fir1(100,1/3);
filtered1 = 3*conv(h1,z)
figure(2)
subplot(211)


spectrogram(fi1tered1,256,255,512,1/3*Fs,'yaxis');
z1 = filtered1(1:3:end);
soundsc(z1,5461)
subplot(212)
spectrogram(z1,256,255,512,1/3*Fs,'yaxis');