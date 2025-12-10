T = readtable("stardewValleyData.csv");

X = T.Players;

N = length(X);
N_padded = 2^(nextpow2(N));

Y = fft(X, N_padded);

Fs = 0.000277777778;
f2 = Fs*(-N_padded/2:(N_padded/2-1))/N_padded;
Y_shift = fftshift(Y);


figure;
plot(f2,abs(Y_shift));
title("Single-Sided Spectrum of Padded Signal");
xlabel("f (Hz)");
ylabel("|P1(f)|");
