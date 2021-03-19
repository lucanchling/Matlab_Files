clear variables;
clc;
close all;
N=10000;

U1 = rand(1,N);
U2 = rand(1,N);

X = sqrt(-2*log(U1)).*cos(2*pi*U2);
Y = sqrt(-2*log(U1)).*sin(2*pi*U2);

[h,xout]=hist(X,(-max(X):max(X)));
bar(xout,h/trapz(xout,h))
figure()
sigma=3;mu=4;
N=X*sigma+mu;
[h,xout]=hist(N,(-max(N):max(N)));
hold on;
bar(xout,h/trapz(xout,h))
f=(1/(sigma*sqrt(2*pi)))*exp(-((xout-mu).^2)/(2*sigma^2));
plot(xout,f)

