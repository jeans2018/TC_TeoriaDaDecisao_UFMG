function [ fitness ] = problemaPe( solution, e, idx_f )
%	problemaPe: retorna a avalia��o de solution na fun��o de �ndice "idx_f"
%	restrita pelas demais fun��es objetivo.

f = feval(@fobjMulti,solution);

idx_h = 1:length(f);
idx_h(idx_f) = []; %indice da fun��o que ser� transformada em restri��o

u=1000; %fator de penalidade

fitness = f(idx_f) + u*sum(max(0,f(idx_h)-e(idx_h)).^2);

end

