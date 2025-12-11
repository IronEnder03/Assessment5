
data = readmatrix('stardewValleyData.csv');
%% Load Data
x = data(:,2);
x = x(:);               
N = length(x);

fs = 1;       % adjust if needed
fc = 0.01;     % cutoff frequency 

freq = (-N/2 : N/2-1) * (fs/N);

H = ideal_highpass(freq, fc);

%% Apply filter
X = fft(x);
X = fftshift(X);

Y = X .* H';    

y_filtered = ifft(ifftshift(Y));

%% Plot
t = (0:N-1)/fs;

figure;
plot(t, x, 'b', 'LineWidth', 1.5); 
hold on;

y_adjusted = real(y_filtered)+mean(x);
plot(t, y_adjusted, 'r', 'LineWidth', 1.5);
legend('Original', 'High-Pass Filtered');
xlabel('Time');
ylabel('Amplitude');
title('Ideal High-Pass Filter Result');
grid on;
hold off;

%% IDEAL HIGH-PASS FUNCTION HERE
function H = ideal_highpass(freq, fc)

H = zeros(size(freq));

for i = 1:length(freq)
    if abs(freq(i)) > fc
        H(i) = 1;
    end
end

end










