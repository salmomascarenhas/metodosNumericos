function [ numeroBinFrac ] = DecimalFrac_Para_BinarioFrac( numeroDecFrac )
    % DecimalFrac_Para_BinarioFrac
    % ENTRADA(S): N�mero na base decimal fracionario.
    % SA�DA(S): N�mero na base binaria fracionario.
    % DESCRI��O: Converte um n�mero decimal fracionario para um binario fracionario.
    
    numeroBinFrac = []; %A variavel de retorno se torna um vetor vazio.
    
    while (1)
        numeroBinFrac = [numeroBinFrac,(floor(numeroDecFrac*2))]; %Adiciona ao vetor o numero inteiro da multiplica��o por 2.
        numeroDecFrac = (numeroDecFrac*2); %Pega o novo numero multiplicado por 2.
        numeroDecFrac = mod(numeroDecFrac,floor(numeroDecFrac)); %Pega apenas os numeros apos a virgula e salva.
        if( mod(numeroDecFrac,1) == 0) %Para o loop quando os numeros apos a virgula forem iguais a zero.
            break;
        end
        
    end