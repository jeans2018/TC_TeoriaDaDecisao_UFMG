function [ best_solution, f ] = VNS( initial_solution, l_max, k_max, erro, MAX_ITER, fobj )
%	VNS: algoritmo Variable Neighborhood Search
%   Entradas:   .initial_solution: vetor[1, tarefas];
%               .l_max: quantidade m�xima de vizinhan�as para busca local;
%               .k_max: quantidade m�xima de vizinhan�as para busca global;
%               .erro: diferen�a m�nima toler�vel entre duas avalia��es da
%               fun��o objetivo;
%               .MAX_ITER: limite de itera��es sem melhora na fun��o objetivo;
%               fobj: fun��o objetivo.
%   sa�das:     .best_solution: vetor[1, tarefas];
%               .f: vetor com o valor de fobj obtido em cada itera��o.

solution = initial_solution;
new_f = fobj(solution);
f = new_f;

sem_melhora = 0;

while(sem_melhora < MAX_ITER)
   k = 1;
   while(k <= k_max)
       s1 = shake(solution, k);
       s2 = VND(s1, l_max, fobj);
       [ solution, k ] = neighborhoodChange( solution, s2, k , fobj);
   end
   old_f = new_f;
   new_f = fobj(solution);
   if(abs(new_f - old_f) <= erro)
       sem_melhora = sem_melhora + 1;
   else
       sem_melhora = 0;
   end   
   f = [f ; new_f];
end

best_solution = solution;

end

