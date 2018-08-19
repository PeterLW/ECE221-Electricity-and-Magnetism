function [Ex,Ey,Ez] = test(R,rhol,x,y,z)


    epsilon = 8.854e-12;
    thetaprime = linspace(0,2*pi,10000);
      
    %note that there should be 1 in the numerator, since dtheta will appear
    %when the integration applies.
    
      integrand = 1 ./ (( (x-R.*cos(thetaprime)).^2 + (y-R.*sin(thetaprime)).^2 +z^2).^(3/2));
      
      % functions of dx,dy,dz with independent variable thetaprime
      dx = (x-R*cos(thetaprime)).*integrand;
      dy = (y-R*sin(thetaprime)).*integrand;
      dz = (z).*integrand;
      

Edx1 = dx;
Edy1 = dy;
Edz1 = dz;

%Using the in-built function trapz to test the original original written integration function
Ex = ((rhol*R)/(4*pi*epsilon))*trapz(thetaprime,Edx1);
Ey = ((rhol*R)/(4*pi*epsilon))*trapz(thetaprime,Edy1);
Ez = ((rhol*R)/(4*pi*epsilon))*trapz(thetaprime, Edz1);


end




