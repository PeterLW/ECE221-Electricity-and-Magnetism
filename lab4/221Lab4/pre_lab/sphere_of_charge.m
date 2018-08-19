function [Ex,Ey,Ez,V,Etot] = sphere_of_charge (density,a,x,y,z)

epsilon = 8.854e-12;
N = 1000;
dtheta = pi/N;
dphi = 2*pi/N;
phi = linspace(dphi,2*pi,N);
theta = linspace(0,pi,N+1);

for i = 1:length(phi)
    for j = 1:length(theta)
 
         Ex1(j) = (density*a^2*sin(theta(j))*(x-a*sin(theta(j))*cos(phi(i)))*dtheta*dphi)/(4*pi*epsilon*((x-a*sin(theta(j))*cos(phi(i)))^2+(y-a*sin(theta(j))*sin(phi(i)))^2+(z-a*cos(theta(j)))^2)^(3/2));
        
        Ey1(j) = (density*a^2*sin(theta(j))*(y-a*sin(theta(j))*sin(phi(i)))*dtheta*dphi)/(4*pi*epsilon*((x-a*sin(theta(j))*cos(phi(i)))^2+(y-a*sin(theta(j))*sin(phi(i)))^2+(z-a*cos(theta(j)))^2)^(3/2));
        
        Ez1(j) = (density*a^2*sin(theta(j))*(z-a*cos(theta(j)))*dtheta*dphi)/(4*pi*epsilon*((x-a*sin(theta(j))*cos(phi(i)))^2+(y-a*sin(theta(j))*sin(phi(i)))^2+(z-a*cos(theta(j)))^2)^(3/2));
        
        V1(j) = (density*a^2*sin(theta(j))*dtheta*dphi)/(4*pi*epsilon*((x-a*sin(theta(j))*cos(phi(i)))^2+(y-a*sin(theta(j))*sin(phi(i)))^2+(z-a*cos(theta(j)))^2)^(1/2));
             
    end
    
    Ex2(i) = sum(Ex1);
    Ey2(i) = sum(Ey1);
    Ez2(i) = sum(Ez1);
    V2(i) = sum(V1);
    
end

 Ex = sum(Ex2);
 Ey = sum(Ey2);
 Ez = sum(Ez2);
 V = sum(V2);
 Etot = (Ex^2+Ey^2+Ez^2)^(1/2);
 
end

