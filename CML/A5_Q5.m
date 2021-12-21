 
%QUESTION__5


[t,x]=ode23s(@Dx,[0 5],[1;0]);
plot(t,x(:,1),t,x(:,2))
legend('x_1''=x_2','x_2''=-2x_1-3x_2+1','location','best')
xlabel('T');ylabel('X');
function Dx=Dx(~,x)
 Dx=[x(2);-2*x(1)-3*x(2)+1];
end


