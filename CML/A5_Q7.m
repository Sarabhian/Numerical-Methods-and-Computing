
%QUESTION__7

fun=@f_2;
y0=[0,0];
y=fsolve(fun,y0);
fprintf('\n root= %d\n',y);

function F=f_2(x)
  F=zeros(2,1);
  F(1)=exp(-exp(-x(1)+x(2)))-x(2)*(1+x(1)^2);
  F(2)=x(1)*cos(x(2))+x(2)*sin(x(1))-0.5;
end