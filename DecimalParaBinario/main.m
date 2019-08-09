clc
clear
escolha = menu('Escolha uma das op��es abaixo:','Decimal -> Bin�rio (Inteiro/Fracion�rio)','Inteiro Bin�rio  -> Inteiro Decimal ', 'Fracion�rio Bin�rio  -> Fracion�rio Decimal' );

switch(escolha)
    case 1
        %Configura��o de tela.
        mensagem = {'Digite o n�mero decimal a ser convertido.'};
        titulo = 'Convers�o';
        numLinhas = 1;
        def = {'',''};
        numeroDec = str2double(inputdlg(mensagem,titulo,numLinhas,def)); %Input para usu�rio.
        %Fim configura��o de tela.
        
        if isnan(numeroDec) %se exxistir algo que n�o for um numero da string, ao converter pra double temos um NaN
            f = errordlg('N�mero em formato incorreto','Erro'); %geramos um erro
            return;
        end
        
        inteiro = floor(numeroDec); %Pega apenas a parte inteira do n�mero.
        fracionario = mod(numeroDec,inteiro); %Pega apenas a parte fracionaria do n�mero.
        binarioInt = Decimal_Para_Binario(inteiro); %Converte a parte inteira decimal para binario.
        binarioFracionario = DecimalFrac_Para_BinarioFrac(fracionario); %Converte a parte fracionario para bin�rio.
        resultado = strcat(sprintf('%d',binarioInt),'.',sprintf('%d',binarioFracionario)); % Concatena os resultados acrescentando um . entre o inteiro e fracionario.
        msgbox(['N�mero bin�rio = ' resultado]); %Exibe em um pop-up a convers�o.
    
    case 2
        %Configura��o de tela.
        mensagem = {'Digite o bin�rio(inteiro) a ser convertido.'};
        titulo = 'Convers�o';
        numLinhas = 1;
        def = {'',''};
        binarioInt = str2double(inputdlg(mensagem,titulo,numLinhas,def));
        %Fim configura��o de tela.
        
        try
           val =  bin2dec(num2dec(binarioInt));%usando a fun��o pronta do matlab SOMENTE PARA VERIFICAR SE � UM BINARIO VALIDO
        catch
            f = errordlg('N�mero em formato incorreto','Erro'); % se n for geramos um erro
            return;
        end
        
        decimalInt = Binario_Para_Decimal(binarioInt); %Converte o bin�rio (inteiro) para decimal inteiro.
        resultado = sprintf('%d',decimalInt); %Converte o resultado (string) para inteiro.
        msgbox(['N�mero decimal = ' resultado]); %Exibe em um pop-up a convers�o.
        
    case 3
        %Configura��o de tela.
        mensagem = {'Digite o n�mero bin�rio (fracion�rio) a ser convertido.'};
        titulo = 'Convers�o';
        numLinhas = 1;
        def = {'',''};
        BinarioFrac = str2double(inputdlg(mensagem,titulo,numLinhas,def)); %Input com pop-up.
        %Fim configura��o de tela.
        
        tst = strtrim(num2str(BinarioFrac)); %converte em string pra tratamento de erro
        if isempty(find(tst == '.')) %se n�o acharmos um '.' logo n�o temos um binario fracionario.
            f = errordlg('N�mero em formato incorreto','Erro');
            return;
        end
        index = find(tst == '.'); %pegamos o indice de onde temos o '.'
        ints = tst(1:index-1); % tudo antes do ponto � a parte inteira
        floats = tst(index+1:end); % tudo depois � a parte fracionaria
        
        if (str2num(floats)) == 0
            f = errordlg('N�mero em formato incorreto','Erro');%numero .0 n�o � realmente fracionario
            return;
        end
        
        try
           val = bin2dec(ints); %usando a fun��o pronta do matlab SOMENTE PARA VERIFICAR SE � UM BINARIO VALIDO
           val = bin2dec(floats); %usando a fun��o pronta do matlab SOMENTE PARA VERIFICAR SE � UM BINARIO VALIDO
        catch
            f = errordlg('N�mero em formato incorreto','Erro'); %se nao for, geramos um erro
            return;
        end
        
        DecimalFrac = bintofloatdec(BinarioFrac); %Converte bin�rio fracion�rio para decimal fracion�rio.
        resultado = sprintf('%d',DecimalFrac); %Converte o resultado (string) para o tipo numero.
        msgbox(['N�mero decimal fracion�rio = ' resultado]); %Exibe em um pop-up a convers�o.
end

