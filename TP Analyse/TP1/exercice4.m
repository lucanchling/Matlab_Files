clear variables;
close all;
clc;

N=2^16;D=4;
t=linspace(-D,D,N);


i=1;
figure()
for k=[1,3,5,7]
    subplot(2,2,i)
    plot(t,g_sigma(t,1/(2^k)))
    title("gsigma pour k = " + k + " ")
    i=i+1;
end

i=1;
figure()
for k=[1,3,5,7]
    subplot(2,2,i)
    hold on;
    [S,f]=TransFourier(g_sigma(t,1/(2^k)),t);
    plot(f,real(S))
    plot(f,imag(S))
    title("TF(gsigma) pour k = " + k + " ")
    legend('Partie Réelle','Partie Imaginaire')
    i=i+1;
end