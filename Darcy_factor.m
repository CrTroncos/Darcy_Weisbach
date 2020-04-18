%Función para encontrar el factor de Darcy
%eps: Indice de rugosidad de la tuberia
%D: Diametro de la tuberia
%Re: N° de Reynolds

function[f]=Darcy_factor(eps,D,Re)
    disp('--Iniciando Funcion para Obtener Darcy Factor--')
    f=1./(-2.*log10((eps*ones(1,6)./(3.7*D))+(5.72./(Re.^0.9)))).^2;
    disp('    ------------Darcy Factor---------------    ');
    disp(f)
    disp('--Funcion para Obtener Darcy Factor terminada--')
end