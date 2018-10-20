function [ is_feasible ] = feasible( solution )
%   feasible: retorna 1 se a solu��o for fact�vel e 0 c.c, para cada
%   agente pertencente � solution.

load('data_10x50.mat')
%   m: n�mero de agentes;
%   n: n�mero de tarefas;
%   a: matriz onde a posi��o a(i, j) cont�m a quantidade de recursos 
%necess�rios ao agente i para processar a tarefa j;
%   c: matriz onde a posi��o c(i, j) cont�m o custo de atribui��o da tarefa
%j ao agente i;
%   b: vetor onde a posi��o b(i) cont�m a capacidade total do agente i.

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

