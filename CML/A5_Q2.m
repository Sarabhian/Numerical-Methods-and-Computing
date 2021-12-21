%QUESTION___2

%2.1


[t,x]=ode45(@de1,[0 4],[1 1]);
plot(t,x(:,1),t,x(:,2))
legend('x1''=2x2','x2''=2x1+4x2-6','location','bestoutside')


function D1X=de1(~,x) 
  D1X=zeros(2,1);
  D1X(1)=2*x(2);
  D1X(2)=2*x(1)+4*x(2)-6;
end
  