function [ best_solution ] = firstImprovement( initial_solution, k, fobj )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

ITER_MAX = 10;
iter = 1;
new_solution = initial_solution;

while((fobj(new_solution) >= fobj(initial_solution))&&(iter < ITER_MAX))
    new_solution = shake(initial_solution,k);
    if(fobj(new_solution) < fobj(initial_solution))
        best_solution = new_solution;
        break;
    else
        best_solution = initial_solution;
    end
    iter = iter+1;
end