D=4;
N=2^16;
dt=2*D/N;
t=-D:dt:D-dt;
sigma=2.^[-1,-3,-5,-7];
nu0=5;

for k=1:4
    %gaussienne
    g=1/((sigma(k)).*sqrt(2*pi)).*exp((-t.^2)/(2*(sigma(k)).^2));
    figure(1);subplot(2,2,k);
    plot(t,g);
    %TF de la gaussienne
    [tf_g,nu]=TransFourier(g,t);
    figure(2); subplot(2,2,k);
    plot(nu,real(tf_g));
    axis([-100,100,0,1]);
end

figure(3);
s=(exp(-pi*t.^2)).*cos(2*pi*nu0.*t);
subplot(1,2,1);
plot(t,s);
axis([-4,4,-1,1])
[tf_s,nu]=TransFourier(s,t);
subplot(1,2,2);
plot(nu,real(tf_s));
axis([-10,10,0,0.6]);

for k=1:4
    g=1/((sigma(k)).*sqrt(2*pi)).*exp((-t.^2)/(2*(sigma(k)).^2));
    s=(exp(-pi*t.^2)).*cos(2*pi*nu0.*t);
    u=(conv(s,g,'same'));
    u=u./max(u);
    figure(4);subplot(4,1,k);
    plot(t,s,'k',t,u,'m');
    axis([-4,4,-1,1])
end

