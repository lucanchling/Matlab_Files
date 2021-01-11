clear variables;
close all;
clc;

N=2^16;D=4;
dt = 2*D/N;
t=-D:dt:D-dt;
sigma = 2.^[-1,-3,-5,-7];

for k=1:4
    % Gaussienne
    g = 1/(sigma(k)*sqrt(2))*exp(-t.^2/(2*sigma(k)^2));
    figure(1);
    subplot(2,2,k)
    plot(t,g)
    % TF  de la gaussienne
    [tf_g,nu]= TransFourier(g,t);
    figure(2);
    subplot(2,2,k)
    plot(nu,tf_g)
    axis([-100,100,0,1]);
end
%%
clear variables;close all;clc;
N=2^16;D=4;
dt = 2*D/N;
t=-D:dt:D-dt;
sigma = 2.^[-1,-3,-5,-7];
% Partie B
mu0 = 5;
s=exp(t.^2*(-1)*pi).*cos(2*pi*mu0*t);
[S,f]=TransFourier(s,t);
figure(3)
subplot 121
plot(t,s)
xlabel('temps (s)')
title('s(t)')
subplot 122
plot(f,S)
xlabel('temps (s)')
title('TF(s(t))')
axis([-10,10,0,.6])

for k = 1:4
    figure(2)
    subplot(4,1,k)
    g = 1/(sigma(k)*sqrt(2))*exp(-t.^2/(2*sigma(k)^2));
    plot(t,s,t,conv(s,g,'same')./max(conv(s,g,'same')))
    axis([-4,4,-1,1])
end



% i=1;
% figure()
% for k=[1,3,5,7]
%     subplot(2,2,i)
%     plot(t,g_sigma(t,1/(2^k)))
%     title("gsigma pour k = " + k + " ")
%     i=i+1;
% end
% 
% i=1;
% figure()
% for k=[1,3,5,7]
%     subplot(2,2,i)
%     hold on;
%     [S,f]=TransFourier(g_sigma(t,1/(2^k)),t);
%     plot(f,real(S))
%     plot(f,imag(S))
%     title("TF(gsigma) pour k = " + k + " ")
%     legend('Partie Réelle','Partie Imaginaire')
%     i=i+1;
% end

% Version du prof
