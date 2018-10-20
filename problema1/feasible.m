function [ is_feasible ] = feasible( solution )
%   feasible: retorna 1 se a solução for factível e 0 c.c, para cada
%   agente pertencente à solution.

load('data_10x50.mat')
%   m: número de agentes;
%   n: número de tarefas;
%   a: matriz onde a posição a(i, j) contém a quantidade de recursos 
%necessários ao agente i para processar a tarefa j;
%   c: matriz onde a posição c(i, j) contém o custo de atribuição da tarefa
%j ao agente i;
%   b: vetor onde a posição b(i) contém a capacidade total do agente i.

h = zeros(m,1);
is_feasible = zeros(m,1);

for i=1:m
    tarefa = find(solution == i);
    h(i) = sum(a(i,tarefa));
end

for i=1:m
    if(h(i) <= b(i))
        is_feasible(i) = 1;
    else
        is_feasible(i) = 0;
    end
end

end

