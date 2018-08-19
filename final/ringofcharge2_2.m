function[Etot, Ex, Ey, Ez] = ringofcharge(a,rhol,x,y,z,N)

epsilon=8.854e-12; 

dphi = (2 * pi) / (3 * N);

phiprime = linspace (0, 2*pi/3, N);


for k =1 : length(phiprime)
    
    integrand = dphi/(((x-a*cos(phiprime(k)))^2+(y-a*sin(phiprime(k)))^2+z^2)^(3/2));
    
    dEx(k) = (x-a*cos(phiprime(k))) * integrand; 
    dEy(k) = (y-a*sin(phiprime(k))) * integrand;
    dEz(k) = z*integrand;
    
end

Ex = ((rhol*a)/(4*pi*epsilon)) * sum(dEx)
Ey = ((rhol*a)/(4*pi*epsilon)) * sum(dEy)
Ez = ((rhol*a)/(4*pi*epsilon)) * sum(dEz)

Etot = (Ex^2+Ey^2+Ez^2)^0.5;
   