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
z1 = filtered1(1:3:end);
filtered1 = 3*conv(h1,filtered)
soundsc(z1,5461)

subplot(3,1,1)
spectrogram (filtered,2*Fs); 
subplot(3,1,2)
spectrogram (filtered1,2*Fs); 
subplot(3,1,3)
spectrogram (z1,5461);