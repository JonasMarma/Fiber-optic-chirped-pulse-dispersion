function Ce = effectiveChirp(C, beta2, z, T0)
    Ce = C + (1 + C^2)*beta2*z/T0^2;
end