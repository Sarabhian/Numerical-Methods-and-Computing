%% NAME :DESHMUKH ABHIJEET RAMESH  MIS:111909002
clc; clear all
%% step 1: input

sympref('FloatingPointOutput',true); % written decimal format answer
syms f(x)
syms x
f(x)=input('enter input function like cos(10*pi*x)+ sin(35*pi*x) '); %given function
xn=input(' enter value at which differentiation is to be found - xn=');
h=input('enter step size values like 0.1 or 0.5 or 0.01  h=');
%% step 2: exact differentiation value
tic
dfdx= diff(f,x,1); % diferentiation 
a=dfdx(xn); %accurate solution
%% step 3: differential by forward difference
df_f=(f(xn+h)-f(xn))/h ;% df_f is dydx by forward difference
Abs_error_f=abs((a-df_f)/a);

%% step 4: differential by central difference
df_c=(f(xn+h)-f(xn-h))/(2*h); % df_c is dydx by central difference
Abs_error_c=abs((a-df_c)/a);

%% step 5: differential by backward difference
df_b=(f(xn)-f(xn-h))/h;  % df_b is dydx by backward difference
Abs_error_b=abs((a-df_b)/a);
%% step 6:result
 dfdx,a,df_f,  df_c, df_b,Abs_error_f,Abs_error_c,Abs_error_b
 toc
