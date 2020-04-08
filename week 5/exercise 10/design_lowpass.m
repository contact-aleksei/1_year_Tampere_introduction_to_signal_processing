function [N,D] = design_lowpass(fp, fs, rp, rs, Fs)

Ws = 2*pi*fs/Fs;
Wp= 2*pi*fp/Fs;
c = 1/(tan(Wp/2));

OMEGAp=1;
OMEGAs = c*tan(Ws/2);

e = sqrt(10^(rp/10) - 1);
A = sqrt(10^(rs/10));

M = ceil((log10((A^2 - 1)/e^2))/(2*log10(OMEGAs)));

k = 1:1:M;
p(k) = 1/(e^(1/M))*(exp(pi*1i*(0.5 + (2*k-1)/(2*M))));

pdif(k) = (1 + p(k)/c)./(1-p(k)/c)
z = -1.*ones(M,1);
[N,D]= zp2tf(z,pdif(k),1);
K = sum(N)/sum(D);
N = N./K;
end
