function [ f ] = fobjFC( solution )
%fobj_fc: Retorna o custo total de realiza��o de todas as tarefas

load('data_10x50.mat')
%   m: n�mero de agentes;
%   n: n�mero de tarefas;
%   a: matriz onde a posi��o a(i, j) cont�m a quantidade de recursos 
%necess�rios ao agente i para processar a tarefa j;
%   c: matriz onde a posi��o c(i, j) cont�m o custo de atribui��o da tarefa
%j ao agente i;
%   b: vetor onde a posi��o b(i) cont�m a capacidade total do agente i.

g = zeros(m,1);%restri��o de desigualdade
fc = 0; %custo

for i=1:m
    tarefa = find(solution == i); %acha as tarefas realizadas pelo agente i
    g(i) = sum(a(i,tarefa)) - b(i); %calcula a restri��o de capacidade para o agente i
    fc = fc + sum(c(i,tarefa)); %soma os custos das tarefas realizadas pelo agente i
end

u = 1000;   %fator de penalidade
P = u*sum(max(0,g).^2);   %valor de penaliza��o

f = fc + P; %fun��o objetivo + restri��es penalizadas

end

