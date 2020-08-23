% Sampling variables
Fs = 1e13;          %Sample frequency
T = 1/Fs;           %Sample period
t = (-5000:5000)*T; %Time vector


% Pulse variables
A0 = 1;             %Pulse amplitude
T0 = 5e-11;         %Pulse width
C = [0 2 5];        %Chirp parameters

% Fiber variables
beta2 = -2.17e-26;  %Dispersion parameter

% Parametrized frequency
N = length(t);
Fs = 200e9;
f = ([-(N-1)/2:(N-1)/2]/N)*Fs/1e9; %GHz

%Plot pulses amplitude spectrum at begining
figure(1);
for p = 1 : length(C)
    %Generate pulse
    chirped_pulse = chirpedGaussianPulse(C(p), A0, T0, 0, beta2, t);
    
    %Get Fourier transform
    Aw = fft(chirped_pulse, N)/N;
    Aw_mod = fftshift(abs(Aw));
    plot(f, Aw_mod);
    hold on;
end
hold off;

xlabel("Frequency [GHz]");
ylabel("Intensity [Arbitrary Units]");
xlim([-1.5 1.5])
legend("C = 0", "C = 2", "C = 5")