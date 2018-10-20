function [ f ] = fobjFC( solution )
%fobj_fc: Retorna o custo total de realização de todas as tarefas

load('data_10x50.mat')
%   m: número de agentes;
%   n: número de tarefas;
%   a: matriz onde a posição a(i, j) contém a quantidade de recursos 
%necessários ao agente i para processar a tarefa j;
%   c: matriz onde a posição c(i, j) contém o custo de atribuição da tarefa
%j ao agente i;
%   b: vetor onde a posição b(i) contém a capacidade total do agente i.

%-----------avalia as restrições de desigualdade para a solução------------

g = zeros(m,1);

for i=1:m
    tarefa = find(solution == i);
    g(i) = sum(a(i,tarefa)) - b(i);
end

%------------------------acha o valor de penalização-----------------------

u = sum(a,2);   %fator de penalidade

P = sum(u.*max(0,g));   %valor de penalização

%-----------------------acha o valor da função custo-----------------------

fc = 0; %custo

for i=1:m
    tarefa = find(solution == i);
    fc = fc + sum(c(i,tarefa));
end

%------------------------retorna o valor de avaliação----------------------

f = fc + P;

end

