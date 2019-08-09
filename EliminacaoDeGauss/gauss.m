function [x] = gauss(A,B)
% Resolve o sistema de equações lineares pela eliminação de gauss
% (pivoteamento parcial).
%
%ALUNOS: Salmo da Cruz Mascarenhas 431447         
%        JOSE EDIBERTO DO NASCIMENTO JUNIOR 433423

    [m,n]=size(A);
    A(:, n+1) = B;
    [m,n]=size(A);
    for j=1:m-1
        for z=2:m
            if A(j,j)==0
                t=A(1,:);A(1,:)=A(z,:);
                A(z,:)=t;
            end
        end
        for i=j+1:m
            A(i,:)=A(i,:)-A(j,:)*(A(i,j)/A(j,j));
        end
    end

    for j=m:-1:2
        for i=j-1:-1:1
            A(i,:)=A(i,:)-A(j,:)*(A(i,j)/A(j,j));
        end
    end

    for s=1:m
        A(s,:)=A(s,:)/A(s,s);
        x(s)=A(s,n);
    end

end
