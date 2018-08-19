function [Etot,Ex,Ey,Ez]=plotringofcharge222(R,N)

x = 0;
y = 0;
z = linspace(-3,3,1000);
p=2e-3;

% use function 'ringofcharge'to compute Ey & Ez based on my algorithm:

for e=1:length(z)
         [Etot(e),Ex(e),Ey(e),Ez(e)] = ringofcharge222(R,p,-0.75,-0.75,z(e),N);
end


figure;
subplot(3,1,1);
plot(z,Ex,'r--');
xlabel('z-axis');
ylabel('Ex-axis');
grid on;


subplot(3,1,2);
plot(z,Ey,'b--');
xlabel('z-axis');
ylabel('Ey-axis');
grid on;

subplot(3,1,3);
plot(z,Ez,'b--');
xlabel('z-axis');
ylabel('Ez-axis');
grid on;

hold all;

end
