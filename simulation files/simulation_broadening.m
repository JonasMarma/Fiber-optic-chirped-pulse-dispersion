%Sampling variables
Fs = 1e13;          %Sample frequency
T = 1/Fs;           %Sample period
t = (-5000:5000)*T; %Time vector


%Pulse variables
A0 = 1;             %Pulse amplitude
T0 = 5e-11;         %Pulse width
C = [-5 -2 0 2 5];  %Chirp parameters

%Fiber variables
beta2 = -2.17e-26;  %Dispersion parameter

z_LD = (0:0.001:2);

distance = (0:100:150000);

%Plot broadening factor vs propagation distance
figure(1);
for p = 1 : length(C)
    T0_T1 = broadeningFactor(C(p), T0, distance, beta2);
    plot(distance/dispersionDistance(beta2, T0), T0_T1)
    hold on
end
hold off

xlabel("z/L_{D}");
ylabel("Broadening (T_{1}/T_{0})");
legend("C = -5", "C = -2", "C = 0", "C = 2", "C = 5")
