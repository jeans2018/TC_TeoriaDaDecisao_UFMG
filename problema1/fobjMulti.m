function [ f ] = fobjMulti( solution )
%	fobjMulti: retorna as avaliações normalizadas de solution em cada função
%do problema multiobjetivo.

f = zeros(2,1);
%avalia a solução
f1 = fobjFC(solution);
f2 = fobjFQ(solution);
%valores estimados para o min e max das funções objetivo
fc_max = 5143.1;
fc_min = 1003.8;
fq_max = 1058;
fq_min = 65;
%atribui à f os valores normalizados
f(1) = (f1 - fc_min)/(fc_max - fc_min);
f(2) = (f2 - fq_min)/(fq_max - fq_min);

end

