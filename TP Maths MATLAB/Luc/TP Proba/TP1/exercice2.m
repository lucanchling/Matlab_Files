clear variables;
close all;
clc;

%% jeu de fléchettes :
clear variables;
close all;
clc;

N=500;

X = rand(1,N);
Y = rand(1,N);
figure(1)
cpt=0;
for i = 1:N
    hold on;
    if X(i)^2+Y(i)^2 <= 1
        cpt=cpt+1;
        plot(X(i),Y(i),'xg')
    else
        plot(X(i),Y(i),'xr')
    end
end

x=linspace(0,1,500);
y=sqrt(1-x.^2);

figure(1)
hold on;
plot(x,y)

%% Méthode calcul d'int
clear variables;
close all;
clc;

N=7000;
e = exp(1);
X = e - (e-1)*rand(1,N);
Y = .5*rand(1,N);
figure(1)
cpt=0;
for i = 1:N
    hold on;
    if  Y(i) <= log(X(i))/X(i)^2
        cpt=cpt+1;
        plot(X(i),Y(i),'xg')
    else
        plot(X(i),Y(i),'xr')
    end
end

%% Estimation Intégrale
clear variables;
close all;
clc;

N=10000;

X = linspace(1,3,N);
Y = zeros(1,N);
for i =1:N
    
Z = (X+Y).^-3;
figure(1)
cpt=0;
for i = 1:N
    hold on;
    if  Y(i) <= log(X(i))/X(i)^2
        cpt=cpt+1;
        plot(X(i),Y(i),'xg')
    else
        plot(X(i),Y(i),'xr')
    end
end

