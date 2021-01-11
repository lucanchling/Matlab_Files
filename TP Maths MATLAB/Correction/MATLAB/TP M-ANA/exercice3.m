clear all;close all;hold on;
tmin=-5;tmax=5;pas=0.1;
t=[tmin:pas:tmax];n=length(t);
f0=(1+t.^2).^(-1);
f=f0+0.05*randn(1,n);
figure(1);
plot(t,f);
i=0;
figure(2);
for a=[0.1,4,7,9]
    i=i+1;
    c = conv(f,porte(t/a),'same');
    subplot(2,2,i);hold on;
    plot(t,f0,'k');
    plot(t,c,'r');
end


