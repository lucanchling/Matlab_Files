clear variables;
close all;
clc;
hold on;
tmin=-5;tmax=5;pas=0.1;
t=[tmin:pas:tmax];n=length(t);
f0=(1+t.^2).^(-1);
f=f0+0.05*randn(1,n);


figure()
for a=1:4
    subplot(2,2,a)
    hold on;
    plot(t,f)
    plot(t,conv(f,porte(t./a),'same'))
    legend('Non Lissé','Lissé')
end

