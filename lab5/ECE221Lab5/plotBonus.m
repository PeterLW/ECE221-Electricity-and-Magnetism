function plotBonus()

a=0.02;
b=0.02;
epsilonr=2.5;

c=linspace(0,a,20);

for n=1:length(c)
    d=(2.5e-5)/c(n);
    x0=(a-c(n))/2;
    y0=(b-d)/2;
    cap(n)=capPerL(a,b,c(n),d,x0,y0,epsilonr);
end

figure
plot(c,cap);

end