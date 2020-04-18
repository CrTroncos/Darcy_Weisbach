%%Tarea1
clearvars, clc, close all

%% Partimos el programa
disp('-----El programa para la Tarea1 a iniciado-----');
%% Graficamos el sistema de tuberias
x = [0, 2, 4, 3, 1, 0, 4];
y = [2, 3, 2, 1, 1, 2, 2];
label= {'A','B','C','D','E','A','C'};

hold on
plot(x,y);
scatter(x,y,'filled');
text(x,y,label,'linewidth',2);
axis off
set(gca,'xscale','linear','yscale','linear','box','on','xlim',[-1 5],'ylim',[0 4])

%% Pedimos los inputs al sistema
disp('----------Solicitud de inputs tuberias---------');
L1=input('Ingrese la longitud de la tuberia AB[m]:');
D1=input('Ingrese el diametro interno de la tuberia AB[mm]:');
L2=input('Ingrese la longitud de la tuberia BC[m]:');
D2=input('Ingrese el diametro interno de la tuberia BC[mm]:');
L3=input('Ingrese la longitud de la tuberia CD[m]:');
D3=input('Ingrese el diametro interno de la tuberia CD[mm]:');
L4=input('Ingrese la longitud de la tuberia DE[m]:');
D4=input('Ingrese el diametro interno de la tuberia DE[mm]:');
L5=input('Ingrese la longitud de la tuberia EA[m]:');
D5=input('Ingrese el diametro interno de la tuberia EA[mm]:');
L6=input('Ingrese la longitud de la tuberia AC[m]:');
D6=input('Ingrese el diametro interno de la tuberia AC[mm]:');
disp('--------------------Gracias!-------------------');
disp('----------Solicitud de inputs nodos------------');
Q1=input('Ingrese el caudal esperado en el nodo A[lt/s]:');
Q2=input('Ingrese el caudal esperado en el nodo B[lt/s]:');
Q3=input('Ingrese el caudal esperado en el nodo C[lt/s]:');
Q4=input('Ingrese el caudal esperado en el nodo D[lt/s]:');
Q5=input('Ingrese el caudal esperado en el nodo E[lt/s]:');
disp('--------------------Gracias!-------------------');
TOLERANCE=input('Cual será la tolerancia del modelo: ');
eps=input('Ingrese el indice de rugosidad del material: ');
v_max=input('Ingrese la velocidad máxima permitida en las tuberias: ');
disp('----------Ahora haremos los calculos!----------');

%% Rellenamos las matrices
Q=[Q1,Q2,Q3,Q4,Q5];
%Q=[25,5,8,16,4];
Q=Q*0.001;
D=[D1,D2,D3,D4,D5,D6];
%D=[50,50,100,60,45,71];
D=D*0.001;
L=[L1,L2,L3,L4,L5,L6];
%L=[100,100,70,70,70,100];
TOLERANCE=0.005;


%% Ingresaremos a la función Hardy-Cross
Q_guess=[3,2,6,4,20,16];
Q_guess=Q_guess*0.001;
sign1=[1,-1,-1,0,0,0];
sign2=[0,0,1,-1,-1,-1];
% Calculamos los coeficientes de perdida
f=0.005;
[~,ri,ni]=Darcy_Weisbach(Q_guess,f,D,L);

[Qi]=Hardy_Cross(Q_guess,ri,ni,sign1,sign2,TOLERANCE);

quiver(x(1),y(1),x(2)-x(1),y(2)-y(1),0.5,'color',[0 0.4470 0.7410],'linewidth',2);
quiver(x(2),y(2),x(3)-x(2),y(3)-y(2),0.5,'color',[0 0.4470 0.7410],'linewidth',2);
quiver(x(1),y(1),x(3)-x(1),y(3)-y(1),0.5,'color',[0 0.4470 0.7410],'linewidth',2);
quiver(x(3),y(3),x(4)-x(3),y(4)-y(3),0.5,'color',[0 0.4470 0.7410],'linewidth',2);
quiver(x(1),y(1),x(5)-x(1),y(5)-y(1),0.5,'color',[0 0.4470 0.7410],'linewidth',2);
quiver(x(5),y(5),x(4)-x(5),y(4)-y(5),0.5,'color',[0 0.4470 0.7410],'linewidth',2);


%% Sección para la 3era pregunta de la tarea
[v,Re,flujo]=N_de_Reynolds(Qi,D);

%% Sección para la 4ta pregunta de la tarea
eps=0.0015;                             %Indice de rugosidad del PVC en [mm]
eps=eps*0.001;                          %Transformamos a [m]
[f]=Darcy_factor(eps,D,Re);
[hr,ri,ni]=Darcy_Weisbach(Q,f,D,L);
h1_tot=sum(hr.*sign1);
h2_tot=sum(hr.*sign2);
disp('     -----Perdidas totales del ciclo 1-----     ');
disp(h1_tot);
disp('     -----Perdidas totales del ciclo 2-----     ');
disp(h2_tot);

disp('-----El programa para la Tarea1 a terminado-----');