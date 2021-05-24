clear variables;
close all;
clc;
n=50000;
X = LoiUniforme(0,1,n);
Y = LoiUniforme(0,1,n);

Z = min(X,Y);

[h,xout]=hist(Z,40);
bar(xout,h/trapz(xout,h))
hold on;
x=linspace(0,1,500);
f=2*(1-x);
plot(x,f,'linewidth',2)
legend('empirique','théorique')
%% 
clear variables;
close all;
clc;
n=50000;

X=rand(n,1);
Y=rand(n,1);
lambda = 2; 
X=-log(1-X)/lambda;
Y=-log(1-Y)/lambda;

Z = min(X,Y);

[h,xout]=hist(Z,40);
bar(xout,h/trapz(xout,h))
x=linspace(0,max(xout),500);
f = 2*lambda.*exp(-2*lambda*x);
hold on
plot(x,f,'linewidth',2)
legend('empirique','théorique')