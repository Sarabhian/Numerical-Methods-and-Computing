%% NAME:ABHIJEET R. DESHMUKH...MIS:111909002..BATCH:A
%% The Newton Raphson Method
clc;
close all;
clear 
syms x;
%% taking input
f=input("Enter anonymous function in format( x^3+3*x+...):");

accept_error=input("enter the acepted value error in root --format(.001%)");
max_iter=input("enter max interations to be conducted-- 100 or 200 or 50 etc..");
ar=accept_error;
%% step1: taking slope and initial value x_0
g=diff(f); %The Derivative of the Function
x0= input('Enter the intial guess value:');
%% step2: applying formula 
for i=1:max_iter
      f0=vpa(subs(f,x,x0)); %Calculating the value of function at x0
     f0_der=vpa(subs(g,x,x0)); %Calculating the value of function derivative at x0
  y=x0-f0/f0_der; % The Formula
err=abs(y-x0);
%% step3: checking the amount of error at each iteration
if err< ar
break
end
x0=y;
end
%% step4: final values
if err>ar
    fprintf("need more iterations to find root pls increase max iterations and re-run")
else
    
    fprintf('The Root is : %f \n',y);
    fprintf('No. of Iterations : %d\n',i);
end