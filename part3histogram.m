function plotMagnitudeSpectrumHistogram()
    T = readtable('stardewValleyData.csv');

    % Extract the numeric column (Players)
    data = T.Players;

    %Compute FFT
    Y = fft(data);

    %Compute magnitude spectrum
    mag = abs(Y);

    %Plot Histogram of Magnitude Spectrum
    figure;
    histogram(mag, 50);   % 50 bins; adjust if needed
    title('Histogram of Magnitude Spectrum');
    xlabel('Magnitude');
    ylabel('Frequency');
    grid on;
end
