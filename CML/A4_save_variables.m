%file handling assignmen no. 4

x=linspace(-pi,pi);

y=cos(x);

%saving variables

save myvar x y -ASCII -append

clear vars

load myvar x y -ASCII
plot(x,y)
disp(x)



