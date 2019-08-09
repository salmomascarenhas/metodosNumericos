clc
clear
escolha = menu('Escolha uma das opções abaixo:','Decimal -> Binário (Inteiro/Fracionário)','Inteiro Binário  -> Inteiro Decimal ', 'Fracionário Binário  -> Fracionário Decimal' );

switch(escolha)
    case 1
        %Configuração de tela.
        mensagem = {'Digite o número decimal a ser convertido.'};
        titulo = 'Conversão';
        numLinhas = 1;
        def = {'',''};
        numeroDec = str2double(inputdlg(mensagem,titulo,numLinhas,def)); %Input para usuário.
        %Fim configuração de tela.
        
        if isnan(numeroDec) %se exxistir algo que não for um numero da string, ao converter pra double temos um NaN
            f = errordlg('Número em formato incorreto','Erro'); %geramos um erro
            return;
        end
        
        inteiro = floor(numeroDec); %Pega apenas a parte inteira do número.
        fracionario = mod(numeroDec,inteiro); %Pega apenas a parte fracionaria do número.
        binarioInt = Decimal_Para_Binario(inteiro); %Converte a parte inteira decimal para binario.
        binarioFracionario = DecimalFrac_Para_BinarioFrac(fracionario); %Converte a parte fracionario para binário.
        resultado = strcat(sprintf('%d',binarioInt),'.',sprintf('%d',binarioFracionario)); % Concatena os resultados acrescentando um . entre o inteiro e fracionario.
        msgbox(['Número binário = ' resultado]); %Exibe em um pop-up a conversão.
    
    case 2
        %Configuração de tela.
        mensagem = {'Digite o binário(inteiro) a ser convertido.'};
        titulo = 'Conversão';
        numLinhas = 1;
        def = {'',''};
        binarioInt = str2double(inputdlg(mensagem,titulo,numLinhas,def));
        %Fim configuração de tela.
        
        try
           val =  bin2dec(num2dec(binarioInt));%usando a função pronta do matlab SOMENTE PARA VERIFICAR SE É UM BINARIO VALIDO
        catch
            f = errordlg('Número em formato incorreto','Erro'); % se n for geramos um erro
            return;
        end
        
        decimalInt = Binario_Para_Decimal(binarioInt); %Converte o binário (inteiro) para decimal inteiro.
        resultado = sprintf('%d',decimalInt); %Converte o resultado (string) para inteiro.
        msgbox(['Número decimal = ' resultado]); %Exibe em um pop-up a conversão.
        
    case 3
        %Configuração de tela.
        mensagem = {'Digite o número binário (fracionário) a ser convertido.'};
        titulo = 'Conversão';
        numLinhas = 1;
        def = {'',''};
        BinarioFrac = str2double(inputdlg(mensagem,titulo,numLinhas,def)); %Input com pop-up.
        %Fim configuração de tela.
        
        tst = strtrim(num2str(BinarioFrac)); %converte em string pra tratamento de erro
        if isempty(find(tst == '.')) %se não acharmos um '.' logo não temos um binario fracionario.
            f = errordlg('Número em formato incorreto','Erro');
            return;
        end
        index = find(tst == '.'); %pegamos o indice de onde temos o '.'
        ints = tst(1:index-1); % tudo antes do ponto é a parte inteira
        floats = tst(index+1:end); % tudo depois é a parte fracionaria
        
        if (str2num(floats)) == 0
            f = errordlg('Número em formato incorreto','Erro');%numero .0 não é realmente fracionario
            return;
        end
        
        try
           val = bin2dec(ints); %usando a função pronta do matlab SOMENTE PARA VERIFICAR SE É UM BINARIO VALIDO
           val = bin2dec(floats); %usando a função pronta do matlab SOMENTE PARA VERIFICAR SE É UM BINARIO VALIDO
        catch
            f = errordlg('Número em formato incorreto','Erro'); %se nao for, geramos um erro
            return;
        end
        
        DecimalFrac = bintofloatdec(BinarioFrac); %Converte binário fracionário para decimal fracionário.
        resultado = sprintf('%d',DecimalFrac); %Converte o resultado (string) para o tipo numero.
        msgbox(['Número decimal fracionário = ' resultado]); %Exibe em um pop-up a conversão.
end

