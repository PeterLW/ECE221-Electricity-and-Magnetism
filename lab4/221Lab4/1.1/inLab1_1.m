

density = 2e-6;
a = 0.5;
N = 200;
y = linspace(-3,3,100);

for i = 1:length(y)
    
[Exc(i),Eyc(i),Ezc(i),Etc(i),Vc(i)] = sphere_of_charge (density,a,N,0,y(i),0);
[Ett(i),Vt(i)] = tester1_1 (density,a,y(i));
end

% Now we plot both theoretical Etot & V and calculated Etot & V:
% We first compare electric fields:
figure;
plot(y,Etc,'b-');
hold on;
plot(y,Ett,'ro');
xlabel('y-axis');
ylabel('Total Electric Field');
title(sprintf('Value of Etot along y axis for a Uniformly Charged Sphere of radius %i',a));
grid on;

% We now compare electrical potentials:

figure;
plot(y,Vc,'b-');
hold on;
plot(y,Vt,'ro');
xlabel('y-axis');
ylabel('Total Electric Potential');
title(sprintf('Value of V along y axis for a Uniformly Charged Sphere of radius %i',a));
grid on;


