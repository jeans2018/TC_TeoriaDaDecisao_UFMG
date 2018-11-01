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

g = zeros(m,1);%restrição de desigualdade
fc = 0; %custo

for i=1:m
    tarefa = find(solution == i); %acha as tarefas realizadas pelo agente i
    g(i) = sum(a(i,tarefa)) - b(i); %calcula a restrição de capacidade para o agente i
    fc = fc + sum(c(i,tarefa)); %soma os custos das tarefas realizadas pelo agente i
end

u = 1000;   %fator de penalidade
P = u*sum(max(0,g).^2);   %valor de penalização

f = fc + P; %função objetivo + restrições penalizadas

end

