function plotFullMagnitudeSpectrum()
    T = readtable('stardewValleyData.csv');
    data = T.Players;
    
    % Number of samples
    N = length(data);
    
    % Sampling frequency (1 sample per hour)
    fs = 1;  
    
    % FFT
    Y = fft(data);
    
    % Shift zero frequency to center
    Y_shifted = fftshift(Y);
    
    % Remove DC component (center)
    Y_shifted(N/2 + 1) = 0;
    
    % Frequency axis for fftshifted data
    f = (-N/2:N/2-1)*(fs/N);
    
    % Magnitude
    mag = abs(Y_shifted);
    
    % Plot
    figure;
    bar(f, mag, 'LineWidth', 1.2);
    title('Full Magnitude Spectrum');
    xlabel('Frequency ');
    ylabel('Magnitude');
    grid on;
end










