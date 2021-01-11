D=1;
N=2^12;
dt=2*D/N;
t=-D:dt:D-dt;
T=2.^[-5,-6];
nu0=5;

for k=1:2
    %peigne
    [p]=peigne(T(k),t);
    figure(1);subplot(2,2,k);
    plot(t,p);
end
    
for k=3:4    
    %TF
    [p]=peigne(T(k-2),t);
    [tf_p,f]=TransFourier(p,t);
    figure(1); subplot(2,2,k);
    plot(f,real(tf_p));
end


s=(exp(-pi*t.^2)).*cos(2*pi*nu0.*t);
z=s.*peigne(T(2),t);
subplot(3,1,1);
plot(t,s,'k',t,z,'.r');
axis([-1,1,-1,1]);
[tf_s,f1]=TransFourier(s,t);
subplot(3,1,2);
plot(f1,tf_s,'k');
axis([-50,50,0,1]);
[tf_z,f2]=TransFourier(z,t);
tf_z=tf_z./max(tf_z);
subplot(3,1,3);
plot(f2,tf_z,'r');
axis([-500,500,0,1]);




