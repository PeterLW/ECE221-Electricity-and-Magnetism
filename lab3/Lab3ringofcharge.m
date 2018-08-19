function [Etot,Ex,Ey,Ez]=Lab3ringofcharge(a,rhol,x,y,z,N)
epsilon=8.854e-12;
dphi=2*pi/N; % Discretize the total line length of 2h into N pieces
phiprime=linspace(0,2*pi,N); % The linspace command creates a vector that ranges
 % from -h to h and has N elements with equal spacing
% Use a for loop to "walk" along the line
for k=1:length(phiprime)
 % Evaluate the expression which is the same for each component of E
 integrand=dphi/((x-a*cos(phiprime(k)))^2+(y-a*sin(phiprime(k)))^2+z^2)^(3/2);
 dEx(k)=integrand*(x-a*cos(phiprime(k)));
 dEy(k)=integrand*(y-a*sin(phiprime(k)));
 dEz(k)=integrand*z;

end
% Do the "integration" by summing up the differential pieces that result from
% each value of zprime.
 factor=rhol*a/(4*pi*epsilon);
 Ex=factor*sum(dEx);
 Ey=factor*sum(dEy);
 Ez=factor*sum(dEz);
 Etot=(Ex^2+Ey^2+Ez^2)^0.5;