function [ best_solution ] = firstImprovement( initial_solution, k, fobj )
%	FirstImprovement: retorna a primeira melhor solução encontrada na 
%vizinhança "k" em "MAX_ITER" iterações.

MAX_ITER = 3;
iter = 1;
best_solution = initial_solution;
new_solution = initial_solution;

while((fobj(new_solution) >= fobj(initial_solution))&&(iter < MAX_ITER))
    new_solution = shake(initial_solution,k);
    if(fobj(new_solution) < fobj(initial_solution))
        best_solution = new_solution;
        break;
    end
    iter = iter+1;
end