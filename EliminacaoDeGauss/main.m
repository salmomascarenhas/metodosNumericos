%ALUNOS: Salmo da Cruz Mascarenhas 431447         
%        JOSE EDIBERTO DO NASCIMENTO JUNIOR 433423
clc;
clear;
syms x y z w;    
eqns = [];
vars = [x y z w];

eqin = 0;

while 1
    %Exemplo de input: x + 2*y == 17
    %                  x - 2*y == -11
    eqin = input('Digite uma equação ou 0 para parar (use == ao inves de =): ');
    if(eqin == 0)
        break;
    end
    eqns = [eqns;eqin];
end

if ~isempty(eqns)
    [A,B] = equationsToMatrix(eqns,vars);
    disp(A);
    disp(B);

    X = gauss(A,B);
    disp(X);
    
end

disp('Fim do programa!');