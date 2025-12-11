data = readtable("stardewValleyData.csv");
x = data.Players;
N = length(x);
Fs = 1;                

Fc = 0.01;           

H = ideal_lowpass(N, Fs, Fc);

X = fft(x);
X = fftshift(X);

Y = X .* H';

t = (0:N-1);
y_filtered = ifft(ifftshift(Y));
y_adjusted = real(y_filtered);   

figure;
plot(t, x, 'b', 'LineWidth', 1.5); hold on;
plot(t, y_adjusted, 'r', 'LineWidth', 1.5);
xlabel('Time (Hours)');
ylabel('# of Players');
legend('Original', 'Low-Pass Filter');
title('Ideal Low-Pass Filter Response');
grid on;
hold off;

function H = ideal_lowpass(N, sampling_freq, cutoff_freq)

    H = zeros(1, N);
    freq = (-N/2 : N/2-1) * (sampling_freq / N);  

    for i = 1:N
       
        if abs(freq(i)) <= cutoff_freq
            H(i) = 1;
        end
    end
end
