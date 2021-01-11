clear variables;
close all;
clc;


A=[[1,-1,2,5];[1,1,4,5];[2,0,6,10]];

[U,S,V] = svd(A);
k = rank(A);
IM_A=U(:,[1:k])
KER_A=V([k+1,k+2],:);

