clear variables;
close all;
clc;

myFile = 'einstein.jpg';

A = imread(myFile);

A = A(:,:,1);

A = double(A);

[U,S,V] = svd(A);

[m,n] = size(A);

figure()
j=0;
for k = [5,40,100,200]
    tau = zeros(1,k);
    j=j+1;
    Ak = zeros(m,n);
    for i = 1:k
        Ak = Ak + S(i,i)*U(:,i)*(V(:,i))';
    end
    subplot(2,2,j)
    Ak = uint8(Ak);
    imshow(Ak)
    
end

figure()
k=[5,40,100,200];
plot(k,1-(k*(m+n+1)/(m*n)))