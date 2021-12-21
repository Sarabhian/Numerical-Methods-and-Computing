% RICHER SCALE

E=10^5*(linspace(1,100000));
M=(2/3)*(log(E/(10^4.4)));

%figure
loglog(M,E,'-.o','color','b')
xlim([3 8])
xlabel('M--magnitude')
ylabel('log(E)','FontSize',15)
legend('energy')
title('Richer scale')
