function plotMagnitudeSpectrumHistogram(csvFileName)
    % Load csvfile
    x = readmatrix(stardewValleyData.csv);
    x = x(:);   % ensure column vector

    % Compute FFT and magnitude
    N = length(x);
    X = fft(x);
    magX = abs(X);

    % Keep only positive frequencies
    magX = magX(1:floor(N/2));

    % Plot histogram
    figure;
    histogram(magX, 'Normalization', 'pdf');
    title('Magnitude Spectrum Histogram');
    xlabel('Magnitude');
    ylabel('Probability Density');
    grid on;

end
