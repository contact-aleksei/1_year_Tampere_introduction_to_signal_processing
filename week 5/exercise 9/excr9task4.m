clc;clear;
N=50;
fc=9/32;
h=fir1(N-1,2*fc,'low');
figure(1);
freqz(h);
figure(2);
impz(h);