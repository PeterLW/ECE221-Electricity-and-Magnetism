function [Etot,Ex,Ey,Ez] = ringofcharge22 (R,rhol, x,y,z,N)

epsilon = 8.854e-12;

dtheta = 2*pi/N;

thetarange = linspace(0,(2/3)*pi,N);

for k=1:length(thetarange)
    
      integrand = dtheta / (( (x-R*cos(k))^2 + (y-R*sin(k))^2 +z^2)^(3/2));
      
      % we compute the integrand for each axis:
      
      dEx(k) = (x-R*cos(k))*integrand;
      
      dEy(k) = (y-R*sin(k))*integrand;
      
      dEz(k) = z*integrand;
      
end

% Do the integration by summing up the differential pieces that result from
% each value of each term:

Ex = ((rhol*R)/(4*pi*epsilon))*sum(dEx);
Ey = ((rhol*R)/(4*pi*epsilon))*sum(dEy);
Ez = ((rhol*R)/(4*pi*epsilon))*sum(dEz);
Etot = (Ex^2+Ey^2+Ez^2)^(1/2);

end

