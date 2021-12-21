function I=cinv(a)
n=size(a,1);
I=eye(n);
for i=1:n
    I(i,:)=I(i,:)/a(i,i);
    a(i,:)=a(i,:)/a(i,i);
    for j=i+1:n
        I(j,:)=I(j,:)-a(j,i)*I(i,:);
        a(j,:)=a(j,:)-a(j,i)*a(i,:);
    end
end
for i=n:-1:1
    for j=i-1:-1:1
        I(j,:)=I(j,:)-a(j,i)*I(i,:);
        a(j,i)=a(j,i)-a(j,i)*a(i,i);
    end
end
end