% NAME: ABHIJEET R. DESHMUKH.... MIS:111909002
% question2 :solution using ode45 

[t,x]=ode45(@Dx,[0 8],[1;2;3]);
plot(t,x(:,1),t,x(:,2),t,x(:,3))
legend('x_1','x_2','x_3')
title('system of ode')
xlabel('T');ylabel('X');
function Dx=Dx(~,x)
 Dx=[10*(x(2)-x(1)); x(1)*(27-x(3))-x(2);x(1)*x(2)-8/x(3)];
end



