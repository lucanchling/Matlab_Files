clear all;close all;
A=imread('barbara.jpg');
[a,b]=size(A);
figure(1);
subplot(2,2,1);
imagesc(A);
colormap gray;

TF_A=fft2(A);
TF_A=fftshift(TF_A);
TF_A_module=abs(TF_A);
TF_A2=log10(TF_A_module);
subplot(2,2,2);
imagesc(TF_A2);


[n,m]=size(TF_A2);
C=zeros(n,m);
E=zeros(n,m);
min(min(TF_A))
max(max(TF_A))
% for p=1:n
%  for q=1:m
%      if floor((p-n/2)^2)+floor((q-m/2)^2)<=floor((n/12)^2)
%         C(p,q)=TF_A2(p,q);
%      else
%          if TF_A2(p,q)>max(max(TF_A2))*0.6
%             E(p,q)=0;
%          else
%             E(p,q)=TF_A2(p,q);
%          end
%      end
%  end
% end
% Im=C+E;
% subplot(2,2,3);
% imagesc(Im);
% Imag=ifft2(Im);
% subplot(2,2,4);
% imagesc(Imag);


J=TF_A;
dn=0.1*n;
dm=0.1*m;
i=floor(n/2+[-dn:dn]);
j=floor(m/2+[-dm:dm]);
C=J(i,j);
seuil=10000;
ind=(abs(J)>seuil);
J(ind)=0;

J(i,j)=C;
subplot(2,2,4)
imagesc(log10(abs(J)));
Imag=abs(ifft2(J));
subplot(2,2,3);
imagesc(Imag)