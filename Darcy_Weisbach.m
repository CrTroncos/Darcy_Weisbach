%Funcion para calcular las perdidas en una tuberia circular
%f = Coeficiente de fricción
%Q = Matriz con los caudales de cada tuberia [m3/s]
%D = Matriz con los diametros de cada tuberia [mm]
%L = Matriz con los largos de cada tuberia [m]

function[hr,ri,ni]=Darcy_Weisbach(Q,f,D,L)
    disp('-----Iniciando Funcion para Darcy-Weisbach-----');
    g   =   9.80665;        %La ecuación trabaja con g en m/s2
    ri  = L.*(8*f)./(g*pi()^2*D.^5);
    ni  = 2;
    hr  = ri.*(Q.^ni);
    disp('  -----------ri obtenido-----------  ');
    disp(ri);
    disp('-----Funcion para Darcy-Weisbach terminada-----');
end