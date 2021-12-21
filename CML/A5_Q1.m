% QUESTION___1
%1.1
syms y(t)
 eqn1=2*y+t==diff(y(t));
 
soln1=dsolve(eqn1) 

%1,2
syms y(x)
eqn2=diff(y(x))==2*y+y^2;
soln2=dsolve(eqn2,y(0)==1)

