

a = 0.5;
N = 200;
z = linspace(-3,3,100);

for i = 1:length(z)
    
[Exc(i),Eyc(i),Ezc(i),Etc(i),Vc(i)] = sphere_of_charge_1_2(a,N,0,0,z(i));

end

% Now we plot both theoretical Etot & V and calculated Etot & V:
% We first compare electric fields:
figure;
plot(z,Etc,'b-');
hold all;
plot(z,Exc,'ro-');
hold all;
plot(z,Eyc,'y-');
hold all;
plot(z,Ezc,'g-');
hold all;
xlabel('z-axis');
ylabel('Total Electric Field');
title(sprintf('Value of Etot along y axis for a Uniformly Charged Sphere of radius %i',a));
grid on;
legend('Etot','Ex','Ey','Ez');

% We now compare electrical potentials:

figure;
plot(z,Vc,'b-');
xlabel('z-axis');
ylabel('Total Electric Potential');
title(sprintf('Value of V along y axis for a Uniformly Charged Sphere of radius %i',a));
grid on;


