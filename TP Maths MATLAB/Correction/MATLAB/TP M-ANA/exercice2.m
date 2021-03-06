clear variables;close all;
i=complex(0,1);
% axe temporel
t_min=-5;
t_max=5;
t_step=0.01;
t=t_min:t_step:t_max;

% axe fréquentiel
nu_min=-10;
nu_max=10;
nu_step=0.1;
nu=nu_min:nu_step:nu_max;

% choix du signal
signal=4;
switch signal
    case 1
        f= porte(t);% signal
        tf_exact= sinc(nu);  % transformée de Fourier exacte
    case 2
        f= porte(t-2);% signal
        tf_exact= exp(-2*i*pi.*nu.*2).*sinc(nu);  % transformée de Fourier exacte
    case 3
        f= porte(t/3);% signal
        tf_exact= 3.*sinc(3.*nu);  % transformée de Fourier exacte
    case 4
        f= t.*porte(t);% signal
        tf_exact= i.*(cos(nu).*nu - sin(nu))./(nu).^2;  % transformée de Fourier exacte
end

% affichage du signal
figure(1);
plot(t,f); % (commande plot)
legend('signal');legend('boxoff');

% calcul de la transformée de Fourier (calcul approché)
tf_approx=zeros(1,length(nu)); % initialisation (commande zeros)
for k=1:length(nu)
    tf_approx(k)= trapz(f.*exp(-2*i*pi*nu(k)*t(k)));% (commande trapz)
end

% affichage de la TF
figure(2);

% partie réelle
subplot(2,2,1);hold on;
plot(nu,real(tf_approx),'k');
plot(nu,real(tf_exact),'r');
title('Real(TF)');
legend('approx.','exact');legend('boxoff');

% partie imaginaire
subplot(2,2,2);hold on;
plot(nu,imag(tf_approx),'k');
plot(nu,imag(tf_exact),'r');
title('Imag(TF)');
legend('approx.','exact');legend('boxoff');

% module
subplot(2,2,3);hold on;
plot(nu,abs(tf_approx),'k');
plot(nu,abs(tf_exact),'r');
title('Module(TF)');
legend('approx.','exact');legend('boxoff');

% phase
subplot(2,2,4);hold on;
plot(nu,angle(tf_approx),'k');
plot(nu,angle(tf_exact),'r');
title('Phase(TF)');
legend('approx.','exact');legend('boxoff');