function [Etot,Ex,Ey,Ez] = ringofcharge (R,rhol, x,y,z,N)

epsilon = 8.854e-12;

dtheta = 2*pi/N;

thetarange = linspace(0,2*pi,N);

for k=1:length(thetarange)
    
      integrand = dtheta / (( (x-R*cos(thetarange(k)))^2 + (y-R*sin(thetarange(k)))^2 +z^2)^(3/2));
      
      % we compute the integrand for each axis:
      
      dEx(k) = (x-R*cos(thetarange(k)))*integrand;
      
      dEy(k) = (y-R*sin(thetarange(k)))*integrand;
      
      dEz(k) = z*integrand;
      
end

% Do the integration by summing up the differential pieces that result from
% each value of each term:

Ex = ((rhol*R)/(4*pi*epsilon))*sum(dEx);
Ey = ((rhol*R)/(4*pi*epsilon))*sum(dEy);
Ez = ((rhol*R)/(4*pi*epsilon))*sum(dEz);
Etot = (Ex^2+Ey^2+Ez^2)^(1/2);

end




