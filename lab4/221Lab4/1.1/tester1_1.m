function [Et,V] = tester1_1 (density,a,y)

epsilon = 8.854e-12;
Et =0;
V =0;
if(abs(y)<a)
    Et = 0;
    V = (density*a)/epsilon;
end

if(abs(y)>=a)
    Et = (density*a*a)/(epsilon*(y^2));
    V = (density*a*a)/(abs(y)*epsilon);
end

end
