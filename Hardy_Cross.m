%Funcion para calcular los caudales en cada tuberia por Hardy-Cross
%Q_guess: Caudal inicial supuesto para cada tuberia
%ri: Coeficiente que se debira de Darcy-Weisbach
%ni: Coeficiente que se deriba de Darcy-Weisbach
%loop: Indices que identifican cada 

function[Qi]=Hardy_Cross(Q_guess,ri,ni,sign1,sign2,TOLERANCE)
    disp('------Iniciando Funcion para Hardy-Cross-------');
    aux=1000;
    while aux>TOLERANCE
        delta1=sum(sign1.*ri.*Q_guess.^ni);
        delta2=sum(sign2.*ri.*Q_guess.^ni);
        aux=max(abs(delta1),abs(delta2));
        if aux>TOLERANCE
            denom1=sum(abs(sign1.*ni.*ri.*Q_guess));
            denom2=sum(abs(sign2.*ni.*ri.*Q_guess));
            Q_guess=Q_guess+(-sign1.*(delta1/denom1)-sign2.*(delta2/denom2));
            sign1(Q_guess<=0)=-sign1(Q_guess<=0);
            sign2(Q_guess<=0)=-sign2(Q_guess<=0);
            Q_guess=abs(Q_guess);
        end
    end
    Qi=Q_guess;
    disp('------Funcion para Hardy-Cross terminada-------');
end