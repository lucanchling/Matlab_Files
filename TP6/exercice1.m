clear variables;
close all;
clc;
n=50000;
X=rand(n,1);
Y=rand(n,1);

X=-log(1-X);
Y=-log(1-Y)/2;

U = X+2*Y;

[h,xout]=hist(U,50);
bar(xout,h/trapz(xout,h));
hold on
x = linspace(min(xout),max(xout),10000);
f=x.*exp(-x);

plot(x,f,'linewidth',2);

legend('Empirique','théorique')

E_emp = mean(U);
V_emp = std(U)*std(U);

E_th = 2;
V_th = 2;

title(['Simulation Loi de U'])
text(max(U)-3.5,max(f)/2,{['E_t_h=',num2str(E_th)],['E_e_m_p=',num2str(E_emp)],['V_t_h=',num2str(V_th)],['V_e_m_p=',num2str(V_emp)]})
