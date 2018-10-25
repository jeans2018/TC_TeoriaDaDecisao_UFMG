function [ f ] = fobjMulti( solution, f_lim )
%	fobjMulti: retorna as avalia��es normalizadas de solution em cada fun��o
%do problema multiobjetivo.

f = zeros(2,1);
%avalia a solu��o
f1 = fobjFC(solution);
f2 = fobjFQ(solution);
%valores estimados para o min e max das fun��es objetivo
fc_max = f_lim(1,2);
fc_min = f_lim(1,1);
fq_max = f_lim(2,2);
fq_min = f_lim(2,1);
%atribui � f os valores normalizados
f(1) = (f1 - fc_min)/(fc_max - fc_min);
f(2) = (f2 - fq_min)/(fq_max - fq_min);

end

