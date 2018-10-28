function [ initial_solution ] = randomInitialize( )
%	ramdomInitialize: para cada tarefa, escolhe um agente aleatóriamente
%
%   Uma solução é um vetor de tamanho n:
%   s = [ag_1 ag_2 ag_3 ... ag_n]
%   na qual ag_j = [1,m].

load('data_10x50.mat','m')
load('data_10x50.mat','n')
%   m: número de agentes;
%   n: número de tarefas;

initial_solution = zeros(1,n);

for i=1:n
    initial_solution(i)= randi(m);
end
   
end

