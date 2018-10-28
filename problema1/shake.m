function [ new_solution ] = shake( solution, k )
%   shake: Retorna uma solução na k-ésima vizinhança de solution.

new_solution = solution;
load('data_10x50.mat', 'm');
load('data_10x50.mat', 'n');
delta = 0.5; %probabilidade de mutação

if(k == 1) %retira uma tarefa de um agente e atribui à outro
    indice = randi(n);
    new_solution(indice) = randi(m);
elseif(k == 2) %troca as tarefas entre dois agentes
    indice = randi(m, 1, 2);
    %new_solution(indice) = new_solution(flip(indice));
    new_solution([indice(1) indice(2)]) = new_solution([indice(2) indice(1)]);
elseif(k == 3) %para cada agente, troca a tarefa com probabilidade "delta"
    for i=1:size(new_solution,2)
        if(rand() <= delta)
            new_solution(i) = randi(m);
        end
    end
end

end

