function [Etot,Ex,Ey,Ez]=plotringofcharge(Q,R,N)

density = Q/(2*pi*R);

x = 0;
y = linspace(-0.5,0.5,24);
z = linspace(-3,3,300);

% use function 'ringofcharge'to compute Ey & Ez based on my algorithm:

for e=1:length(z)
     for m=1:length(y)
         [Etot(e,m),Ex(e,m),Ey(e,m),Ez(e,m)] = ringofcharge(R,density,0,y(m),z(e),N);
     end
end

% use the test function to compute Ey & Ez:

for f=1:length(z)
     for n=1:length(y)function [Etot,Ex,Ey,Ez] = ringofcharge221(R,x,y,z,N)

epsilon = 8.854e-12;

dtheta = 2*pi/N;

thetarange = linspace(0,2*pi,N);

for k=1:length(thetarange)
    
      integrand = dtheta / (( (x-R*cos(k))^2 + (y-R*sin(k))^2 +z^2)^(3/2));
      
      % we compute the integrand for each axis:
      
      dEx(k) = 3*cos(k)*(10^(-6))*(x-R*cos(k))*integrand;
      
      dEy(k) = 3*cos(k)*(10^(-6))*(y-R*sin(k))*integrand;
      
      dEz(k) = 3*cos(k)*(10^(-6))*z*integrand;
      
end

% Do the integration by summing up the differential pieces that result from
% each value of each term:

Ex = (R/(4*pi*epsilon))*sum(dEx);
Ey = (R/(4*pi*epsilon))*sum(dEy);
Ez = (R/(4*pi*epsilon))*sum(dEz);
Etot = (Ex^2+Ey^2+Ez^2)^(1/2);

end


         [Ex1(f,n),Ey1(f,n),Ez1(f,n)] = test(R,density,0,y(n),z(f));
         
     end
end


[Y,Z] = meshgrid(y,z);
figure;
%mesh(Y,Z,Ez);
% we plot estimated value and theoretical value for the comparison:
plot(z,Ez,'r--');
hold on;
plot(z,Ez1,'b--');
xlabel('y-axis');
ylabel('z-axis');
zlabel('E_z (N/C)');
title(sprintf('Value of Ez in the z axis for a Uniformly Charged ring of radius %i',R));
grid on;


end
