%% Metodo Gauss-Seidel
%ALUNOS: Salmo da Cruz Mascarenhas 431447         
%        JOSE EDIBERTO DO NASCIMENTO JUNIOR 433423
clc ;
% Exemplo de input matriz A = [10,2,1;1,5,1;2,3,10] matriz B =  [7 ; -8 ; 6];;
clear all;
n = 0; m = 1;

while n ~= m

A = input('Digite a matriz A (use [ a2, a1, (...), an entao use ;(para iniciar uma nova linha) n1 ,n2, (...), nn e ] para finalizar: \n');
[m,n] = size(A);
B = input('Digite a matriz B (use [ b1, b2, (...), bn entao use ;(para iniciar uma nova linha) n1 ,n2, (...), nn e ] para finalizar: \n');
e = input('Digite o erro: \n');

   if n~=m
       disp('Matriz nao eh quadrada, digite uma matriz quadrada.');
   end

end

[x,Erro] = gaussSeidel(A,B,e);
 disp(['Vetor das variaveis [' num2str(x) '], com erro de: ' num2str(Erro)]);