clear all
close all
clc

%Inicializações
nr_s = 50; %quantidade de soluções
nr_f = 2; %quantidade de funções objetivo
k_max = 2;
erro = 0.1;
MAX_ITER = 5;

s = zeros(nr_s, 50);
s_0 = initialize;
%%
% Determina a solução utópica (aproximada) usando Pw
eps=[zeros(nr_f,1) ones(nr_f,1)];%limites para obter valores não normalizados
I=eye(nr_f);%indices para resolver problemas mono-objetivos com a função problemaPw
for j=1:nr_f
    w = I(j,:); %resolve um problema mono-objetivo a cada iteração
    [s(j,:), ~] = VNS( s_0, k_max, erro, MAX_ITER, @(solution) problemaPw( solution, w, eps ) ); %solução mono-objetivo
    f(j,:) = (fobjMulti(s(j,:), eps))';%linha j: avaliação de Fc(coluna1) e Fq(coluna2) para solução j
    j
end

f_lim = [min(f)' max(f)'];%linha 1: valor mínimo e máximo de Fc
                          %linha 2: valor mínimo e máximo de Fq
%%
%Minimiza o problema multi-objetivo
for i=1:nr_s
    %usar para gerar pesos aleatórios
    w = rand(1,nr_f);
    w = w/sum(w);
    
    [s(i,:), ~] = VNS( s_0, k_max, erro, MAX_ITER, @(solution) problemaPw( solution, w, f_lim ) );
    f(i,:) = (fobjMulti(s(i,:), eps))';% avalia a solução i para Fc e Fq(valores não normalizados)
    f_lim = [min(f)' max(f)']; %atualiza máximos e mínimos
    i
end
%%
%Avalia dominãncia

[s,f] = nondominatedpoints(s',f');
s = s';
f = f';
%%
%Plota resultados
figure(1)
plot(f(:,1),f(:,2), 'b*')
title('Fronteira Pareto Ótima')
xlabel('Fc')
ylabel('Fq')
grid on

solucoes_nao_dominadas = size(s,1)