close all;
clear all;
load laughter;
%%%%%%In this task we double the sampling rate of the signal.
Fs=8192;
subplot(5,1,1);
specgram(y); title('original signal');%soundsc(y,Fs);

% Create a zero signal z with length twice the one of the original signal.
z=zeros(length(y)*2,1);
z(1:2:end) = y;
subplot(5,1,2);
specgram(z); title('every second element/ doubled signals');
%%soundsc(z,Fs*2);


h=fir1(100,1/2);%%%n FIR filter of order 100 .. from  .. probably 1/L
filtered=filter(h,1,z);%   L, from the lectures filter(a,1,b)
subplot(5,1,3);
specgram(filtered);  title('every second element assigned and filtered');
%FIR filter of order 100 (command fir1)
%%

%%%%TASK 5%%%%TASK 5%%%%TASK 5%%%%TASK 5%%%%TASK 5%%%%TASK 5%%%%TASK 5%%%%
h5 = fir1(100,1/3);% Design an antialiasing filter of order 100.
filtered5=3*conv(h5,z); %Filter the signal z by the filter

subplot(5,1,4);
specgram(filtered5);title(' antialiasing filter');

z5 = filtered5(1:3:end,:); 


%soundsc(z5,5461);%Listen to the result at the sampling rate of 5461 Hz


subplot(5,1,5);
specgram(z5);title('reduced sampling rate 2/3');
