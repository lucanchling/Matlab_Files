clear variables;
close all;
clc;
N=50000; n=50;
a =-2; b = 3;
X = b - (b-a)*rand(1,N);
[h,xout] = hist(X,n);
bar(xout,h/trapz(xout,h))
f=1/(b-a);
plot(xout,f)

E_emp = mean(X);
sigma_emp = sqrt(std(X));

E_th = (a+b)/2;
sigma_th = sqrt((b-a)^2/12);
