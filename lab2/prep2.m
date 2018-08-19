function y=prep2(upperlimit,lowerlimit)

x=linspace(upperlimit,lowerlimit,1000000);

y=0;

for a=1:(length(x)-1)
    y=y+(x(a+1)-x(a)).*(sin(x(a))).^2;
end
