function [ initial_solution ] = randomInitialize( )
%	ramdomInitialize: para cada tarefa, escolhe um agente aleat�riamente
%
%   Uma solu��o � um vetor de tamanho n:
%   s = [ag_1 ag_2 ag_3 ... ag_n]
%   na qual ag_j = [1,m].

load('data_10x50.mat','m')
load('data_10x50.mat','n')
%   m: n�mero de agentes;
%   n: n�mero de tarefas;

initial_solution = zeros(1,n);

for i=1:n
    initial_solution(i)= randi(m);
end
   
end

