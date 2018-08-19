function [Etot,Ex,Ey,Ez] = plotringofcharge3(Q,R,N)

density = Q/(2*pi*R);
y = linspace(0.1,2,N);

     
         for m=1:length(y)
        [Etot(m),Ex(m),Ey(m),Ez(m)] = ringofcharge(R,density,0,y(m),0,N);
         end
      
%For Ex:
figure;
plot(y,Ex,'r--');
xlabel('y-axis');
ylabel('Ex-axis');
title(sprintf('Value of Ex in the y axis for a Uniformly Charged ring of radius %i',R));
grid on;


%For Ey:
figure;
plot(y,Ey,'b--');
xlabel('y-axis');
ylabel('Ey-axis');
title(sprintf('Value of Ey in the y axis for a Uniformly Charged ring of radius %i',R));
grid on;

%For Ez:
figure;
plot(y,Ez,'y--');
xlabel('y-axis');
ylabel('Ez-axis');
title(sprintf('Value of Ez in the y axis for a Uniformly Charged ring of radius %i',R));
grid on;


end
