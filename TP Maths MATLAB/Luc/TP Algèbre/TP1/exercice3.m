clear variables;
close all;
clc;

n=10;

A=diag(2*ones(1,n))+diag(-1*ones(1,n-1),-1)+diag(-1*ones(1,n-1),1);
%% Question 1

end
plot(1:lenght(lambda_tab),lambda_tab)

%% Question 2
P=zeros(n,n);
D=zeros(n,n);
B=A
for k=1:n
    if k>1
        B=B-D(k-1,k1)*e*e'/(e'*e);
    end
    e0=rand(n,1)