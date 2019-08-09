function [ numeroDec ] = Binario_Para_Decimal( numeroBin )
    %Binario_Para_Decimal
    % ENTRADA(S): Número na base binária.
    % SAÍDA(S): Número na base Decimal.
    % DESCRIÇÃO: Converte um número binário para um decimal.

    i = 0; %Expoente do bit atual.
    restoDiv = 0;  
    numeroDec = 0;
    
    while (1)
        restoDiv = mod(numeroBin,10); %Pega o bit binário na posição i.
        numeroBin = floor(numeroBin/10); %Salva o próximo número a ser dividido.
        numeroDec = numeroDec + (restoDiv * 2.^i); 
        i = i + 1 ; %Incrementa o expoente do bit atual.
        
        if( numeroBin == 0) %Quando não der mais para dividir o número por 10.
            break;
        end       
    end