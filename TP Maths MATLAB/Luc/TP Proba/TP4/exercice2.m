clear variables;
close all;
clc;

n=5000;

Y = LoiUniforme(0,1,n);

X = exp(Y*log(6))-4;

[h,xout]=hist(X,50);
hold on;
bar(xout,h/trapz(xout,h))

f=((xout+4)*log(6)).^(-1)

plot(xout,f)

%% Partie 2
clear variables; close all;
n=100000;% nombre d’expériences
Y1= .5*rand(n,1) % VA uniforme sur [0,1/2] 
Y2= .5*rand(n,1) +.5 % VA uniforme sur [1/2,1]
X1= sqrt(8*Y1) % simulation de la VA X sur [0,2[
X2= 4-sqrt(32*(1-Y2))/2 % simulation de la VA X sur [2,4[
X= [X1;X2] % concaténation des VA X1 et 
X2[h,xout]=hist(X,50)  % calcul de l’histogramme de X
bar(xout,h/trapz(xout,h));
% affichage de l’histogramme de X
mu_emp= mean(X) % moyenne empirique
sigma_emp= sqrt(std(X))% écart type empirique
mu_th= 2;% moyenne théorique
sigma_th= sqrt(2/3);% écart type théorique
fprintf('Moyenne empirique : %f,\t Moyenne théorique : %f\n',mu_emp,mu_emp);
fprintf('Ecart type empirique : %f,\t Ecart type théorique : %f\n',sigma_emp,sigma_th);

f=(.5*triangle((xout-2)/2));
plot(xout,f)
legend('empirique','théorique');
title('loi de X sur [0,4]');