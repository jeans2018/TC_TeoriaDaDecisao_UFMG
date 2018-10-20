function [ initial_solution ] = initialize( )
%	initialize: para cada tarefa, escolhe o agente que necessita de menos
%	recursos.
%   Uma solução é um vetor de tamanho n:
%   s = [ag_1 ag_2 ag_3 ... ag_n]
%   na qual ag_j = [1,m].

load('data_10x50.mat')
%   m: número de agentes;
%   n: número de tarefas;
%   a: matriz onde a posição a(i, j) contém a quantidade de recursos 
%necessários ao agente i para processar a tarefa j;
%   c: matriz onde a posição c(i, j) contém o custo de atribuição da tarefa
%j ao agente i;
%   b: vetor onde a posição b(i) contém a capacidade total do agente i.

initial_solution = zeros(1,n);

for i=1:n
    [~, initial_solution(i)]= min(a(:,i));
end
   

end

