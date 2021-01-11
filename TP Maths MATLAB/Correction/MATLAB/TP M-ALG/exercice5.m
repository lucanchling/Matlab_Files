A=[3,-1;1,3;1,1];
theta=0:0.1:2*pi;
x=cos(theta);
y=sin(theta);
[U,S,V]=svd(A);
S1=S(1,1);
S2=S(2,2);
figure(1);
subplot(121);hold on;
for k=1:length(theta)
    plot(x(k),y(k),'marker','.','color',[k/length(theta),0,k/length(theta)]);
end
title('cercle unité');
xlabel('x');
ylabel('y');
axis('equal');
axis([-1.5,1.5,-1.5,1.5]);
plot([0,V(1,1)],[0;V(1,2)],'r')
plot([0,V(2,1)],[0;V(2,2)],'r')
subplot(122);hold on;
Y=zeros(3,length(theta));
for k=1:length(theta)
    X=[x(k);y(k)];
    Y(:,k)=A*X;
    plot3(Y(1,k),Y(2,k),Y(3,k),'marker','.','color',[k/length(theta),0,k/length(theta)]);
end




