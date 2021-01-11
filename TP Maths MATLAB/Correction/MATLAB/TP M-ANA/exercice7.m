clear all;close all;
r=300;
A=imread('barbara.jpg');
[a,b]=size(A);
figure(1);
subplot(2,2,1);
imagesc(A);
colormap gray;
subplot(2,2,2);
TF_A=log10(abs(fftshift(fft2(A))));
TF_A2=fft2(A);
imagesc(TF_A);

for p=1:a
    for q=1:b
        if floor((p-a/2)^2)+floor((q-a/2)^2)>r^2
            TF_A(p,q)=0;
            TF_A2(p,q)=0;
        end
    end
end
subplot(2,2,3);
imagesc(TF_A);
subplot(2,2,4);
TF_A2=log10(abs(fftshift(ifft2(TF_A2))));
imagesc(TF_A2);