clear variavles; close all; clc;

A=[3,-1;1,3;1,1];[U,S,V]=svd(A);

theta=0:0.1:2*pi;
x=cos(theta);
y=sin(theta);
subplot(121);hold on;
for k=1:length(theta)
 plot(x(k),y(k),'marker','.','color',[k/length(theta),0,k/length(theta)]);
end
title('cercle unité');
xlabel('x');
ylabel('y');
axis('equal');
axis([-1.5,1.5,-1.5,1.5]);
plot([V(1,1),0,V(2,1)],[V(1,2),0,V(2,2)],'b')
subplot(122)
hold on;
for k=1:length(theta)
    plot(x(k),y(k),'marker','.','color',[k/length(theta),0,k/length(theta)]);
end
title('cercle unité');
xlabel('x');
ylabel('y');
axis('equal');
axis([-1.5,1.5,-1.5,1.5]);
plot([U(1,1),0,U(1,2)],[U(2,1),0,U(2,2)],'b')
plot(S(1,1)*U(1,:),S(2,2)*U(2,:),'og')