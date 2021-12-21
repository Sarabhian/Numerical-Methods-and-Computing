t=[0:5:35];
x=[0 20 43 59 89 124 154 200];

v_f1= (x(5) -x(4))/(t(5)-t(4)) %forward diference velocity t=15
v_f2=(x(7) -x(5))/(t(7)-t(5))  % forward difference velocity t=25
v_c= (x(5)-x(3))/(t(5)-t(3)) % central diference velocity at t=15 
a=(x(5)-x(4) -(x(4) -x(3)))/(t(4)-t(3))^2 
           % central diference acceleration at t=15
v_3f=(-3*x(1)+4*x(2)-x(3))/(t(3)-t(1))
             %3 point forward difference
%%Q8
A=[1,1,1;3,4,7;0,-1,1];
B=[50000;265000;10000];
C=linsolve(A,B);
disp('amount invested in money market is');
disp(C(1));
disp('amount invested in municipal bond is');
disp(C(2));
disp('amount invested in mutual fund is');
disp(C(3))