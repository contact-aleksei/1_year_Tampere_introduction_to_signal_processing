Z = [0.0122 0.0226 0.0298 0.0204 0.0099];
P = [1 -0.9170 0.0540 -0.2410 0.1990];

figure(1);
subplot(2,1,1); zplane(Z,P); title("LTI system");
subplot(2,1,2); zplane(P,Z); title("LTI inverse system");

figure(2); freqz(Z,P);title("LTI system");

figure(3); freqz(P,Z);title("LTI inverse system");

figure(4); 
subplot(2,1,1); impz(Z,P); title("LTI system")
subplot(2,1,2); impz(P,Z); title("LTI inverse system")

load handel

 figure(5);
 subplot(3,1,1);
 FH= filter(Z,P,y); spectrogram(FH); title("Filtered with H")
 subplot(3,1,2);
 FinvH = filter(P,Z,FH); spectrogram(FinvH);  title("Filtered with inv H")
 subplot(3,1,3);
 spectrogram(y);  title("Original signal")
