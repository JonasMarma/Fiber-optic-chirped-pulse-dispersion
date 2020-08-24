%Sampling variables
Fs = 1e13;          %Sample frequency
T = 1/Fs;           %Sample period
t = (-5000:5000)*T; %Time vector


%Pulse variables
A0 = 1;             %Pulse amplitude
T0 = 5e-11;         %Pulse width
C = 2;              %Chirp parameters

%Fiber variables
beta2 = -2.17e-26;  %Dispersion parameter

%Distance values where the amplitudes will be calculated
distance = linspace(0, 150000, 100);

%Amplitude values
Amp_surf = zeros(length(distance), length(t));

for d = 1 : length(distance)
    Amp_surf(d,:) = chirpedGaussianPulse(C, A0, T0, distance(d), beta2, t);
end

%Amplitude modulus vs time x distance
figure(1);
s = surf(t/1e-9, distance/1e3, abs(Amp_surf));
shading interp

xlabel("Time [ns]");
ylabel("Distance [km]")
zlabel("Light Intensity [Arbitrary Units]");
title("Absolute Values of Amplitude Dispersion")

%Amplitude real part vs time x distance
figure(2)
s = surf(t/1e-9, distance/1e3, real(Amp_surf));
shading interp

xlabel("Time [ns]");
ylabel("Distance [km]")
zlabel("Light Intensity [Arbitrary Units]");
title("Real Part of Amplitude Dispersion")



