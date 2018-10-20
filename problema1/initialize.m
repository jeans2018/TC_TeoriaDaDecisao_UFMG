function [ initial_solution ] = initialize( )
%	initialize: para cada tarefa, escolhe o agente que necessita de menos
%	recursos.
%   Uma solu��o � um vetor de tamanho n:
%   s = [ag_1 ag_2 ag_3 ... ag_n]
%   na qual ag_j = [1,m].

load('data_10x50.mat')
%   m: n�mero de agentes;
%   n: n�mero de tarefas;
%   a: matriz onde a posi��o a(i, j) cont�m a quantidade de recursos 
%necess�rios ao agente i para processar a tarefa j;
%   c: matriz onde a posi��o c(i, j) cont�m o custo de atribui��o da tarefa
%j ao agente i;
%   b: vetor onde a posi��o b(i) cont�m a capacidade total do agente i.

initial_solution = zeros(1,n);

for i=1:n
    [~, initial_solution(i)]= min(a(:,i));
end
   

end

