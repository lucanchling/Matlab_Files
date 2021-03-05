clear variables;
close all;
clc;

lambda = .3; mu = .5;
N=10000;
X=zeros(1,N);
Y=zeros(1,N);
Z=zeros(1,N);
for k=1:N
    X(k)= LoiGeometrique(lambda);
    Y(k)= LoiGeometrique(mu);
    Z(k)=min(X(k),Y(k));
end

figure()
% Loi de X
subplot 131
hold on;
% loi empirique
[h_emp,xout] = hist(X,(1:max(X)));
bar(xout,h_emp/N)

% loi théorique
h_th= zeros(1,max(X));
for k=1:max(X)
    h_th(k) = (1-lambda)^(k-1)*lambda;
end
bar(xout,h_th,.5,'w')
legend('Empirique','Théorique')
title('Loi de X')

% Loi de Y
subplot 132
hold on;
% loi empirique
[h_emp,xout] = hist(Y,(1:max(Y)));
bar(xout,h_emp/N)

% loi théorique
h_th= zeros(1,max(Y));
for k=1:max(Y)
    h_th(k) = (1-mu)^(k-1)*mu;
end
bar(xout,h_th,.5,'w')
legend('Empirique','Théorique')
title('Loi de Y')

% Loi de Z
subplot 133
hold on;
% loi empirique
[h_emp,xout] = hist(Z,(1:max(Z)));
bar(xout,h_emp/N)

% loi théorique
p=.82;
h_th= zeros(1,max(Z));
for k=1:max(Z)
    h_th(k) = (1-p)^(k-1)*p;
end
bar(xout,h_th,.5,'w')
legend('Empirique','Théorique')
title('Loi de Z')