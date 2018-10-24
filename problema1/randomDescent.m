function [ best_solution ] = randomDescent( initial_solution, k, fobj )
%	randomDescent: Retorna a melhor solução na vizinhança "k" a partir de
%	"initial_solution", depois de "ITER_MAX" iterações sem melhora.

ITER_MAX = 3;

iter = 0;

solution = initial_solution;

while(iter < ITER_MAX)
    new_solution = shake(solution, k);
    if(fobj(new_solution) < fobj(solution))
        solution = new_solution;
        iter = 0;
    else
        iter = iter + 1;        
    end

end

best_solution = solution;

end

