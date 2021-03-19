clear variables;
close all;
clc;

k=[3,4,5,6,7,8];
X=[4/20,1/20,3/20,7/20,2/20,3/20];
subplot 311
bar(k,X)
E1=k*X';
sigma1=sqrt(k.^2*X'-E1^2);

Y=conv(X,X);

subplot 312
bar((6:16),Y)

n=10;
Z=X;
for i = 1:n-1
    Z = conv(X,Z);
end

subplot 313
hold on;
kk=linspace(min(k)*n,max(k)*n,length(Z));
bar(kk,Z)
E=kk*Z';
sigma=sqrt(kk.^2*Z'-E^2);
mu=E1*n;
sigma=sigma1*sqrt(n);
f=(1/(sigma*sqrt(2*pi)))*exp(-((kk-mu).^2)/(2*sigma^2));
plot(kk,f)

