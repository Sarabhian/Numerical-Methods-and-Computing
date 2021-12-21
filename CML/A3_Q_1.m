x=0:0.01*pi :4*pi;
y1=sin(x);y2=cos(x); y3=tan(x); y4=csc(x);y5=sec(x);y6=cot(x);
subplot(3,2,1)
plot(x,y1); xlabel('x');ylabel('sin(x)');title('sine');
subplot(3,2,2)
plot(x,y2,'+'); xlabel('x');ylabel('cos(x)');title('cosine');
subplot(3,2,3)
plot(x,y3,':'); xlabel('x');ylabel('tan(x)');title('tangent');
subplot(3,2,4)
plot(x,y4,'--'); xlabel('x');ylabel('csc(x)');title('cosecant');
subplot(3,2,5)
plot(x,y5); xlabel('x');ylabel('sec(x)');title('secant');
subplot(3,2,6)
plot(x,y6); xlabel('x');ylabel('cot(x)');title('cotangent');
