close

clear

clc



a = 1.2;



m1 = 1;

m2 = 0;

m3 = 2;



ic1 = 0.9;

ic2 = 0.1;

ic3 = 0.1;



tvalues = [0:1000];

x = linspace(0,1,1000);



K1 = 1.0*x;

K2 = 0.4*ones(1,length(x));

K3 = 2*-0.8;



u1 = zeros(1,length(x));

u2 = zeros(1,length(x));

u3 = zeros(1,length(x));



for i = 1:length(x)

    options = odeset('RelTol',1e-7,'AbsTol',1e-7);

    [t,u]=ode45(@lv,tvalues,[ic1*K1(i);ic2*K2(i);ic3*K3(i)],options,a,K1(i),K2(i),K3(i));

    

    u1(i)=u(end,1);

    u2(i)=u(end,2);

    u3(i)=u(end,3);

   

end



figure(1)

hold all

plot(x,u1,'-b','LineWidth',2);

plot(x,u2,'-g','LineWidth',2);

plot(x,u3,'-r','LineWidth',2);

plot(x,K1,'--b');

plot(x,K2,'--g');

plot(x,K3,'--r');

xlabel('x')

ylabel('N(x)')

axis([0 1 0 1])

hleg = legend('Species 1','Species 2','Species 3','Location','Best');

set(hleg);

















