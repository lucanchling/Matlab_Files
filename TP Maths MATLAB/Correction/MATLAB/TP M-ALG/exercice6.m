myFile='einstein.jpg';
A=imread(myFile); %conversion du fichier image en matrice
figure(1);
imshow(A); %affiche l'image
A=A(:,:,1); %récupère la première matrice
A=double(A); %convertit les entiers en réels
[U,S,V]=svd(A); %SVD de A
[m,n]=size(A);
k_array=[5,40,100,200];
a=zeros(590);
Sa=zeros(590);
for l=1:590
    a(l)=l;
    Sa(l)=S(l,l);
end
%plot(a,Sa);

tau=zeros(1,length(k_array));
for j= 1:length(k_array)
    k=k_array(j);
    Ak=zeros(m,n); %init
    for i=1:k
        Ak= Ak + S(i,i)*U(:,i)*V(:,i)';
    end
    Ak=uint8(Ak); %convertit les réels en entiers
    subplot (2,2,j);
    imshow(Ak);
    tau(j)=1-k*(m+n+1)/m*n;
    
end  
figure(2)
plot(k_array,tau)   