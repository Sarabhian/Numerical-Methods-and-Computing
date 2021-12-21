%% NAME:ABHIJET R. DESHMUKH...MIS :111909002
%% ANML FINAL ASSIGNMENT
%% Q1
cd=0.25;
g=9.81;
v=36; t=4;
mp=linspace(50,200);
fp=sqrt(g*mp/cd).*tanh(sqrt(g*cd./mp)*t)-v;
plot(mp,fp)
grid on
%% Q2
%% Define the function whose root we're searching for
r = 2; % [m]
L = 5; % [m^3]
V = 8; % [m^3]

F = @(h)  V - (r^2*acos((r-h)/r)-(r-h).*sqrt(2*r*h-h.^2))*L; 


%% Plot the function so we can find the range for the seatch
h = 0:0.001:1;
plot(h, F(h), 'b', h, 0*h, 'r--');
legend('F(h)', 'y = 0');
xlabel('h');

%% Find the root
% from the plot we estimate that the root is around zero
h0 = 0.8; % the right root
h = fzero(F, h0)

%% Q3 
% intial conditions
x0=1.5;
tolx=1e-4;
%computation using fixed point iteration
x=x0;
xold=x0;
for i=1:100
    f=9*pi*x^2-pi*x^3-90;
    df=18*pi*x-3*pi*x^2;
    x=x-f/df;
    err=abs(x-xold);
    xold=x;
    if (err < tolx)
        break
    end
end
disp(xold)
%% Q4:polynomial interpolation
Av = [2.36 2.4 2.45 2.5 2.55 2.6];
map = [81 91 99 93 101 114];

sum = 0;
a = 2.58;
for i = 1:length(Av)
    u = 1;
    L = 1;
    for j = 1:length(Av)
        if j ~= i
            u = u * (a - Av(j));
            L = L * (Av(i) - Av(j));
        end
    end
    sum= sum + u / L * map(i);
end
disp(sum);
disp(j-1);
%% Q5:simpson's 1/3rd rule 
syms x
syms f(x)
f(x) =exp(-2*x) + 3*sqrt(x);
a = input("Enter initial value:");
b = input("Enter final value:");
I=int(f(x),a,b)
Is=0;h=0.01;
N=(b-a)/(h);
for i=0:N-1
    x=a+h*i;
    Is=Is+(h/6)*(f(x)+4*f(x+h/2)+f(x+h));
end
Is,Abs_error_s=abs(Is-I)

%% Q6: 
t=[0:5:35];
x=[0 20 43 59 89 124 154 200];

v_f1= (x(5) -x(4))/(t(5)-t(4)) %forward diference velocity t=15
v_f2=(x(7) -x(5))/(t(7)-t(5))  % forward difference velocity t=25
v_c= (x(5)-x(3))/(t(5)-t(3)) % central diference velocity at t=15 
a=(x(5)-x(4) -(x(4) -x(3)))/(t(4)-t(3))^2 
           % central diference acceleration at t=15
v_3f=(-3*x(1)+4*x(2)-x(3))/(t(3)-t(1))
             %3 point forward difference
%% Q7
t = [0,5,10,15,20,25,30,35];
x = [0,20,43,59,89,124,154,200];
ti=0;
ti2=0;
ti3=0;
ti4=0;
xi=0;
xiti=0;
xiti2=0;
for i = 1:size(x,2)
    ti = t(i) + ti;
    ti2 = t(i)^2 + ti2;
    ti3 = t(i)^3 + ti3;
    ti4 = t(i)^4 + ti4;
    xi = x(i) + xi;
    xiti = x(i)*t(i) + xiti;
    xiti2 = x(i)*(t(i)^2) + xiti2;
end
A = [8,ti,ti2;ti,ti2,ti3;ti2,ti3,ti4];

[m n]=size(A);
L=zeros(m,m);
U=zeros(m,m);
for i=1:m
    for k=1:i-1
        L(i,k)=A(i,k);
        for j=1:k-1
            L(i,k)= L(i,k)-L(i,j)*U(j,k);
        end
        L(i,k) = L(i,k)/U(k,k);
    end
    for k=i:m
        U(i,k) = A(i,k);
        for j=1:i-1
            U(i,k)= U(i,k)-L(i,j)*U(j,k);
        end
    end
end
for i=1:m
    L(i,i)=1;
end
U
L

%% Q8
A=[1,1,1;3,4,7;0,-1,1];
B=[50000;265000;10000];
C=linsolve(A,B);
disp('amount invested in money market is');
disp(C(1));
disp('amount invested in municipal bond is');
disp(C(2));
disp('amount invested in mutual fund is');
disp(C(3));

%% Q9
syms y x 
fn=input('Enter the function = '); %enter f=4-4/3*y  % For input function from user
f=inline(fn);                          

x0=0; 
y0=0;
h=0.2;
n=10; 
a1=1/3;
a2=2/3;
true_val=2.79154

 for i=1:n
           k1=f(y0);
           k2=f(y0+(3/4)*k1*h);
           yn=y0+(a1*k1+a2*k2)*h;
           xn=x0+h;
           x0=xn;
           y0=yn;
 end
 yn
 error=((true_val-yn)/true_val)*100
 %% Q10
 gamma=0.05 %growth rate
Nmax=100 % carrier capacity

%% Case-1

y01=35.5; %initial value
tspan=[0:50]; % for population untill 50 years
[t1,N1]=ode45(@(t,N)gamma*N.*(1-(N/Nmax)),tspan,y01);
sol_1=N1(end)

%% Case-2

y02=100; %initial value
tspan=[0:100]; % for population untill 50 years
[t1,N2]=ode45(@(t,N)gamma*N.*(1-(N/Nmax)),tspan,y02);
sol_2=N2(end)
 


