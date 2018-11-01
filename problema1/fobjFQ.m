function [ f ] = fobjFQ( solution )
%fobj_fq: retorna a quantidade de recursos relacionada ao agente mais
%ocupado

load('data_10x50.mat')
%   m: número de agentes;
%   n: número de tarefas;
%   a: matriz onde a posição a(i, j) contém a quantidade de recursos 
%necessários ao agente i para processar a tarefa j;
%   c: matriz onde a posição c(i, j) contém o custo de atribuição da tarefa
%j ao agente i;
%   b: vetor onde a posição b(i) contém a capacidade total do agente i.

g = zeros(m,1); %restrição de desigualdade
recursos_por_agente = zeros(m,1);

for i=1:m
    tarefa = find(solution == i); %acha as tarefas realizadas pelo agente i
    g(i) = sum(a(i,tarefa)) - b(i); %calcula a restrição de capacidade para o agente i
    recursos_por_agente(i) = sum(a(i,tarefa)); %total de recursos consumidos pelo agente i
end
fq = max(recursos_por_agente); %total de recursos consumidos pelo agente que consome mais recursos

u = 1000;   %fator de penalidade
P = u*sum(max(0,g).^2);   %valor de penalização

f = fq + P; %função objetivo + restrições penalizadas

end

