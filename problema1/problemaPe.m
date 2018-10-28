function [ fitness ] = problemaPe( solution, e, idx_f, f_lim )
%	problemaPe: retorna a avaliação de solution na função de índice "idx_f"
%	restrita pelas demais funções objetivo.

f = feval(@fobjMulti,solution, f_lim);

idx_h = 1:length(f);
idx_h(idx_f) = []; %indice da função que será transformada em restrição

u=1000; %fator de penalidade

fitness = f(idx_f) + u*sum(max(0,f(idx_h)-e).^2);

end

