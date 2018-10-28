function [ best_solution ] = firstImprovement( initial_solution, k, fobj )
%	FirstImprovement: retorna melhor solução na vizinhança "k" em
%	"MAX_ITER" iterações.

ITER_MAX = 5;
iter = 1;
best_solution = initial_solution;
new_solution = initial_solution;

while((fobj(new_solution) >= fobj(initial_solution))&&(iter < ITER_MAX))
    new_solution = shake(initial_solution,k);
    if(fobj(new_solution) < fobj(initial_solution))
        best_solution = new_solution;
        break;
    end
    iter = iter+1;
end