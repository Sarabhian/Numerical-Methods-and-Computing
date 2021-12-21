% velocity and acceleration graph
t=linspace(1,100);
syms t
x=13-10*t-2*t^2+0.8*t^3;
v=diff(x,1);
a=diff(x,2);
fplot(t,v,'linewidth',2,'color','b')
xlabel('time')
ylabel('differentials')
hold on
fplot(t,a,'color','r')
hold on
fplot(t,x,'--','color','g')
legend('velocity','accn','diplacement','location','northeast')
hold off
title(legend,'differentials')
title('functions')