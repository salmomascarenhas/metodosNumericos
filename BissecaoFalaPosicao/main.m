% Alunos: Salmo da Cruz Mascarenhas - 431447 ;
%         JOSE EDIBERTO DO NASCIMENTO JUNIOR - 433423           
clc
clear
menuEscolha = menu('Escolha um dos métodos abaixo:','Método da bisseção','Método da falsa posição');
a = 1;
b = 0;
erro = 0.1;
syms x;
switch(menuEscolha)
    case 1
        % Configuração de tela.
        mensagemFunc = {'Digite a função f(x) a ser utilizada no método (ex: 2*x^2 + 3*x + 4):'};
        mensagemA = {'Digite um valor para o ponto "a" do intervalo [a,b] (a<b):'};
        mensagemB = {'Digite um valor para o ponto "b" do intervalo [a,b] (b>a):'};
        mensagemErro = {'Digite um valor para o ERRO (ex: 0.001):'};
        tituloDoMenu = 'Bisseção';
        numLinhas = 1;
        def = {'',''};
        % Fim configuração de tela
        
        % Recebe a função em string, depois converte as variáveis encontradas no texto para simbólicas.
        func = sym(inputdlg(mensagemFunc,tituloDoMenu,numLinhas,def)); 
        
        erro = str2double(inputdlg(mensagemErro,tituloDoMenu,numLinhas,def));
        
        while ( a>b || isnan(a) || isnan(b) )
            %Input do usuário com GUI.
            a = str2double(inputdlg(mensagemA,tituloDoMenu,numLinhas,def)); 
            b = str2double(inputdlg(mensagemB,tituloDoMenu,numLinhas,def));
        end
        
        if ( (subs(func,x,a) * subs(func,x,b) < 0 ))
            raizAprox = metodo_bissecao(func,a,b,erro);
            msgbox(['Valor aproximado da raiz pelo método da bisseção é X = ' sprintf('%f',raizAprox) ' com e = ' sprintf('%f',erro)  ' .']);
        else
           msgbox('Não há raizes dessa função no intervalo [a,b]') 
        end
    
    case 2
        % Configuração de tela.
        mensagemFunc = {'Digite a função f(x) a ser utilizada no método (ex: 2*x^2 + 3*x + 4):'};
        mensagemA = {'Digite um valor para o ponto "a" do intervalo [a,b] (a<b):'};
        mensagemB = {'Digite um valor para o ponto "b" do intervalo [a,b] (b>a):'};
        mensagemErro = {'Digite um valor para o ERRO (ex: 0.001):'};
        tituloDoMenu = 'Falsa Posição';
        numLinhas = 1;
        def = {'',''};
        % Fim configuração de tela
        
        % Recebe a função em string, depois converte as variáveis encontradas no texto para simbólicas.
        func = sym(inputdlg(mensagemFunc,tituloDoMenu,numLinhas,def)); 
        
        erro = str2double(inputdlg(mensagemErro,tituloDoMenu,numLinhas,def));
        
        while ( a>b || isnan(a) || isnan(b) )
            %Input do usuário com GUI.
            a = str2double(inputdlg(mensagemA,tituloDoMenu,numLinhas,def)); 
            b = str2double(inputdlg(mensagemB,tituloDoMenu,numLinhas,def));
        end
        
        if ( (subs(func,x,a) * subs(func,x,b) < 0 ))
            raizAprox = fakepos(func,a,b,erro);
            msgbox(['Valor aproximado da raiz pelo método da falsa posição é X = ' sprintf('%f',raizAprox) ' com e = ' sprintf('%f',erro)  ' .']);
        else
           msgbox('Não há raizes dessa função no intervalo [a,b]') 
        end
end

