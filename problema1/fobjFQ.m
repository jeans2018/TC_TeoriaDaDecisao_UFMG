function [ f ] = fobjFQ( solution )
%fobj_fq: retorna a quantidade de recursos relacionada ao agente mais
%ocupado

load('data_10x50.mat')
%   m: n�mero de agentes;
%   n: n�mero de tarefas;
%   a: matriz onde a posi��o a(i, j) cont�m a quantidade de recursos 
%necess�rios ao agente i para processar a tarefa j;
%   c: matriz onde a posi��o c(i, j) cont�m o custo de atribui��o da tarefa
%j ao agente i;
%   b: vetor onde a posi��o b(i) cont�m a capacidade total do agente i.

g = zeros(m,1); %restri��o de desigualdade
recursos_por_agente = zeros(m,1);

for i=1:m
    tarefa = find(solution == i); %acha as tarefas realizadas pelo agente i
    g(i) = sum(a(i,tarefa)) - b(i); %calcula a restri��o de capacidade para o agente i
    recursos_por_agente(i) = sum(a(i,tarefa)); %total de recursos consumidos pelo agente i
end
fq = max(recursos_por_agente); %total de recursos consumidos pelo agente que consome mais recursos

u = 1000;   %fator de penalidade
P = u*sum(max(0,g).^2);   %valor de penaliza��o

f = fq + P; %fun��o objetivo + restri��es penalizadas

end

