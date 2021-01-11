%% question 1
x=-5:1:5;
y=x;figure(1);
a=7;b=3;c=2;d=2;e=10;f=6;
h=ezplot(@(x,y)myfun(x,y,a,b,c,d,e,f));
set(h,'color','k');
clf;

%% question 2
asteroide=1;
switch asteroide
    case 1,
        
        x=[-1.2500,-1.1000,-0.9320,-0.7460,-0.5420,-0.3200,-0.0740,0.1940,0.4900,0.7860];
        y=[3.1780,3.0460,2.9300,2.8340,2.7540,2.6960,2.6580,2.6420,2.6540,2.6980];
    case 2,
        x=[-2.5815,-2.0762,-1.3565,-0.5279,1.0265,2.7484,3.5944,4.6929]
        y=[0.0847,0.3172,0.6058,0.9590,1.2828,0.8756,0.5226,0.1792]
end 
Z=([a,b,c,d,e,f])';
A=[];
B=(y.^2)';
[L,C]=size((x)');
for i =1:L
    A=[A;-x(i)^2,-x(i)*y(i),-x(i),-y(i),-1];
end

Ainv=pinv(A);
Z=Ainv*B
hold on;
h=ezplot(@(x,y)myfun(x,y,Z(1),1,Z(2),Z(3),Z(4),Z(5)));
set(h,'color','k');
plot(x,y,'*r')
N=norm(A*Z-B)

