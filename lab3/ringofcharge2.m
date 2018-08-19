function [Etot,Ex,Ey,Ez] = ringofcharge2 (a,rhol, x,y,z,N)

epsilon = 8.854e-12;

dtheta = 2*pi/N;

thetaPrime = linspace(0,2*pi,N);


integrand = dtheta./ (((x-a.*cos(thetaPrime)).^2 + (y-a.*sin(thetaPrime)).^2 + z^2).^(3/2));
dEx = integrand .* (x-a.*cos(thetaPrime));
dEy = integrand .* (y-a.*sin(thetaPrime));
dEz = integrand .* z;

Ex = ((rhol*a)/(4*pi*epsilon))*sum(dEx);
Ey = ((rhol*a)/(4*pi*epsilon))*sum(dEy);
Ez = ((rhol*a)/(4*pi*epsilon))*sum(dEz);
Etot = (Ex^2+Ey^2+Ez^2)^(1/2);

end


