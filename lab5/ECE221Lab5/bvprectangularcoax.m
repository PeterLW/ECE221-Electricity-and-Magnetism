function [V,Ex,Ey]=bvprectangularcoax(a,b,c,d,xo,yo,er,Vo)
%
% [V,Ex,Ey,C,We,gridpointsx,gridpointsy,innerx,innery,outerx,outery]=bvprectangularcoax(a,b,c,d,xo,yo,er,Vo)
%
% This function used the finite difference method to solve the
% two-dimensional electrostatic boundary value problem related to a square
% coaxial cable.
%   a = width of outer conductor
%   b = height of outer conductor
%   c = width of inner conductor
%   d = height of inner conductor
%   xo = the x-coordinate of the location of the bottom left corner of the inner conductor
%   yo = the y-coordinate of the location of the bottom left corner of the inner conductor
%   er = the relative permittivity of the dielectric which fills the space
%   between the inner and outer conductor
%   Vo = electric potential of the inner conductor (outer is grounded)

% Define the fundamental constant eo
eo=8.854e-12;

% Set number of nodes and node spacings
Nx=101;
hx=a/(Nx-1)
hy=hx;
Ny=round(b/hy+1)

% Set the initial values of V to zero
V = zeros(Nx,Ny);

%constant value nodes have a 1 and a free node 0
Vcheck = zeros(Nx,Ny);

% Set the known potential values (or boundary values) dor Vcheck

Vcheck(1,1:Ny)=1; % Grounded left side
Vcheck(1:Nx,1)=1;% Grounded bottom side
Vcheck(Nx,1:Ny)=1;% Grounded right side
Vcheck(1:Nx,Ny)=1; % Grounded top side

% outerx and outery are matrices that contains the x- and y-values of the
% locations of the nodes that relate to the outer conductor.
outerx=[0:hx:a,zeros(1,Ny-2),a:-hx:0,zeros(1,Ny-2)];
outerx((Nx+1):(Nx+Ny-2))=a;
outery=[zeros(1,Nx),hy:hy:(b-hy),zeros(1,Nx),(b-hy):-hy:hy];
outery((Nx+Ny-1):(2*Nx+Ny-2))=b;


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
Vcheck(innerstartx:innerendx,innerstarty:innerendy)=1; % Set Vcheck inner conductor to be 1

%Create an new vector storing computed values:
Vnew = V;
Vold = V;
temp = 100;

% Determine the final voltage distributions (your code goes here...)
while temp >1e-4
    
     for i = 1:Nx
         for j = 1:Ny
         if(Vcheck(i,j) == 0)
              Vnew(i,j) = (Vold(i+1,j)+Vold(i-1,j)+Vold(i,j+1)+Vold(i,j-1))/4;
         end
         end
     end
     
  temp = max(max(abs(100*(Vnew - Vold)./(Vnew))));
  Vold = Vnew;

end

V = Vnew;

% Now we calculate Ey & Ex:
[Ey,Ex] = gradient (-Vnew,hx,hy);
 
% Plot the grid points and known voltage points

% gridpointsx is a matrix (size Nx x Ny) that contains the x-values of the
% locations of the nodes within the grid.
% gridpointsy is a matrix (size Nx x Ny) that contains the y-values of the
% locations of the nodes within the grid.
[gridpointsx,gridpointsy]=meshgrid(0:hx:a,0:hy:b);

% innerx and innery are matrices that contains the x- and y-values of the
% locations of the nodes that relate to the inner conductor.
[innerx,innery]=meshgrid((innerstartx-1)*hx:hx:(innerendx-1)*hx,(innerstarty-1)*hy:hy:(innerendy-1)*hy);

figure
%plot potentials:
 meshc(gridpointsx,gridpointsy,Vnew');
 
figure
contourf(gridpointsx,gridpointsy,Vnew');


figure
%Plot electrical fields:
quiver(gridpointsx,gridpointsy,Ex',Ey');

     
end

 
    
    
    
    
    
    
    
    

