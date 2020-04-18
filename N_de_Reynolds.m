%Funcion para el calculo de velocidades en funcion del caudal
%Qi: Caudal en cada sección de tuberia
%D: Diametro de cada tuberia

function[v,Re,flujo]=N_de_Reynolds(Qi,D)
    disp('-Iniciando Funcion para Obtener N° de Reynolds-')
    s=D/2*pi()^2;
    v=Qi.*s;
    Re=(v.*D)./(1.306*(10^-6));
    flujo(Re<2000)=0;
    flujo(Re>=2000 & Re<=4000)=0.5;
    flujo(Re>4000)=1;
    disp('    -----------N° de Reynolds--------------    ');
    disp(Re);
    disp('    ----------------Flujo------------------    ');
    disp(flujo);
    disp('   0-> Laminar, 0.5-> Difuso, 1.0->Turbulento  ');
    disp('-Funcion para Obtener N° de Reynolds terminada-');
end