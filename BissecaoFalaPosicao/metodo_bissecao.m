function [ raizAproximada ] = metodo_bissecao( func,a,b,erro )
%metodo_bissecao 
%   input(s): função,a,b,Erro.
%   output: raiz aproximada.
%   descrição: Calcula a raiz aproximada da função de entrada no intervalo [a,b] pelo método da bisseção.
% Alunos: Salmo da Cruz Mascarenhas - 431447 ;
%         JOSE EDIBERTO DO NASCIMENTO JUNIOR - 433423      
syms x;
raizAproximada = (a+b)/2;

while ( abs(subs(func,x,raizAproximada)) > erro  ) 
    if (subs(func,x,a) * subs(func,x,raizAproximada) < 0)
       b = raizAproximada;
    end
    
    if (subs(func,x,b) * subs(func,x,raizAproximada) < 0)
        a = raizAproximada;
    end
    raizAproximada = (a+b)/2;
end

end

