%Inicializações
nr_s = 50; %quantidade de soluções
nr_f = 2; %quantidade de funções objetivo

s = zeros(nr_s, 50);
s_0 = initialize;
%%
% Determina a solução utópica (aproximada) usando Pw
eps=[zeros(nr_f,1) ones(nr_f,1)];%limites para obter valores não normalizados
I=eye(nr_f); %indices para resolver problemas mono-objetivos com a função problemaPw
for j=1:nr_f
    w = I(j,:); %resolve um problema mono-objetivo a cada iteração
    [s(j,:), ~] = VNS( s_0, 2, 0.1, 5, @(solution) problemaPw( solution, w, eps ) ); %solução mono-objetivo
    f(j,:) = (fobjMulti(s(j,:), eps))';%linha j: avaliação de Fc(coluna1) e Fq(coluna2) para solução j
    j
end

f_lim = [min(f)' max(f)'];%linha 1: valor mínimo e máximo de Fc
                          %linha 2: valor mínimo e máximo de Fq
%%
%Minimiza o problema multi-objetivo
for i=1:(nr_s/2)       %usa Fc como objetivo e Fq como restrição
   e = rand;
   
   [s(i,:), ~] = VNS( s_0, 2, 0.1, 5, @(solution) problemaPe( solution, e, 1, f_lim ) );
   f(i,:) = (fobjMulti(s(i,:), eps))';
   f_lim = [min(f)' max(f)'];
   i
end

for k=(nr_s/2)+1:nr_s   %usa Fq como objetivo e Fc como restrição
   e=rand;
   
   [s(k,:), ~] = VNS( s_0, 2, 0.1, 5, @(solution) problemaPe( solution, e, 2, f_lim ) );
   f(k,:) = (fobjMulti(s(k,:), eps))';
   f_lim = [min(f)' max(f)'];
   k
end
%%
%Normaliza soluções e avalia dominãncia
f_norm = zeros(size(f));
for t=1:nr_f
    f_norm(:,t)=(f(:,t) - f_lim(t,1))/(f_lim(t,2) - f_lim(t,1));
    t
end

[s,f_norm,f] = nondominatedpoints(s',f_norm',f');
s = s';
f_norm = f_norm';
f = f';
%%
%Plota resultados
figure(1)
plot(f(:,1),f(:,2), 'b*')
title('Fronteira Pareto Ótima')
xlabel('Fc')
ylabel('Fq')

%{
figure(2)
plot(f_norm(:,1),f_norm(:,2), 'ro')
xlabel('Fc')
ylabel('Fq')
%}

solucoes_nao_dominadas = size(s,1)