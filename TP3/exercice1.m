clear variables;
close all;
clc;

hold on;
n_cases=24;
cx=[0:n_cases];
cy=[0:n_cases];
[CX,CY]=meshgrid(cx,cy);
mesh(CX,CY,zeros(n_cases+1,n_cases+1));

M = zeros(n_cases);
n_impacts=537;

for k=1:n_impacts
    i = n_cases - n_cases*rand(1,1);
    j = n_cases - n_cases*rand(1,1);
    plot(i,j,'xr')
    m = floor(i)+1;
    n = floor(j)+1;
    M(m,n)= M(m,n) + 1;
end

M=M(:);

figure()

[h_emp,xout] = hist(M,0:max(M));
bar(xout,h_emp)

lambda = n_impacts/ (n_cases^2);
% loi théorique
h_th= zeros(1,max(M)+1);
for k=1:max(M)+1
    h_th(k) = exp(-lambda)*(lambda^(k-1))/factorial(k-1);
end
hold on;
bar(xout,h_th*n_impacts,.5,'g')

%% Question d
clear variables;
close all;
clc;

hold on;
n_cases=24;
cx=[0:n_cases];
cy=[0:n_cases];
[CX,CY]=meshgrid(cx,cy);
mesh(CX,CY,zeros(n_cases+1,n_cases+1));

M = zeros(n_cases);
n_impacts=537;

for k=1:n_impacts
    i = LoiUniforme(n_cases);
    j = LoiUniforme(n_cases);
    plot(i,j,'xr')
    M(i,j)= M(i,j) + 1;
end

M=M(:);

figure()

[h_emp,xout] = hist(M,0:max(M));
bar(xout,h_emp)

lambda = n_impacts/ (n_cases^2);
% loi théorique
h_th= zeros(1,max(M)+1);
for k=1:max(M)+1
    h_th(k) = exp(-lambda)*(lambda^(k-1))/factorial(k-1);
end
hold on;
bar(xout,h_th*n_impacts,.5,'g')

