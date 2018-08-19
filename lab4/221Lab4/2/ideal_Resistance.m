function [R] = ideal_Resistance(F)

L0 = 0.06;
conductivity = 4e-3;
r0 = 0.01;
N = 1000;
L = L0*exp(-0.0012*F);
z = linspace(0,L,N+1);
dz =L/N;

for j=1:length(z)
    exponent = (5*(z(j)-(L/2))*F)^2;
    r(j) = 0.0005*((10*F)^(1/2)*exp(-exponent))+r0;
    resistance(j) = dz /(conductivity*pi*(r(j)^2));
end

R = sum(resistance);

end

    