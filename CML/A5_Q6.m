
%QUESTION__6

fun=@f_1;
x0=1;
x=fsolve(fun,x0);

fprintf('\n root =%d\n',x);
function y=f_1(x)
  
  y=3*x^3-2*x^2+x-7;
end