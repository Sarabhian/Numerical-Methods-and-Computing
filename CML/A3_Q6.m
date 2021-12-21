t=(0:0.01:20) ;
M=zeros(1, length(t) ) ;
V=zeros(1, size (t,1) ) ;
E=zeros(1, size (t, 2) ) ;
N=zeros(1, size (t, 2) ) ;
for i=1:size (t, 2)
M(i)=269.2*0.206/(1-0.206*cos(t(i))) ;
V(i)=159*0.0677/(1-0.0677*cos(t(i))) ;
E(i)=896.4*0.0164/(1-0.0164*cos(t(i))) ;
N(i)=242.1*0.0934/(1-0.0934 *cos(t(i))) ;
end
ax=tiledlayout(2, 2);
title(ax,'Orbits of planets')
nexttile
polarplot(t,M)
title('MARS')
nexttile
polarplot(t,V,'y')
title('VENUS')
nexttile
polarplot(t,E,'r')
title('EARTH')
nexttile
polarplot(t,N,'g')
title('NEPTUNE')