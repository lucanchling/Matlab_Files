clear variables;
close all;
clc;

N=2^12;D=1;
dt = 2*D/N;
t=-D:dt:D-dt;
T=2.^[-5,-6];
i=-1;
for k=1:2
    i=i+2;
    p = peigne(T(k),t);
    [P,f] = TransFourier(p,t);
    figure(1)
    subplot(2,2,i)
    plot(t,p)
    title('peigne')
    figure(1)
    subplot(2,2,i+1)
    plot(f,P)
    title('TF(peigne)')
end
%%
N=2^12;D=1;
dt = 2*D/N;
t=-D:dt:D-dt;
T=2.^[-5,-6];
mu0 = 5;
s=exp(t.^2*(-1)*pi).*cos(2*pi*mu0*t);
[S,f]=TransFourier(s,t);

z=s.*peigne(T(2),t);
[Z,f]=TransFourier(z,t);

figure(1)
subplot 311
plot(t,s,t,z,'r.')
title('échantillonnage')
legend('s(t)','z(t)')
subplot 312
plot(f,S)
title('TF(s(t))')
axis([-50,50,0,1])
subplot 313
plot(f,Z)
title('TF(z(t))')
axis([-500,500,0,.016])



    