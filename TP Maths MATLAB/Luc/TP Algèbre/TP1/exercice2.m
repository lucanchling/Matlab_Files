clear variables;
close all;
clc;

%% Question 1
x=-5:1:5;
y=x;
figure(1);
a=4;b=9;c=0;d=0;e=0;f=-36;
h1=ezplot(@(x,y)myfun(x,y,a,b,c,d,e,f));
set(h1,'color','k');

%% Question 2
clear variables;
close all;
clc;
asteroide=2;
switch asteroide
    case 2
        X=[-2.5815,-2.0762,-1.3565,-0.5279,1.0265,2.7484,3.5944,4.6929];
        Y=[0.0847,0.3172,0.6058,0.959,1.2828,0.8756,0.5226,0.1792]
    case 1
        X=[-1.25,-1.1,-0.932,-0.746,-0.542,-0.32,-0.074,0.194,0.49,0.786];
        Y=[3.178,3.046,2.93,2.834,2.754,2.696,2.658,2.642,2.65,2.698];
end

A = zeros(size(X,2),5);
b=zeros(size(X,2),1);
for li = 1:size(X,2)
    A(li,1)=-X(li).^2;A(li,2)=-X(li)*Y(li);A(li,3)=-X(li);A(li,4)=-Y(li);A(li,5)=-1;
    b(li)=Y(li)^2;
end

z=pinv(A'*A)*A'*b;
a=z(1);b=1;c=z(2);d=z(3);e=z(4);f=z(5);
figure(2)
hold on;
plot(X,Y,'xr')
h2=ezplot(@(x,y)myfun(x,y,a,b,c,d,e,f));
set(h2,'color','k');

legend('observatiosn','trajectoire théorique')

