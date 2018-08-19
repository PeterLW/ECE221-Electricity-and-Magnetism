function y=polyprep(coefficient,xrange)
x=linspace(xrange(1),xrange(end),100);
y=0;
len=length(coefficient);
legendinf=cell(1,len+1);
figure;
for a=1:len;

    b=coefficient(a).*x.^(a-1);
    y=y+b;
    plot(x,b);
    hold all;
    legendinf{a}=sprintf('term %d',len+1-a);

end
plot(x,y);
legendinf{len+1}='y(x)';
legend(legendinf);
