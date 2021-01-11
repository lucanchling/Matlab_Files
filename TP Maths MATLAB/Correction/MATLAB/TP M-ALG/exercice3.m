%question 1
format long
n=6;
d1=2*ones(1,n);
d2=-1*ones(1,n-1);
A=diag(d1)+diag(d2,-1)+diag(d2,1);

precision=0.001;
k=0;
x=[k];
lambda0=1;
y=[lambda0];
Xk=rand(n,1);
Xk1=A*Xk;
delta=1

while delta> precision
    Xk1=A*Xk;
    lambda = norm(Xk1)/norm(Xk);
    delta=abs(lambda-lambda0);
    Xk1=Xk1/norm(Xk1);
    x=[x,k];
    y=[y,lambda0];
    lambda0=lambda;
    Xk=Xk1;
    k=k+1;
end
Xk1
plot(x,y,'r')

%question 2
P=zeros(n,n);
D=zeros(n,n);
B=A;
for k=1:n
    if k>1
        B=B-D(k-1,k-1)*Xk*Xk'/(Xk'*Xk);
    end
    precision=0.001;
    k=0;
    x=[k];
    lambda0=1;
    y=[lambda0];
    Xk=rand(n,1);
    Xk1=A*Xk;
    delta=1

    while delta> precision
        Xk1=A*Xk;
        lambda = norm(Xk1)/norm(Xk);
        delta=abs(lambda-lambda0);
        Xk1=Xk1/norm(Xk1);
        x=[x,k];
        y=[y,lambda0];
        lambda0=lambda;
        Xk=Xk1;
        k=k+1;
    end
    D(k,k)=lambda0;
    P(:,k)=Xk;
end
D
P
