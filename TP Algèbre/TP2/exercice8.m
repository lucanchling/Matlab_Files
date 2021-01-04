clear variables;close all;clc;

% motif de base
F0=2*[-0.5,-0.5,-5,-3,-10,-8,-9,-6,-6,-2,-5,-2,0,2,5,2,6,6,9,8,10,3,5,0.5,0.5;  % abscisses
    0,10,9,12,17,17,20,20,22,17,27,25,30,25,27,17,22,20,20,17,17,12,9,10,0]; % ordonnées  
[m,n]=size(F0);
% dimension du cadre d'affichage
L=200; 
cadre=[-L,L,-L,L];

% affichage du motif de base
color=[0,0,0];fill(F0(1,:),F0(2,:),color);axis('equal');axis(cadre);hold on;

question = 2;
switch question
    case 1
        hold on;
        u = [-80;60];
        F1 = F0 + u;
        color=[.9,0,0];fill(F1(1,:),F1(2,:),color);axis('equal');axis(cadre);
        N  = [1/sqrt(2);1/sqrt(2)];
        k=-200:200;
        plot(k,k,'--g')
        S = 2*N*N' - eye(2);
        F2 = S*F1;
        color=[0,.5,0];fill(F2(1,:),F2(2,:),color);axis('equal');axis(cadre);
        theta = -2*pi/3;
        R = [cos(theta),-sin(theta);sin(theta),cos(theta)];
        F3 = R * F2;
        color=[0,0,0.8];fill(F3(1,:),F3(2,:),color);axis('equal');axis(cadre);
        theta_array = 0:.1:2*pi;
        G2 = mean(F2');
        r = norm(G2);
        k2 = -r:r;
        plot(k2,sqrt(r^2-k2.^2),'--b')
    case 2
        nb_feuille = 30;
        u = [-80;60];
        F1 = F0 + u;
        color=[rand(1,3)];fill(F1(1,:),F1(2,:),color);axis('equal');axis(cadre);
        for k =1:nb_feuille
            hold on;
            N  = [rand(2,1)];
            N = N/norm(N)
            k=-200:200;
            S = 2*N*N' - eye(2);
            F2 = S*F1;
            color=[rand(1,3)];fill(F2(1,:),F2(2,:),color);axis('equal');axis(cadre);
        end
    case 3
        nb_feuille = 300;
end
        