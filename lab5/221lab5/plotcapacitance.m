function[cap1]=plotcapacitance(Vo)

a = 0.02;
b = 0.02;
c = 0.01;
d = 0.04;
xo = 0.04;
yo = linspace(0,b-d,0.0001); 
er = 1.25;

for k = 1: length(yo)
    [cap1(k)]= bvprectangularcoax(a,b,c,d,xo,yo(k),er,Vo);
end

figure
plot(yo, cap1, 'ro');
