clear variables;
close all;
figure(1);hold on;
a=2;b=-5;c=1;
x2=-3:0.1:3;
y2=-2.5:0.1:4;
z2=-8:1:8;
[X2,Y2]=meshgrid(x2,y2);
Z2=-(a*X2+b*Y2)/c;
C(:,:,1)=zeros(size(Z2));     % red
C(:,:,2)=0.8*ones(size(Z2));  % green
C(:,:,3)=0.8*ones(size(Z2));  % blue
mesh(X2,Y2,Z2,C);

%question2
n=10;
X=randi([-2 2],1,n); %abscisses entre -2 et 2
Y=randi([-2 2],1,n); %ordonn�es entre -2 et 2
Z=randi([-8 6],1,n); %hauteurs entre -8 et 6
figure (1);hold on;
plot3(X,Y,Z,'xb');
axis('equal');
grid on; view(-60,60);

%question3
N=[a;b;c];%vecteur colonne normal au plan
N=N./norm(N);%normalisation
P=eye(3)-N*N';%matrice de projection
U=[X;Y;Z];%matrice 3xn contenant les points � projeter
V=zeros(3,n);%init de la matrice 3xn contenant les projections
for k=1:n
    V(:,k)=P*U(:,k);
end
plot3(V(1,:),V(2,:),V(3,:),'.r');%affichage des points de projection
%on relie les points initiaux et les points projet�s

plot3([U(1,:);V(1,:)],[U(2,:);V(2,:)],[U(3,:);V(3,:)],'k-');

%question4
delta=0.1;
dV=-delta/2+delta*rand(3,n);%perturbation (matrice 3%n)
W=V+dV;
plot3(W(1,:),W(2,:),W(3,:),'.m');

%calcul du plan passant au plus pr�s des points perturb�s
%r�soudre Au=v au sens des moindres carr�s
A=[W(:,1),W(:,2)];
v=[a;b;c];
u=inv(A'*A)*A'*v;

%�quation du plan
Z2=-(u(1)*X2+u(2)*Y2)/c;;
C(:,:,1)=zeros(size(Z2));     % red
C(:,:,2)=0.8*ones(size(Z2));  % green
C(:,:,3)=0.8*ones(size(Z2));  % blue
mesh(X2,Y2,Z2,C);

%angle entre les deux plans
N2=[u(1);u(2);c]; %vecteur normal
N2=N2./norm(N2);%normalisation
theta=acos(N.*N2);