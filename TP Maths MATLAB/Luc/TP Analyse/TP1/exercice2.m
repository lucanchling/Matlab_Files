clear variables;close all;clc;
i=complex(0,1);
% axe temporel
t_min=-5;t_max=5;t_step=0.01;t=t_min:t_step:t_max;
% axe fréquentiel
nu_min=-10;nu_max=10;nu_step=0.1;nu=nu_min:nu_step:nu_max;

signal=1;
switch signal 
    case 1
        f=porte(t);
        tf_exact=sinc(nu);
    case 2
        f=porte(t-2);
        tf_exact=sinc(nu)*exp(-2*i*pi*nu*2);
    case 3
        f=porte(t./3);
        tf_exact=3*sinc(3.*nu);
    case 4
        f=t.*porte(t);
        tf_exact=2;
end

% affichage du signal
figure(1)
plot(t,f);
legend('signal');legend('boxoff');

% calcul de la transformée de fourier
tf_approx=zeros(length(nu));
for k=1:length(nu)
    tf_approx(k)=trapz(f*exp(-2*i*pi*nu(k)*t(k)));
end

% affichage d ela TF
figure(2);

% Partie réelle
subplot 221
hold on;
plot(nu,real(tf_approx))
plot(nu,real(tf_exact))
title('Real(TF)')
legend('approx.','exact');legend('boxoff');

% Partie imaginaire
subplot 222
hold on;
plot(nu,imag(tf_approx))
plot(nu,imag(tf_exact))
title('Imag(TF)')
legend('approx.','exact');legend('boxoff');

% Module 
subplot 223
hold on;
plot(nu,abs(tf_approx))
plot(nu,abs(tf_exact))
title('Module(TF)');
legend('approx.','exact');legend('boxoff');

% Phase
subplot 224
hold on;
plot(nu,angle(tf_approx))
plot(nu,angle(tf_exact))
title('Phase(TF)');
legend('approx.','exact');legend('boxoff');

