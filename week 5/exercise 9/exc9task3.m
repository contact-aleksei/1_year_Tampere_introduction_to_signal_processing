clc;clear;
fc=0.3;fn=0.5;

subplot(2,1,1);
t=-30:30;
h=2*fc*sinc(t*fc);
freqz(h)

subplot(2,1,2);
t=-50:50;
h=2*fc*sinc(t*fc);
freqz(h)
