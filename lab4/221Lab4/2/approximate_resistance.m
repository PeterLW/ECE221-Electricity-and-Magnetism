function [y] = approximate_resistance(F)

L0 = 0.06;
numerator = L0*exp(-0.0012*F);
conductivity = 4e-3;
r0 = 0.01;
y = numerator/(conductivity*pi*(0.003*F+r0)^2);

end
