clear variables;
close all;
clc;

%% Histogramme :
clear variables;
close all;
clc;
N=10000;
Y=LancerDeSixFaces(N);
[h,xout] = hist(Y,1:6);
bar(xout,h)

%% Jeu A
clear variables;
close all;
clc;
N=10000;
cpt=0;
for i = 1:N
    A=LancerDeSixFaces(4);
    [ha,xout] = hist(A,1:6);
    if ha(6) >= 1
        cpt=cpt+1;
    end
end

probaA_emp = cpt/N;
probaA_th = 1-(5/6)^4;


%% Jeu B
clear variables;
close all;
clc;
N=10000;
cpt=0;
for i = 1:N
    B1=LancerDeSixFaces(24);
    B2=LancerDeSixFaces(24);
    for j = 1:length(B1)
        if B1(j) == 6 && B2(j) == 6
            cpt=cpt+1;
            break
        end
    end
end

probaB_emp = cpt/N;
probaB_th = 1-(35/36)^24;