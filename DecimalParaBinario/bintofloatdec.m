function result = bintofloatdec(floatbin)
% Converte um numero binario fracionario para decimal fracionario
% input floatbin(numero binario fracionario)
% output result(numero decimal fracionario)

    floatbin = strtrim(num2str(floatbin)); %transforma em string
    index =find(floatbin=='.'); %acha o ponto para separar as partes
    int = floatbin(1:index-1); %separa a parte inteira
    float = floatbin(index+1:end); %separa a parte fracionaria
    % Acha os 1 e eleva pra converter em decimal 
    % ex: find('0010') => 3, logo 0.5^0.125, como é o somatorio
    % recebemos esta mesma formula para todos os 1 da nossa parte
    % fracionaria
    decfloat = sum(0.5.^find(float =='1'));
    result = Binario_Para_Decimal(str2num(int))+decfloat; %somar parte inteira e fracionaria
end