%QUESTION__4


[t,x]=ode45(@Dx,[0 8],[0;0;0]);
plot(t,x(:,1),t,x(:,2),t,x(:,3))
legend('x1','x2','x3')
xlabel('T');ylabel('X');
function Dx=Dx(~,x)
 Dx=[-5 0 -100; 2 -2 0;0 0.1 -0.8]*x+[0;0;-0.1]*(0.2);
end


