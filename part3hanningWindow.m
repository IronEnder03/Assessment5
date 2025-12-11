T = readtable("stardewValleyData.csv");

y = T.Players;

N = length(X);

w = (0.5 - 0.5*cos(2*pi*(0:N-1)./(N))).';
xy = y(:) .* w;

Y_hann = fft(xy);
Fs = 0.000277777778;
f2 = Fs*(-N/2:(N/2-1))/N;
Y_shift_hann = fftshift(Y_hann);


figure;
plot(f2,abs(Y_shift_hann));
title("Hanning Window");
xlabel("f (Hz)");
ylabel("|P1(f)|");
