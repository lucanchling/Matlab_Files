clear variables;
close all;
clc;

N=2^12;D=1;T1=1/(2^5);T2=(1/2^6);
t=linspace(-D,D,N);

figure()
subplot 221
plot(T1*t,peigne(T1,t))
title('Peigne 1')
sunplot 222
plot(TransFourier(peigne(T1,t),t))
title('TF Peigne 1')
subplot 223
plot(t,peigne(T2,t))
title('Peigne 2')
sunplot 224
plot(TransFourier(peigne(T2,t),t))
title('TF Peigne 2')