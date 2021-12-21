%% NAME: ABHIJEET RAMESH DESHMUKH ... MIS: 111909002
%%     ODE SOLVER using  EULER'S METHOD AND Rk-2 METHOD.
clc;
clear all ;
%% INPUT 

f=input('enter input explicit function like dy/dt= @(t,y) -2*t*y  -dy/dt='); %given function
y0=input('enter initial conditon y(t0)  -y0=');
t0=input(' enter lower limit value of dependant variable  - t0=');
t_end=input(' enter upper limit value of dependant variable  - t_end=');
h=input('enter steps size - h=');
%% necessary variables
t=(t0:h:t_end);
N=length(t);
y=y0*ones(1,N);
%% exact solution
tic
[t_ex, y_ex]=ode45( f,[t0 ,t_end],y0); y_ex 
toc
%% EULER'S METHOD
tic
for i=1:N-1   % total N-1 partition
    y(i+1)=y(i)+h*f(t(i),y(i));
end
 y_E=y  %euler's y value vector 
 toc
%% RK-2 METHOD 
tic
for i=1:N-1
    k1=h*f(t(i),y(i));
    k2=h*f(t(i)+h/2,y(i)+k1/2);
    y(i+1)=y(i)+k2 ;
end
y_RK=y % RK-2's y value vector
toc
%% error analysis
format long
error_E=abs(y_E-y_ex);
error_RK=abs(y_RK-y_ex);
%% output 
 plot(t_ex,y_ex,'-b',t,y_E,'--k',t,y_RK,'-.r')
 legend('ode45','Eulers method','RK-2 method')
