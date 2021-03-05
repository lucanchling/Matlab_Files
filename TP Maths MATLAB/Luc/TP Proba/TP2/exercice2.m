clear variables;
close all;
clc;

%% Loi Uniforme
clear variables;
close all;
clc;
N = 10000;
n=10;
X=zeros(1,N);
for k=1:N
    X(k)= LoiUniforme(n);
end

hold on;
% loi empirique
[h_emp,xout] = hist(X,(1:n));
bar(xout,h_emp/N)

% loi théorique
h_th= zeros(1,n);
for k=1:n
    h_th(k) = 1/n;
end
bar(xout,h_th,.5,'w')

% Espérance & Variance
E_emp = mean(X);
V_emp = std(X);
E_th = (n^2+1)/2;
V_th = (n^2-1)/12;

legend('empirique','théorique')
title(['Simulation Loi',str])
text(max(X)+.5,max(h_th)/2,{['E_t_h=',num2str(E_th)],['E_e_m_p=',num2str(E_emp)],['V_t_h=',num2str(V_th)],['V_e_m_p=',num2str(V_emp)]})
%% Loi Bernoulli
clear variables;
close all;
clc;
N = 10000;
p=.47;
X=zeros(1,N);
for k=1:N
    X(k)= LoiBernoulli(p);
end

hold on;
% loi empirique
[h_emp,xout] = hist(X,(0:1));
bar(xout,h_emp/N)

% loi théorique
h_th = [1-p p];
bar(xout,h_th,.5,'w')

% Espérance & Variance
E_emp = mean(X);
V_emp = std(X);
E_th = p;
V_th = p*(1-p);

%% Loi Binomiale
clear variables;
close all;
clc;
N = 10000;
n=10;p=.47;
X=zeros(1,N);
for k=1:N
    X(k)= LoiBinomiale(n,p);
end

hold on;
% loi empirique
[h_emp,xout] = hist(X,(1:n));
bar(xout,h_emp/N)

% loi théorique
h_th= zeros(1,n);
for k=1:n
    h_th(k) = (factorial(n)/(factorial(k)*factorial(n-k)))*p^k*(1-p)^(n-k);
end
bar(xout,h_th,.5,'w')

% Espérance & Variance
E_emp = mean(X);
V_emp = std(X);
E_th = n*p;
V_th = n*p*(1-p);

%% Loi géométrique
clear variables;
close all;
clc;
N = 10000;
p=.47;
X=zeros(1,N);
for k=1:N
    X(k)= LoiGeometrique(p);
end

hold on;
% loi empirique
[h_emp,xout] = hist(X,(1:max(X)));
bar(xout,h_emp/N)

% loi théorique
h_th= zeros(1,max(X));
for k=1:max(X)
    h_th(k) = (1-p)^(k-1)*p;
end
bar(xout,h_th,.5,'w')

% Espérance & Variance
E_emp = mean(X);
V_emp = std(X);
E_th = p;
V_th = p*(1-p);


%% Utilisation du case :
clear variables;
close all;
clc;
loi = input('Loi à simuler (1,2,3 ou 4) :');

a=1;
switch loi
    case 1 % Loi Uniforme
        N = input('Nombre de test : ');
        n = input('n = ');
        X=zeros(1,N);
        for k=1:N
            X(k)= LoiUniforme(n);
        end
        h_th= zeros(1,n);
        for k=1:n
            h_th(k) = 1/n;
        end
        E_th = (n^2+1)/2;
        V_th = (n^2-1)/12;
        str ='Uniforme';
    case 2 % Loi Bernoulli
        a=0;
        N = input('Nombre de test : ');
        p = input('p = ');
        X=zeros(1,N);
        for k=1:N
            X(k)= LoiBernoulli(p);
        end
        h_th = [1-p p];
        E_th = p;
        V_th = p*(1-p);
        str='Bernoulli';
    case 3 % Loi Binomiale
        N = input('Nombre de test : ');
        n = input('n = ');
        p = input('p = ');
        X=zeros(1,N);
        for k=1:N
            X(k)= LoiBinomiale(n,p);
        end
        h_th= zeros(1,n);
        for k=1:n
            h_th(k) = (factorial(n)/(factorial(k)*factorial(n-k)))*p^k*(1-p)^(n-k);
        end
        E_th = n*p;
        V_th = n*p*(1-p);
        str='Binomiale';
    case 4 % Loi Géométrique
        N = input('Nombre de test : ');
        p = input('p = ');
        X=zeros(1,N);
        for k=1:N
            X(k)= LoiGeometrique(p);
        end
        h_th= zeros(1,max(X));
        for k=1:max(X)
            h_th(k) = (1-p)^(k-1)*p;
        end
        E_th = p;
        V_th = p*(1-p);
        str='Géométrique';
end


hold on;
% loi empirique
[h_emp,xout] = hist(X,(a:max(X)));
bar(xout,h_emp/N)

% loi théorique
bar(xout,h_th,.5,'w')

% Espérance & Variance
E_emp = mean(X);
V_emp = std(X);

legend('Empirique','Théorique')
title(['Simulation Loi ',str])
text(max(X)+.5,max(h_th)/2,{['E_t_h=',num2str(E_th)],['E_e_m_p=',num2str(E_emp)],['V_t_h=',num2str(V_th)],['V_e_m_p=',num2str(V_emp)]})