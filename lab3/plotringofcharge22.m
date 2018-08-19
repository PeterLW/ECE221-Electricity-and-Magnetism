



function [Etot,Ex,Ey,Ez]=plotringofcharge22(R,rhol,x,y,z,q1,q2,q3)

density = rhol;



% use function 'ringofcharge'to compute Ey & Ez based on my algorithm:

for e=1:length(z)
         [Etot(e),Ex(e),Ey(e),Ez(e)] = ringofcharge22(R,density,0,y,z(e),10000);
end



if (q1==1)% if we are asked to draw Ex:

figure;
% we plot estimated value and theoretical value for the comparison:
plot(z,Ex,'r--');
hold on;
xlabel('z-axis');
ylabel('E_x (N/C)');
title(sprintf('Value of Ex in the z axis for a Uniformly Charged ring of radius %i',R));
grid on;

end

if (q2==1)% if we are asked to draw Ey:

figure;
% we plot estimated value and theoretical value for the comparison:
plot(z,Ey,'r--');
hold on;
xlabel('z-axis');
ylabel('E_y (N/C)');
title(sprintf('Value of Ey in the z axis for a Uniformly Charged ring of radius %i',R));
grid on;

end

if (q3==1)% if we are asked to draw Ez:

figure;
% we plot estimated value and theoretical value for the comparison:
plot(z,Ez,'r--');
hold on;
xlabel('z-axis');
ylabel('E_z (N/C)');
title(sprintf('Value of Ez in the z axis for a Uniformly Charged ring of radius %i',R));
grid on;

end

end
