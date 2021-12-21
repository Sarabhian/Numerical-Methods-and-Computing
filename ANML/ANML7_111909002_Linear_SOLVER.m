%% NAME: ABHIJEET RAMESH DESHMUKH. . . MIS: 111909002
%% LINEAR SOLVER ... GAUSS ELIMINATION METHOD and GAUSS JORDAN METHOD
clc;
clear all;
%% INPUT
 while(1)
    a=input("Enter matrix,A: ");
    b=input("Enter solution matrix,b: ");
    if size(a,1)+size(a,2)==2*size(b,1) && size(b,2)==1 %Ensuring to get proper input
        break
    else
        fprintf("Invalid input\nA should be sqaure matrix of nxn dimensions and b should vector of nx1\n")
    end
 end
%% necessary variables
    c=[a b]; %Forming augmented matrix
    if rank(a)< rank(c)
        fprintf('there are infinite solution to system \n so X_GE and X_jordan may come different \n');
    end
n=size(a,1); %Getting number of variables
X=zeros(size(b)); %Initialising variable matrix
 %% gauss elimination 
%Forward Elimination
for i=1:n
    if c(i,i)==0 %For ensuring that all diagonal elements of matrix are non-zero
        for j=1:n
            if c(j,i)~=0
                c(i,:)=c(i,:)+c(j,:);
                break
            end
        end
    end
    c(i,:)=c(i,:)/c(i,i);
    for j=i+1:n
        c(j,:)=c(j,:)-c(j,i).*c(i,:);
    end
end
a=c(:,1:n);b=c(:,n+1);
%Back Substitution
X(n)=b(n)/a(n,n);
for i=n-1:-1:1
    X(i)=b(i);
    for j=i+1:n
        X(i)=X(i)-a(i,j)*X(j);
    end
end
disp("X_GE=")
disp(X)


%% GAUSS JORDAN METHOD
while(1)
    a=input("ReEnter matrix,A: ");
    b=input("ReEnter solution matrix,b: ");
    if size(a,1)+size(a,2)==2*size(b,1) && size(b,2)==1 %Ensuring to get proper input
        break
    else
        fprintf("Invalid input\nA should be sqaure matrix of nxn dimensions and b should vector of nx1\n")
    end
end 

n=size(a,1); 
%Forward Elimination
for i=1:n
    if c(i,i)==0 %For ensuring that all diagonal elements of matrix are non-zero
        for j=1:n
            if c(j,i)~=0
                c(i,:)=c(i,:)+c(j,:);
                break
            end
        end
    end
    c(i,:)=c(i,:)/c(i,i);
    for j=i+1:n
        c(j,:)=c(j,:)-c(j,i).*c(i,:);
    end
end
%Back Substitution
for i=n:-1:1
    for j=i-1:-1:1
        c(j,:)=c(j,:)-c(j,i)*c(i,:);
    end
end
disp("X_jordan=")
disp(c(:,n+1))
clear
