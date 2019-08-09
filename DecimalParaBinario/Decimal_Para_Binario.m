function [ numeroBin ] = Decimal_Para_Binario( numeroDec )
    %Decimal_Para_Binario
    % ENTRADAS: Número na base decimal.
    % SAÍDAS: Número na base Binária.
    % DESCRIÇÃO: Converte um número decimal para binário.

    restoDiv = []; %Declaração do vetor de resto das divisões (vazio).
    
    while (1)
        
        restoDiv = [restoDiv,mod(numeroDec,2)]; %Faz o vetor receber ele mesmo + o resto da divisão.
        numeroDec = floor(numeroDec/2); %Divide o numero em decimal por 2 e atribui o resultado arrendondando para baixo.
        
        if (numeroDec == 0) %Se já foram feitas todas as divisões possíveis, então "quebra" o loop.
            break;
        end
        
    end
    
    numeroBin = fliplr(restoDiv); %Inverte o vetor de restos e atribui a numeroBin (resultado final).
    
    %txt = sprintf('%d',nBaseBinaria); %Converte o número em texto para printar na tela.
    
    %disp(txt); %Printa na tela o resultado final.
end


