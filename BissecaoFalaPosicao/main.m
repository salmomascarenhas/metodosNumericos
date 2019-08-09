% Alunos: Salmo da Cruz Mascarenhas - 431447 ;
%         JOSE EDIBERTO DO NASCIMENTO JUNIOR - 433423           
clc
clear
menuEscolha = menu('Escolha um dos m�todos abaixo:','M�todo da bisse��o','M�todo da falsa posi��o');
a = 1;
b = 0;
erro = 0.1;
syms x;
switch(menuEscolha)
    case 1
        % Configura��o de tela.
        mensagemFunc = {'Digite a fun��o f(x) a ser utilizada no m�todo (ex: 2*x^2 + 3*x + 4):'};
        mensagemA = {'Digite um valor para o ponto "a" do intervalo [a,b] (a<b):'};
        mensagemB = {'Digite um valor para o ponto "b" do intervalo [a,b] (b>a):'};
        mensagemErro = {'Digite um valor para o ERRO (ex: 0.001):'};
        tituloDoMenu = 'Bisse��o';
        numLinhas = 1;
        def = {'',''};
        % Fim configura��o de tela
        
        % Recebe a fun��o em string, depois converte as vari�veis encontradas no texto para simb�licas.
        func = sym(inputdlg(mensagemFunc,tituloDoMenu,numLinhas,def)); 
        
        erro = str2double(inputdlg(mensagemErro,tituloDoMenu,numLinhas,def));
        
        while ( a>b || isnan(a) || isnan(b) )
            %Input do usu�rio com GUI.
            a = str2double(inputdlg(mensagemA,tituloDoMenu,numLinhas,def)); 
            b = str2double(inputdlg(mensagemB,tituloDoMenu,numLinhas,def));
        end
        
        if ( (subs(func,x,a) * subs(func,x,b) < 0 ))
            raizAprox = metodo_bissecao(func,a,b,erro);
            msgbox(['Valor aproximado da raiz pelo m�todo da bisse��o � X = ' sprintf('%f',raizAprox) ' com e = ' sprintf('%f',erro)  ' .']);
        else
           msgbox('N�o h� raizes dessa fun��o no intervalo [a,b]') 
        end
    
    case 2
        % Configura��o de tela.
        mensagemFunc = {'Digite a fun��o f(x) a ser utilizada no m�todo (ex: 2*x^2 + 3*x + 4):'};
        mensagemA = {'Digite um valor para o ponto "a" do intervalo [a,b] (a<b):'};
        mensagemB = {'Digite um valor para o ponto "b" do intervalo [a,b] (b>a):'};
        mensagemErro = {'Digite um valor para o ERRO (ex: 0.001):'};
        tituloDoMenu = 'Falsa Posi��o';
        numLinhas = 1;
        def = {'',''};
        % Fim configura��o de tela
        
        % Recebe a fun��o em string, depois converte as vari�veis encontradas no texto para simb�licas.
        func = sym(inputdlg(mensagemFunc,tituloDoMenu,numLinhas,def)); 
        
        erro = str2double(inputdlg(mensagemErro,tituloDoMenu,numLinhas,def));
        
        while ( a>b || isnan(a) || isnan(b) )
            %Input do usu�rio com GUI.
            a = str2double(inputdlg(mensagemA,tituloDoMenu,numLinhas,def)); 
            b = str2double(inputdlg(mensagemB,tituloDoMenu,numLinhas,def));
        end
        
        if ( (subs(func,x,a) * subs(func,x,b) < 0 ))
            raizAprox = fakepos(func,a,b,erro);
            msgbox(['Valor aproximado da raiz pelo m�todo da falsa posi��o � X = ' sprintf('%f',raizAprox) ' com e = ' sprintf('%f',erro)  ' .']);
        else
           msgbox('N�o h� raizes dessa fun��o no intervalo [a,b]') 
        end
end

