
% QUESTION__8

tspan = [0 5];
y0 = 0;
[t,y] = ode23(@(t,y) 2*t, tspan, y0);
plot(t,y,'-C*','color','r')
xlabel('T value');ylabel('X value');
title('geometric meaning of ode')