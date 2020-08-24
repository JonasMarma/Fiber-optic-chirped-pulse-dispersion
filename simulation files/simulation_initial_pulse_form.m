clear all;
clc;

%Sampling variables
Fs = 1e13;          %Sample frequency
T = 1/Fs;           %Sample period
t = (-5000:5000)*T; %Time vector


%Pulse variables
A0 = 1;             %Pulse amplitude
T0 = 5e-11;         %Pulse width
C = [0 2 5];        %Chirp parameters

%Fiber variables
beta2 = -2.17e-26;  %Dispersion parameter
z = 0;              %Distance = 0 (initial pulse form)

%Plot real part of pulses with the chirp parameters from C
figure(1)
for p = 1 : length(C)
    chirped_pulse = chirpedGaussianPulse(C(p), A0, T0, z, beta2, t);
    
    plot(t/1e-9, real(chirped_pulse));
    hold on
end
hold off

xlabel("Tempo [ns]");
ylabel("Intensidade [ua]");
xlim([-0.2 0.2])
ylim([-0.6 1.2])
legend("C = 0", "C = 2", "C = 5")