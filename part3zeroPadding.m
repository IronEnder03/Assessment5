T = readtable("stardewValleyData.csv");

X = T.Players;

L = length(X);
n = 2^(nextpow2(L));

Y = fft(X, n);

Fs = 0.000277777778; % Sampling frequency in Hz
f = Fs*(0:(n/2))/n;
P2 = abs(Y/L);
P1 = P2(1:n/2+1);
P1(2:end-1) = 2*P1(2:end-1);

figure;
plot(f,P1,"-o");
title("Single-Sided Spectrum of Padded Signal");
xlabel("f (Hz)");
ylabel("|P1(f)|");
