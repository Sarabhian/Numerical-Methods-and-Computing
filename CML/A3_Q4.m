y=(-10:0.01:0);
n=size(y,2);
z=zeros(1,n);
for i=1:n
    z(i)=1.5*y(i)/(y(i)-4);
end
syms f(x)
f(x)=1.5*x/(x-4);
fplot(f,[0,10])
hold on
plot(y,z,'r')
axis([-10,10,-10,10])
xlabel('x'),ylabel('f(x)')
title('function with different domains')
legend('fplot','plot','Location','northeast')
hold off