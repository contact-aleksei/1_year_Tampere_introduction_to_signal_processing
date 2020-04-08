close all;
clear all;

% Butterworth TASK 2
fsn = 2*4000/40000;
fpn = 2*7000/40000;
Rp = 0.3;
Rs = 45;
Fs = 40000;
[N,Wn] = buttord(fpn,fsn,Rp,Rs);
[a,b] = butter(N, Wn, 'Low');


figure(1); impz(a,b);             title("Butterworth impulse response");
figure(2); freqz(a,b);            title("Butterworth amplitude response");
figure(3); zplane(a,b);           title("Butterworth pole-zero plor");

%%%%%%%%%%%%%%%%%%%%% TASK 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[b,a] = design_lowpass(9000, 12500, 0.4, 25, 32000);
figure(4); freqz(b,a);            title("TASK 5 frequency response");
figure(5); zplane(b,a);           title("TASK 5 poles and zeros");



