% Define parameters
T = 2*pi; % Period of the signal
f = 1; % Frequency of the signal
N = 10; % Number of harmonics to calculate 

% Function for full-wave rectified sine wave
x = @(t) abs(sin(2*pi*f*t)); 

% Calculate DC component (Do)
Do = (1/T) * integral(x, 0, T); 

% Calculate complex Fourier coefficients (Dn)
n = -N:N;  % Include negative harmonics for a complete spectrum
Dn = zeros(size(n)); % Preallocate

for k = 1:length(n)
    nk = n(k);
    % Define function to integrate
    fun = @(t) x(t) .* exp(-1j*2*pi*nk*t/T);
    Dn(k) = (1/T) * integral(fun, 0, T);
end

% Magnitude and phase spectrum
magnitude = abs(Dn);
phase = angle(Dn);

% Plotting
figure;
subplot(2,1,1);
stem(n, magnitude, 'b');
xlabel('Harmonic number (n)');
ylabel('Magnitude');
title('Magnitude Spectrum');

subplot(2,1,2);
stem(n, phase, 'r');
xlabel('Harmonic number (n)');
ylabel('Phase (radians)');
title('Phase Spectrum');

% Display results
disp(['DC component (Do): ', num2str(Do)]);
disp(['Complex Fourier coefficient (D1): ', num2str(Dn(N+2))]); % D1 corresponds to n=1
