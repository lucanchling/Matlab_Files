clear variables;
close all;
clc;
n=50000;
X = LoiUniforme(1,2,n);
Y = LoiUniforme(1,2,n);

S = X+Y;
P = X.*Y;
Q = X./Y;

figure(1)

subplot 221


[h,xout]=hist(X,35);
bar(xout,h/trapz(xout,h))
title('loi uniforme sur [1,2]')
subplot 222

[h,xout]=hist(S,40);
bar(xout,h/trapz(xout,h))

x = linspace(min(xout),max(xout),10000);
f = triangle(x-3);
hold on
plot(x,f,'linewidth',2)
legend('Empirique','théorique')
title('S=X+Y')
subplot 223

[h,xout]=hist(P,40);
bar(xout,h/trapz(xout,h))

x1 = linspace(1,2,400);
x2 = linspace(2,4,400);
f1 = log(x1);
f2 = (2*log(2)-log(x2));
x = [x1 x2];
f = [f1 f2];

E_emp = mean(P);
V_emp=std(P)^2;
hold on
plot(x,f,'linewidth',2)
legend('Empirique','théorique')
title('P=X.Y')
subplot 224

[h,xout]=hist(Q,40);
bar(xout,h/trapz(xout,h))

x1 = linspace(.5,1,400);
x2 = linspace(1,2,400);
f1 = 2-(1./(2*x1.^2));
f2 = (2./x2.^2) - .5;
x = [x1 x2];
f = [f1 f2];
E_emp = mean(Q);
V_emp=std(Q)^2;
hold on
plot(x,f,'linewidth',2)
legend('Empirique','théorique')
title('Q=X/Y')
