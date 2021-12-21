%% NAME: ABHIJET R. DESHMUKH . . . MIS:111909002
 

%% The following formula can then be used to
% generate a UNIFORM DISTRIBUTION on another interval:
% runiform = low + (up – low) * rand(m, n)
% where low = the lower bound and up = the upper bound

clc
format short g    % keeps limited digits after decimal in g
n = 1000; t = 4; m = 68.1; g = 9.81;

cd = 0.25 ;
cdmin = cd - 0.025;cdmax = cd + 0.025; % given that cd varys around 10% of mean(0.25) 

r = rand(n,1);
cdrand = cdmin+(cdmax - cdmin)*r;

meancdnorm = mean(cdrand);
stdcd = std(cdrand);
deltacd = ((max(cdrand) - min(cdrand))/(2*meancdnorm))*100;

subplot(2,2,1)
histogram(cdrand,'FaceColor','b')
title('Uniform Distribution of drag')
xlabel('cd (kg/m)')

velocity = sqrt(g*m./cdrand).*tanh(sqrt(g*cdrand/m)*t);
meanvelnorm = mean(velocity);
deltavel = (max(velocity) - min(velocity))/meanvelnorm/2*100;
subplot(2,2,2)
histogram(velocity,'FaceColor','y')
title('Uniform Distribution of velocity')
xlabel('v (m/s)')




%%  FUNCTION randn
% This function generates a sequence of numbers that are normally distributed with a mean of
% 0 and a standard deviation of 1. A simple representation of its syntax is
%  r = randn(m, n)
% where r = an m-by-n matrix of random numbers. The following formula can then be used to
% generate a normal distribution with a different mean (mn) and standard deviation (s),
%  rnormal = mn + s * randn(m, n)



n = 1000;t = 4;m = 68.1;g = 9.81;

cd = 0.25;
stdev = 0.01443;
r = randn(n,1);
cdrand = cd + stdev*r;

meancdnorm = mean(cdrand);
stdevcdnorm = std(cdrand);

cvcd = stdevcdnorm/meancdnorm*100 ;  %coefficient of variation
subplot(2,2,3)
histogram(cdrand,'FaceColor','r')
title('Normal Distribution of drag')
xlabel('cd (kg/m)')

velocity = sqrt(g*m./cdrand).*tanh(sqrt(g*cdrand/m)*t);
meanvelnorm = mean(velocity);
stdevvnorm = std(velocity);
cvvel = stdevvnorm/meanvelnorm*100;
subplot(2,2,4)
histogram(velocity,'FaceColor','k')
title('Normal Distribution of velocity')
xlabel('v (m/s)')
