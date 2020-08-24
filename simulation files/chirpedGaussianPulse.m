function pulse = chirpedGaussianPulse(C, A0, T0, z, beta2, t)
    Qz = Q(z, C, beta2, T0);
    pulse = A0*exp( (-(1+j*C)/2) * ((t/T0).^2) / (Qz) ) / sqrt(Qz);
end