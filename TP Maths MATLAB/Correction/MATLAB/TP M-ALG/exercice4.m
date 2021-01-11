A=[1,-1,2,5;1,1,4,5;2,0,6,10];
[U,S,V]=svd(A)
r=rank(A)
[Lu,Cu]=size(U);
[Lv,Cv]=size(V);
U
for i=r+1:Cu
    U(:,r+1)=[];
end
IM_A=U
V
for j=1:r
    V(1,:)=[];
end
KER_A=V



