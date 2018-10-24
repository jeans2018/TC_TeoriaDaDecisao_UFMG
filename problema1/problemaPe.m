function [ fitness ] = problemaPe( solution, e, idx_f )
%	problemaPe: retorna a avaliação de solution na função de índice "idx_f"
%	restrita pelas demais funções objetivo.

f = feval(@fobjMulti,solution);

idx_h = 1:length(f);
idx_h(idx_f) = []; %indice da função que será transformada em restrição

u=1000; %fator de penalidade

fitness = f(idx_f) + u*sum(max(0,f(idx_h)-e(idx_h)).^2);

end

