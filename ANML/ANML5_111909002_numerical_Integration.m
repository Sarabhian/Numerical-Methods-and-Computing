%% NAME: ABHIJEET RAMESH DESHMUKH MIS:111909002
%% NUMERICAL INTEGRATION USING TRAPEZOIDAL METHOD
                               %% AND SIMPSON'S 1/3RD RULE 
clear all                              
%% INPUT
syms f(x)
syms x
f=input('enter input function like @(x) x.^2+2*x+1 '); %given function
a=input(' enter lower limit value  - a=');
b=input(' enter upper limit value  - b=');
N=input('enter total number of steps - N=');
%% exact solution 
I=integral(f,a,b)
%% TRAPEZOIDAL METHOD
Iz=0;
h=(b-a)/(N);
tic
for i=0:N-1
    x=a+h*i;
    Iz=Iz+(h/2)*(f(x)+f(x+h));
end
Iz, Abs_error_z=abs(Iz-I)
toc
%% SIMPSON'S 1/3rd RULE 
Is=0;tic
for i=0:N-1
    x=a+h*i;
    Is=Is+(h/6)*(f(x)+4*f(x+h/2)+f(x+h));
end
Is,Abs_error_s=abs(Is-I)
toc