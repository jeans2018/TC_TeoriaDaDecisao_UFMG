function [ best_solution, k ] = neighborhoodChange( solution, new_solution, k , fobj)
%   neighborhoodChange: compara as avalia��es da fun��o objetivo entre
%   "solution" e "new_solution", obtida na vizinhan�a "k". Se houver melhora,
%   a vizinhan�a "k" retorna para o valor inicial, caso contr�rio a pr�xima
%   vizinhan�a � considerada.


if(fobj(new_solution) < fobj(solution))
    best_solution = new_solution;
    k = 1;
else
    best_solution = solution;
    k = k+1;
end

