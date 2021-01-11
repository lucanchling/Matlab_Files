clear all;close all;
n=300;
m=n;
r=100;

%rectangle
M1=zeros(n,m);
figure(1);
for p=floor(0.25*n):floor(0.75*n)
    for q=floor(0.35*m):floor(0.65*m)
        M1(p,q)=1;
    end
end
subplot(1,2,1);
imshow(M1);
TF_M_real=abs(fftshift(fft2(M1)));
TF_M_int=uint8(TF_M_real);
subplot(1,2,2);
imshow(TF_M_int);


%cercle
M2=zeros(n,m);
figure(2);
for p=1:n
    for q=1:m
        if floor((p-n/2)^2)+floor((q-n/2)^2)<=r^2
            M2(p,q)=1;
        end
    end
end
subplot(1,2,1);
imshow(M2);
TF_M_real=abs(fftshift(fft2(M2)));
TF_M_int=uint8(TF_M_real);
subplot(1,2,2);
imshow(TF_M_int);

clear all;close all;
n=[300,600,900];
m=n;
for k=1:3
    [x,y]=meshgrid(1:n(k),1:m(k));
    M=cos(0.5*x+0.5*y);
    subplot(2,3,k);
    imshow(M);
end
for k=4:6
    [x,y]=meshgrid(1:n(k-3),1:m(k-3));
    M=cos(0.5*x+0.5*y);
    TF_M_real=abs(fftshift(fft2(M)));
    TF_M_int=uint8(TF_M_real);
    subplot(2,3,k);
    imshow(TF_M_int);
end




