clear variables;
close all;

% motif de base
F0=2*[-0.5,-0.5,-5,-3,-10,-8,-9,-6,-6,-2,-5,-2,0,2,5,2,6,6,9,8,10,3,5,0.5,0.5;  % abscisses
    0,10,9,12,17,17,20,20,22,17,27,25,30,25,27,17,22,20,20,17,17,12,9,10,0]; % ordonnées  
[m,n]=size(F0);

% dimension du cadre d'affichage
L=200; 
cadre=[-L,L,-L,L];

% affichage du motif de base
color=[0,0,0];
fill(F0(1,:),F0(2,:),color);
axis('equal');
axis(cadre);
hold on;


question=2;
switch question
    case 1
        u=[-80;60]
        F1=F0+u
        color=[1,0,0];
        fill(F1(1,:),F1(2,:),color);
        axis('equal');
        axis(cadre);
        hold on;
        N=[sqrt(2)/2;sqrt(2)/2]
        S=2*N*N'-eye(2);
        F2=S*F1
        color=[0,1,0];
        fill(F2(1,:),F2(2,:),color);
        axis('equal');
        axis(cadre);
        hold on;
        k=-200:200;
        plot(k,k,'g --')
        theta=-2*pi/3
        R=[cos(theta),-sin(theta);sin(theta),cos(theta)];
        F3=R*F2;
        color=[0,0,1];
        fill(F3(1,:),F3(2,:),color);
        axis('equal');
        axis(cadre);
        hold on;
        theta_array=0:0.1:2*pi;
        G2=mean(F2');
        r=norm(G2);
       
        
    case 2
        
        nb_feuilles=30;
        u=[-80;60];
        F1=F0+u;
        color=[1,0,0];
        fill(F1(1,:),F1(2,:),color);
        for k=1:nb_feuilles
            N=rand(2,1);
            N=N/norm(N); %normalisé
            S=2*N*N'-eye(2);
            F=S*F1;
            color=rand(1,3);
            fill(F(1,:),F(2,:),color);
            axis('equal');
            axis(cadre);
            hold on;
        end   
        
       
    case 3
    
        
end