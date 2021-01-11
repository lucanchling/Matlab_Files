clear variables;
close all;
clc;
figure(1);
hold on;
a=2;b=-5;c=1;
x2=-3:0.1:3;
y2=-2.5:0.1:4;
z2=-8:1:8;
[X2,Y2]=meshgrid(x2,y2);
Z2=-(a*X2+b*Y2)/c;
C(:,:,1)=zeros(size(Z2));
C(:,:,2)=0.8*ones(size(Z2));
C(:,:,3)=0.8*ones(size(Z2));
mesh(X2,Y2,Z2,C);

n=10;
X = -2+4*rand(1,n);
Y = -2+4*rand(1,n);
Z = -8+14*rand(1,n);

figure(1)
hold on;
plot3(X,Y,Z,'xb')
axis('equal')
grid on ; view(-60,60);

N = [a,b,c]';
N = N./norm(N);

P = eye(3) - N * N';

U = [X;Y;Z];
V = zeros(3,n);

for k = 1:n
    V(:,k) = P * U(:,k); 
end

plot3([U(1,:);V(1,:)],[U(2,:);V(2,:)],[U(3,:);V(3,:)])


delta = 0.1;

dV = -delta/2 + delta*rand(3,n);

W = V + dV;

% Résoudre Au = v :
A=[W(:,1),W(:,2)];
v=[a,b,c]';
u = (A'*A)^-1*A'*v;

Z2=-(u(1)*X2+u(2)*Y2)/c;
C(:,:,1)=zeros(size(Z2));
C(:,:,2)=0.8*ones(size(Z2));
C(:,:,3)=0.8*ones(size(Z2));
mesh(X2,Y2,Z2,C);

N2 = [u(1),u(2),c]';
N2 = N2./norm(N);

theta = acos((N.*N2));