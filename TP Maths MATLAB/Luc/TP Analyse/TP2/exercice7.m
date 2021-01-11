clear all;close all;clc;
A=imread('barbara.jpg');
[a,b]=size(A);
figure(1);
subplot(2,2,1);
imagesc(A);
colormap gray;
subplot(2,2,2)
TF_A=fft2(A);
imagesc(log10(abs(fftshift(TF_A))))

J=TF_A;
da=;
db=;
i=floor(a/2+[:];
j=floor(b/2+[:];
B=J(i,j);

% Suppression des pics
seuil=;
ind=();
J(ind)=0;

% ON réintroduit le centre
J(i,j)=;
subplot(2,2,4);
imagesc(log10(abs(J)));




% for p=1:a
%     for q=1:b
%         if (floor((p-a/2)^2)+floor((q-b/2)^2)) < 300^2
%             TF_A(p,q)=0;
%         end
%     end
% end
% subplot(2,2,3)
% imagesc(log10(abs(fftshift(TF_A))))
% 
% subplot(2,2,4)
% imagesc(abs(ifft2(TF_A)))