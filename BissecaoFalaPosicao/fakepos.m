% f = função, a = inicio do intervalo, b = fim intervalo, e = erro
% Alunos: Salmo da Cruz Mascarenhas - 431447 ;
%         JOSE EDIBERTO DO NASCIMENTO JUNIOR - 433423  
function root  = fakepos(f,a,b,e)
    k = 0;
    x = a;
    fa = eval(f);
    x = b;
    fb = eval(f);
    x = (a * fb - b * fa)/(fb - fa);
    fx = eval(f);
    c = b - a;
    fprintf('\n   k       a            b            x            fx          erro\n');
    fprintf(' %3i   %10.8f   %10.8f   %10.8f   %10.8f   %10.8f\n', k, a, b, x, fx, c);
    while (abs(fx) > e)
      if fa * fx < 0 
         b = x;
       else a = x;
       end;
       k = k + 1;
       x = a;
       fa = eval(f);
       x = b;
       fb = eval (f);
       x = (a * fb - b * fa)/(fb - fa);
       fx = eval(f);
       c = b - a;
    fprintf(' %3i   %10.8f   %10.8f   %10.8f   %10.8f   %10.8f\n', k, a, b, x, fx, c);
    end
    root = x;
end
