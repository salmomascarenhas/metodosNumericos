function [x,Erro] = gaussSeidel(A,B,e)
%gaussSeidel
%   Salmo Mascarenhas e José Ediberto
% input 'A','B' e 'e' 'A' é a matriz dos coeficientes, 'B' é a matriz dos termos
% indepedentes e 'e' é o erro.
% Ax = B

[m,n] = size(A);
 erro = 0.01;
 
 x = [0 0 0]; %Valor de X inicial
 xx(1,:) = x; %histórico
 k=2;
 while true
     for i = 1 : n
         s = 0;
         for j = 1 : n
             if j ~= i
                 s = s + A(i,j) * x(j);
             end
         end
         x(i) = (1/A(i,i)) * (B(i) - s);
     end
     xx(k,:) = x; kk = k;
     Erro = abs(max(xx(k,:)-xx(k-1,:))); 
     if Erro < erro
         break; 
     end 
     k = k+1;
 end

end

