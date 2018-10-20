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

%-----------avalia as restri��es de desigualdade para a solu��o------------

g = zeros(m,1);

for i=1:m
    tarefa = find(solution == i);
    g(i) = sum(a(i,tarefa)) - b(i);
end

%------------------------acha o valor de penaliza��o-----------------------

u = sum(a,2);   %fator de penalidade

P = sum(u.*max(0,g));   %valor de penaliza��o

%-----------------------acha o valor da fun��o custo-----------------------

fc = 0; %custo

for i=1:m
    tarefa = find(solution == i);
    fc = fc + sum(c(i,tarefa));
end

%------------------------retorna o valor de avalia��o----------------------

f = fc + P;

end

