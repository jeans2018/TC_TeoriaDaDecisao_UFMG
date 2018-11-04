function [ best_solution ] = VND( initial_solution, l_max, fobj )
%	VND: refina "solution" utilizando "l_max" estruturas de vizinhança

k = 1;
solution = initial_solution;

while(k <= l_max)
    new_solution = firstImprovement( solution, k, fobj );
    [ solution, k ] = neighborhoodChange( solution, new_solution, k , fobj);
end

best_solution = solution;
end

