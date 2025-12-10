N = 726;
Fs = 0.000277777778;
F_low = Fs / 4;
F_high = Fs / 3;


response = ideal_bandpass(726, Fs, F_low, F_high);



function [H, F] = ideal_bandpass(N, sampling_freq, low_freq, high_freq)
Wn = [low_freq, high_freq] / (sampling_freq/2);

[b, a] = butter(5, Wn, 'bandpass');

[H, F] = freqz(b, a, N, sampling_freq);
end


plot(response(2), abs(response(1)));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Ideal Bandpass Filter Response');
grid on;