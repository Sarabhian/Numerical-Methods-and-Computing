%QUESTION__3

[T,X]=ode45(@odefunc,[0 20],[0 1]);

plot(T,X); xlabel('T') ;ylabel('X');
legend('T values','X values')
title(' solution of ode dx/dt')

function DX=odefunc(~,x)
  
 DX=-4*x;
end
