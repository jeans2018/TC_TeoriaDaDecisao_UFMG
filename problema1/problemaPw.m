function [ fitness ] = problemaPw( solution, w, f_lim )
%	problemaPw: retorna a avaliação de solution no problema multiobjetivo
%	ponderado por w.

f = feval(@fobjMulti,solution,f_lim);
fitness = w*f;

end

