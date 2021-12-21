%QUESTION__2

%2.2


[t,y]=ode45(@de1,[0 0.5],[1 1]);
plot(t,y(:,1),t,y(:,2))
legend('y1''=2(y1)^2+6(y2)+6','y2''=y2^2+4(y2)+3','location','best')


function D1Y=de1(~,y) 
  D1Y=zeros(2,1);
  D1Y(1)=2*y(1)^2+6*y(2)+6;
  D1Y(2)=y(2)^2+4*y(2)+3;
end
  