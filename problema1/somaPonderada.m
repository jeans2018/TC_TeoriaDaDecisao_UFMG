clear all
close all
clc

%Inicializa��es
nr_s = 150; %quantidade de solu��es
nr_f = 2; %quantidade de fun��es objetivo
l_max = 2;
k_max = 3;
erro = 0.1;
MAX_ITER = 5;

s = zeros(nr_s, 50);
s_0 = initialize;
%%
% Determina a solu��o ut�pica (aproximada) usando Pw
eps=[zeros(nr_f,1) ones(nr_f,1)];%limites para obter valores n�o normalizados
I=eye(nr_f);%indices para resolver problemas mono-objetivos com a fun��o problemaPw
for j=1:nr_f
    w = I(j,:); %resolve um problema mono-objetivo a cada itera��o
    [s(j,:), ~] = VNS( s_0,l_max, k_max, erro, MAX_ITER, @(solution) problemaPw( solution, w, eps ) ); %solu��o mono-objetivo
    f(j,:) = (fobjMulti(s(j,:), eps))';%linha j: avalia��o de Fc(coluna1) e Fq(coluna2) para solu��o j
    j
end

f_lim = [min(f)' max(f)'];%linha 1: valor m�nimo e m�ximo de Fc
                          %linha 2: valor m�nimo e m�ximo de Fq
%%
%Minimiza o problema multi-objetivo
s_1 = s_0;
for i=1:nr_s
    %usar para gerar pesos aleat�rios
    w = rand(1,nr_f);
    w = w/sum(w);
    
    [s(i,:), ~] = VNS( s_1,l_max, k_max, erro, MAX_ITER, @(solution) problemaPw( solution, w, f_lim ) );
    f(i,:) = (fobjMulti(s(i,:), eps))';% avalia a solu��o i para Fc e Fq(valores n�o normalizados)
    f_lim = [min(f)' max(f)']; %atualiza m�ximos e m�nimos
    s_1 = shake(s_0,1);
    i
end
%%
%Avalia domin�ncia

[s,f] = nondominatedpoints(s',f');
s = s';
f = f';
%%
%Plota resultados
figure(1)
plot(f(:,1),f(:,2), 'ko','LineWidth',0.05 , 'MarkerFaceColor',[0,0,0])
title('Espa�o de objetivos')
xlabel('Fc')
ylabel('Fq')
legend('fronteira pareto �tima')
grid on

solucoes_nao_dominadas = size(s,1)