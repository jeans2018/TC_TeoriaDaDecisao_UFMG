function [ best_solution, k ] = neighborhoodChange( solution, new_solution, k , fobj)
%   neighborhoodChange: compara as avaliações da função objetivo entre
%   "solution" e "new_solution", obtida na vizinhança "k". Se houver melhora,
%   a vizinhança "k" retorna para o valor inicial, caso contrário a próxima
%   vizinhança é considerada.


if(fobj(new_solution) < fobj(solution))
    best_solution = new_solution;
    k = 1;
else
    best_solution = solution;
    k = k+1;
end

