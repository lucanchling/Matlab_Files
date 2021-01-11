clear all;close all;
n=300;
m=n;
M=zeros(n,m);
r=100;
for p=1:n
    for q=1:m
        if (floor((p-n/2)^2)+floor((q-m/2)^2)) < r^2
            M(p,q)=1;
        end
    end
end

subplot(1,2,1);
imshow(M);

subplot(1,2,2)
TF_M_int = uint8(abs(fftshift(fft2(M))));
imshow(TF_M_int);

%%
clear all;close all;clc;
n=300;
m=n;
[x,y]=meshgrid(1:n,1:m);
M=cos(0.5*x+0.5*y);
subplot(1,2,1);
imshow(M);
subplot(1,2,2)
imshow(uint8(abs(fftshift(fft2(M)))));