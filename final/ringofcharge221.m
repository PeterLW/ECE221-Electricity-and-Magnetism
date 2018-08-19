function [Etot,Ex,Ey,Ez] = ringofcharge221(R,x,y,z,N)

epsilon = 8.854e-12;

dtheta = 2*pi/N;

thetarange = linspace(0,2*pi,N);

for k=1:length(thetarange)
    
      integrand = dtheta / (( (x-R*cos(k))^2 + (y-R*sin(k))^2 +z^2)^(3/2));
      
      % we compute the integrand for each axis:
      
      dEx(k) = xxx*(x-R*cos(k))*integrand;
      
      dEy(k) = xxx*(y-R*sin(k))*integrand;
      
      dEz(k) = xxx*z*integrand;
      
end

% Do the integration by summing up the differential pieces that result from
% each value of each term:

Ex = (R/(4*pi*epsilon))*sum(dEx);
Ey = (R/(4*pi*epsilon))*sum(dEy);
Ez = (R/(4*pi*epsilon))*sum(dEz);
Etot = (Ex^2+Ey^2+Ez^2)^(1/2);

end




