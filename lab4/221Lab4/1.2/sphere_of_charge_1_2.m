function [Ex,Ey,Ez,Etot,V] = sphere_of_charge_1_2 (a,N,x,y,z)

% Here we will change the formula based on the given charge density.
epsilon = 8.854e-12;
coeff = 10^(-3);
dtheta = pi/N;
dphi = 2*pi/N;
phi = linspace(dphi,2*pi,N);
theta = linspace(0,pi,N+1);

for i = 1:length(phi)
    for j = 1:length(theta)
        
      rohl = cos(theta(j))^2;
        
       Ex1(j) = (rohl*a^2*sin(theta(j))*(x-a*sin(theta(j))*cos(phi(i)))*dtheta*dphi)/(4*pi*epsilon*((x-a*sin(theta(j))*cos(phi(i)))^2+(y-a*sin(theta(j))*sin(phi(i)))^2+(z-a*cos(theta(j)))^2)^(3/2));
        
        Ey1(j) = (rohl*a^2*sin(theta(j))*(y-a*sin(theta(j))*sin(phi(i)))*dtheta*dphi)/(4*pi*epsilon*((x-a*sin(theta(j))*cos(phi(i)))^2+(y-a*sin(theta(j))*sin(phi(i)))^2+(z-a*cos(theta(j)))^2)^(3/2));
        
        Ez1(j) = (rohl*a^2*sin(theta(j))*(z-a*cos(theta(j)))*dtheta*dphi)/(4*pi*epsilon*((x-a*sin(theta(j))*cos(phi(i)))^2+(y-a*sin(theta(j))*sin(phi(i)))^2+(z-a*cos(theta(j)))^2)^(3/2));
        
        V1(j) = (rohl*a^2*sin(theta(j))*dtheta*dphi)/(4*pi*epsilon*((x-a*sin(theta(j))*cos(phi(i)))^2+(y-a*sin(theta(j))*sin(phi(i)))^2+(z-a*cos(theta(j)))^2)^(1/2));
        
    end
    
    Ex2(i) = sum(Ex1);
    Ey2(i) = sum(Ey1);
    Ez2(i) = sum(Ez1);
    V2(i) = sum(V1);
    
end

 Ex = coeff*sum(Ex2);
 Ey = coeff*sum(Ey2);
 Ez = coeff*sum(Ez2);
 V = coeff*sum(V2);
 Etot = (Ex^2+Ey^2+Ez^2)^(1/2);
end

