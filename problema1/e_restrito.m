clear all
close all
clc

%Inicializações
nr_s = 150; %quantidade de soluções
nr_f = 2; %quantidade de funções objetivo
l_max = 2;
k_max = 3;
erro = 0.1;
MAX_ITER = 5;

s = zeros(nr_s, 50);
s_0 = initialize;
%%
% Determina a solução utópica (aproximada) usando Pw
lim=[zeros(nr_f,1) ones(nr_f,1)];%limites para obter valores não normalizados
I=eye(nr_f); %indices para resolver problemas mono-objetivos com a função problemaPw
for j=1:nr_f
    w = I(j,:); %resolve um problema mono-objetivo a cada iteração
    [s(j,:), ~] = VNS( s_0,l_max, k_max, erro, MAX_ITER, @(solution) problemaPw( solution, w, lim ) ); %solução mono-objetivo
    f(j,:) = (fobjMulti(s(j,:), lim))';%linha j: avaliação de Fc(coluna1) e Fq(coluna2) para solução j
    j
end

f_lim = [min(f)' max(f)'];%linha 1: valor mínimo e máximo de Fc
                          %linha 2: valor mínimo e máximo de Fq
%%
%Minimiza o problema multi-objetivo
s_1 = s_0;
for i=1:(nr_s/2)       %usa Fc como objetivo e Fq como restrição
   e = rand;
   
   [s(i,:), ~] = VNS( s_1,l_max, k_max, erro, MAX_ITER, @(solution) problemaPe( solution, e, 1, f_lim ) );
   f(i,:) = (fobjMulti(s(i,:), lim))';
   f_lim = [min(f)' max(f)'];
   s_1 = shake(s_0,1);
   i
end

s_1 = s_0;
for k=(nr_s/2)+1:nr_s   %usa Fq como objetivo e Fc como restrição
   e=rand;
   
   [s(k,:), ~] = VNS( s_1,l_max, k_max, erro, MAX_ITER, @(solution) problemaPe( solution, e, 2, f_lim ) );
   f(k,:) = (fobjMulti(s(k,:), lim))';
   f_lim = [min(f)' max(f)'];
   s_1 = shake(s_0,1);
   k
end

%%
%Avalia dominãncia

[s,f] = nondominatedpoints(s',f');
s = s';
f = f';
%%
%Plota resultados
figure(1)
plot(f(:,1),f(:,2), 'ko','LineWidth',0.05 , 'MarkerFaceColor',[0,0,0])
title('Espaço de objetivos')
xlabel('Fc')
ylabel('Fq')
legend('fronteira pareto ótima')
grid on

solucoes_nao_dominadas = size(s,1)