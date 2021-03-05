clear varialbles;
close all;
clc;

N=5000;
n=8;
X=zeros(1,N);
for k=1:N
    B = randi(8,2,1);
    while B(1) == B(2)
        B = randi(8,2,1);
    end
    X(k)= min(B);
end
hold on;
% loi empirique
[h_emp,xout] = hist(X,(1:7));
bar(xout,h_emp/N)

% loi théorique
h_th =2*(n-(1:7))/(n*(n-1));
bar(xout,h_th,0.5,'w')

% Espérance & Variance
% Empirique
E_emp = mean(X);
V_emp = std(X);
% Théorique
E_th = (n+1)/3;
V_th = (n^2-n-2)/18;


