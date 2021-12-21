%% NAME: ABHIJEET R. DESHMUKH...
 
%% Bisection method
clc; clear;
%% taking input 
syms x
f = input("Enter anonymous function in format(@(x) x^3+3*x+...):");
X1 = input("Enter lower limit X1:");
X2 = input("Enter upper limit X2:");
%% if guess is wrong
if f(X1)*f(X2)>0
    fprintf("guess of X1 and X2 is wrong ,pls run again and enter some other values")
    
else 
    accept_error=input("enter the acepted value error in root --format(.001%)");
    max_iter=input("enter max interations to be conducted-- 100 or 200 or 50 etc..");
    ar=accept_error; 
%% step 1: find the mid point and error 
mid=X1; iter=0;error=10;
 while error > ar
    oldmid=mid;
    mid=(X1+X2)/2;
    iter=iter+1;
    if mid~=0
        error=abs((oldmid-mid)/mid)*100 ; % percent error 
    end
%% step 2: check the root whether in lower half and upper half and change the X1 X2
   if f(X1)*f(mid)<0
       X2=mid;  % root in lower half
   elseif f(X2)*f(mid)<0
       X1=mid; % root in upper half
   elseif f(X1)==0
       mid=X1;
       error=0;
   else
       mid=X2;
      error=0;
   end
 %% step3:  check max iteratioins
 if iter==max_iter
     root=mid;
     fprintf("need more iterations pls increase max iterations")
     break
 end
 root=mid;
 end
 %% step4: final values
 fprintf("error =%d \n",error);
 fprintf("root =%d \n",root);
fprintf("iter=%d \n",iter );
end



 
  
       
 


    