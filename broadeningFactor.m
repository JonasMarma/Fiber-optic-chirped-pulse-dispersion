function T1_T0 = broadeningFactor(C, T0, z, beta2)
    T1_T0 = sqrt( (1 + C*beta2*z/T0^2).^2 + (beta2*z/T0^2).^2 );
end