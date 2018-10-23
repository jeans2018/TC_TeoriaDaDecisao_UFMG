function [ fitness ] = problemaPw( solution, w )
%	problemaPw: retorna a avaliação de solution no problema multiobjetivo
%	ponderado por w.

f = feval(@fobjMulti,solution);
fitness = w*f;

end

