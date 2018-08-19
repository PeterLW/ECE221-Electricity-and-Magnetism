function[Etot,Ex,Ey,Ez] = plotringofcharge(a,Q,N)

epsilon=8.854e-12; 

x = 0;
y = 0;
z = linspace(-3,3,500);

rhol = Q / (2 * pi * a);

for k = 1: length(z)
    [Etot(k),Ex(k),Ey(k),Ez(k)] = ringofcharge(a,rhol,x, y,z(k),N);  
    Etheory(k) = (rhol * a *z(k)) / ( 2 * epsilon * (a^2 + z(k)^2) ^ 1.5);
end

figure
plot(z, Ez, 'or');
hold on;
plot(z, Etheory, 'b');
grid on;
ylabel('Ez (V/m)');
xlabel('z-axis');
legend ('Ez', 'Etheory');