function [y] = In_lab2(VarName1,VarName2)

F = VarName1*9.81;
r0 = 0.01;
L0 = 0.06;
conductivity = 4e-3;

% We first calculate the ideal resistance, approximating resistance and
% fixed resistance:

for i = 1:length(F)
    
    R_ideal(i) = ideal_Resistance(F(i));
    R_appro(i) = approximate_resistance(F(i));
end

R_fixed = (L0*exp(-0.0012*F))/(conductivity*pi*(r0^2));

% Now we plot those resistances:
figure;
semilogx(VarName1,R_ideal,'Color','r'); %semilogx(...,'PropertyName',PropertyValue,...) 
%sets property values for all lineseries properties graphics objects created by semilogx. 
hold on;
semilogx(VarName1,R_appro,'Color','b');
hold on;
semilogx(VarName1,R_fixed,'Color','g');
hold on;
%we finally plot the data given by the lab iinstruction:
semilogx(VarName1,VarName2,'Color','c');
xlabel('Mass(kg)');
ylabel('Resistance');
title('plot of ideal resistance, measured resistance,fixed resistance and approximating resistance');
grid on;
legend('Ideal Resistance','Approximating Resistance','Fixed Resistance','Measured Resistance');
 y= length(F);
end

% Question d):
  % Ideal resistance is more accurate compared to 3 other resistances,
  % since when we were calculating the ideal resistance, we accumulate the
  % resistance by dz. Specifically, the radius of the compressed
  % material is changed by the differential variables F and z, and z is
  % also changed by dz. By doing so, the resistance obtained by the
  % accumulation becomes more accurate.
  
  %However, in Approximating Resistance,the resistance does not affect by
  %z, it only changed based on F, which makes the resistance less accurate.
  %Similar reason for fixed resistance and measured resistance, they all
  %don't account the changes of both F and z.
  
  %Question e):
    % In ideal resistance, the the radius of the compressed
  % material is directly proportional to F. And since F increases, the
  % radius gets smaller, since the exponent is negative, and it gets bigger
  % as F increases. Thus, the denominator decreases as F increases, and
  % then the resistance becomes bigger and bigger. In addition, since
  % altimately there is only one F shown in the denominator, and when F
  % decreases linearly, we have the plot that increases linearly with
  % respect to F.
  
  %Question f):
     % 



    

 