% function [V,Ex,Ey,C,We,We2,gridpointsx,gridpointsy,innerx,innery,outerx,outery,cap1]=bvprectangularcoax(a,b,c,d,xo,yo,er,Vo)
function [energy1]=bvprectangularcoax(a,b,c,d,xo,yo,er,Vo)
%
% This function used the finite difference method to solve the
% two-dimensional electrostatic boundary value problem related to a square
% coaxial cable.
% a = width of outer conductor
% b = height of outer conductor
% c = width of inner conductor
% d = height of inner conductor
% xo = the x-coordinate of the location of the bottom left corner of the inner conductor
% yo = the y-coordinate of the location of the bottom left corner of the inner conductor
% er = the relative permittivity of the dielectric which fills the space
% between the inner and outer conductor
% Vo = electric potential of the inner conductor (outer is grounded)

% Define the fundamental constant eo
eo=8.854e-12;

% Set number of nodes and node spacings
Nx=101;
hx=a/(Nx-1);
hy=hx;
Ny=round(b/hy+1);


% Set the initial values of V to zero
V = zeros(Nx,Ny);
Vold = V(2:Nx-1,2:Ny-1);

% Set the known potential values (or boundary values)
V(1,1:Ny)=0; % Grounded left side
V(1:Nx,1)=0; % Grounded bottom side
V(Nx,1:Ny)=0; % Grounded right side
V(1:Nx,Ny)=0; % Grounded top side
innerstartx=round(xo/hx+1);
innerendx=round(innerstartx+c/hx);
innerstarty=round(yo/hy+1);
innerendy=round(innerstarty+d/hy);
V(innerstartx:innerendx,innerstarty:innerendy)=Vo; % Set potentials of inner conductor

% Determine the final voltage distributions (your code goes here...)
maxdev = 1;

while maxdev >= 10e-4
    for i =1:Nx
        for j = 1:Ny
            if i == 1 || j == 1 || i == Nx || j== Ny
                V(i,j) = 0;
            elseif (i <= innerendx && i >= innerstartx) && (j <= innerendy && j >= innerstarty)
                V(i,j) = Vo;
            else
                V(i,j) = 0.25 * (V(i+1, j) + V(i-1, j) + V(i, j+1) + V(i, j-1));
            end
        end
    end
    Vnew = V(2:Nx-1,2:Ny-1);
    maxdev = max(max(abs(100*(Vnew-Vold)./(Vnew))));
    Vold = Vnew;
end

[Ey,Ex]=gradient(-V,hx,hy);
[gridpointsx,gridpointsy]=meshgrid(0:hx:a,0:hy:b);

% figure;
% meshc(gridpointsx,gridpointsy,V');
% figure;
% contourf(gridpointsx,gridpointsy,V');
% figure;
% quiver(gridpointsx,gridpointsy,Ex',Ey');
% hold on;

En1tot1 = 0;
En1tot2 = 0;
En1tot3 = 0;
En2tot1 = 0;
En2tot2 = 0;
En2tot3 = 0;
En3tot1 = 0;
En3tot2 = 0;
En3tot3 = 0;
En4tot1 = 0;
En4tot2 = 0;
En4tot3 = 0;

contour1 = 0;
contour2 = 0;
contour3 = 0;

% contour 1
for k = innerstartx: innerendx
    En1 = (V(k,innerstarty)-V(k,innerstarty-1))/hy;
    En1tot1 = En1tot1 + er*eo*En1*hy;
end

for k = innerstartx: innerendx
    En2 = (V(k,innerendy) - V(k,innerendy+1))/hy;
    En2tot1 = En2tot1 + er*eo*En2*hy;
end

 for k = innerstarty:innerendy
    En3 = (V(innerstartx,k) - V(innerstartx-1,k))/hx;
    En3tot1 = En3tot1 + er*eo*En3*hx;
 end

for k = innerstarty: innerendy
    En4 = (V(innerendx,k) - V(innerendx+1,k))/hx;
    En4tot1 = En4tot1 + er*eo*En4*hx;
end

% contour 2
for k = innerstartx-1: innerendx+1
    En1 = (V(k,innerstarty-1)-V(k,innerstarty-2))/hy;
    En1tot2 = En1tot2 + er*eo*En1*hy;
end

for k = innerstartx-1: innerendx+1
    En2 = (V(k,innerendy+1) - V(k,innerendy+2))/hy;
    En2tot2 = En2tot2 + er*eo*En2*hy;
end

 for k = innerstarty-1:innerendy+1
    En3 = (V(innerstartx-1,k) - V(innerstartx-2,k))/hx;
    En3tot2 = En3tot2 + er*eo*En3*hx;
 end

for k = innerstarty-1: innerendy+1
    En4 = (V(innerendx+1,k) - V(innerendx+2,k))/hx;
    En4tot2 = En4tot2 + er*eo*En4*hx;
end

% contour 3
for k = innerstartx-2: innerendx+2
    En1 = (V(k,innerstarty-2)-V(k,innerstarty-3))/hy;
    En1tot3 = En1tot3 + er*eo*En1*hy;
end

for k = innerstartx-2: innerendx+2
    En2 = (V(k,innerendy+2) - V(k,innerendy+3))/hy;
    En2tot3 = En2tot3 + er*eo*En2*hy;
end

 for k = innerstarty-2:innerendy+2
    En3 = (V(innerstartx-2,k) - V(innerstartx-3,k))/hx;
    En3tot3 = En3tot3 + er*eo*En3*hx;
 end

for k = innerstarty-2: innerendy+2
    En4 = (V(innerendx+2,k) - V(innerendx+3,k))/hx;
    En4tot3 = En4tot3 + er*eo*En4*hx;
end

contour1 = En1tot1 + En2tot1 + En3tot1 + En4tot1;
contour2 = En1tot2 + En2tot2 + En3tot2 + En4tot2;
contour3 = En1tot3 + En2tot3 + En3tot3 + En4tot3;

cap1 = contour1/Vo;
cap2 = contour2/Vo;
cap3 = contour3/Vo;

 % plot grid
 [innerx,innery]=meshgrid((innerstartx-1)*hx:hx:(innerendx-1)*hx,(innerstarty-1)*hy:hy:(innerendy-1)*hy);
 contour1x = linspace(innerstartx,innerendx,hx);
 contour1y = linspace(innerstarty, innerendy,hy);
% 
 outerx=[0:hx:a,zeros(1,Ny-2),a:-hx:0,zeros(1,Ny-2)];
 outerx((Nx+1):(Nx+Ny-2))=a;
outery=[zeros(1,Nx),hy:hy:(b-hy),zeros(1,Nx),(b-hy):-hy:hy];
outery((Nx+Ny-1):(2*Nx+Ny-2))=b;
% 
  figure
%  plot(gridpointsx,gridpointsy,'b*');
%  hold on;
%  plot(outerx,outery,'kd');
%  hold on;
%  plot(innerx,innery,'ro');
%  hold on;
%  %plot(contour1x,innerstarty,'go');
%  plot(contour1x,innerendx,'go');
%  hold on;
%  plot(contour1x,innerendy,'go');
%  hold on
%  %plot(innerstartx,contour1y,'go');
%  plot(innerstartx,contour1y,'go');
%  hold on;
%  plot(innerendx,contour1y,'go');

%fdrectcoaxplotnodes(a,b,c,d,xo,yo,Nx,Ny,0);

 Ny2=round(b/hx+1);
 hy2 = b/(Ny2-1);
 energy1 = 0.5*cap1*5*5;
 
 etot = (Ex.^2 + Ey.^2);
 energy2 = er * eo *sum(sum(etot *hx*hy2))*0.5;