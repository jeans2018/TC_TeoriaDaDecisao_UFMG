function [ best_solution ] = VND( initial_solution, k_max, fobj )
%	VND: refina "solution" utilizando "k_max" estruturas de vizinhança

k = 1;
solution = initial_solution;

while(k <= k_max)
    %new_solution = randomDescent( solution, k, fobj );
    new_solution = firstImprovement( solution, k, fobj );
    [ solution, k ] = neighborhoodChange( solution, new_solution, k , fobj);
end

best_solution = solution;
end

