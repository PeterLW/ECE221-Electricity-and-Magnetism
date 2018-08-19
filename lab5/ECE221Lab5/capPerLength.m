function [y] = capPerLength(a,b,c,d,x0,y0,epsilonr)

Nx = 101;
Vo = 8;
hx = a/(Nx - 1);
Ny = round(b/hx+1);
hy = b/(Ny - 1);

%defining impt constants

%epsilonr = 2;
epsilon = 8.854e-12;

[V,~,~] = bvprectangularcoax(a, b, c, d, x0, y0,epsilonr, Vo);

%defining discrete inner conductor index
innerstartx = round(x0/hx+1);
innerendx = round(innerstartx + c/hx);
innerstarty = round(y0/hy+1);
innerendy = round(innerstarty + d/hy);

contour = 3; % we aribitraryly define the offset for the Gaussian surface. 

%defining Gaussian surface
innerstarty = innerstarty - contour;
innerendy = innerendy + contour;
innerstartx = innerstartx - contour;
innerendx = innerendx + contour;


n = 1;
for i = innerstartx:innerendx
    n = n + 1;
    %upper segement
    Vupperseginner(n) = V(i,innerendy);
    Vuppersegouter(n) = V(i,innerendy+1);
    
    %bottom segment
    Vbottomseginner(n) = V(i,innerstarty);
    Vbottomsegouter(n) = V(i,innerstarty-1);
    
end

n = 1;
for j = innerstarty:innerendy
    n = n + 1;
    %left segement
    Vleftinner(n) = V(innerstartx,j);
    Vleftouter(n) = V(innerstartx-1,j);
    
    %right segment
    Vrightinner(n) = V(innerendx,j);
    Vrightouter(n) = V(innerendx+1,j);
end

% Sum up 4 segments 
upperseg = epsilonr*epsilon*hy*sum(((Vupperseginner - Vuppersegouter)/hx));
lowerseg = epsilonr*epsilon*hy*sum(((Vbottomseginner - Vbottomsegouter)/hx));

leftseg = epsilonr*epsilon*hx*sum(((Vleftinner - Vleftouter)/hy));
rightseg = epsilonr*epsilon*hx*sum(((Vrightinner - Vrightouter)/hy));

QPerL = (upperseg + lowerseg + leftseg +rightseg);
y = QPerL/Vo;

end
