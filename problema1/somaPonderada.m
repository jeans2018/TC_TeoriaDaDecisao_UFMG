%Inicializa��es
nr_s = 50; %quantidade de solu��es
nr_f = 2; %quantidade de fun��es objetivo

s = zeros(nr_s, 50);
s_0 = initialize;
%%
% Determina a solu��o ut�pica (aproximada) usando Pw
eps=[zeros(nr_f,1) ones(nr_f,1)];%limites para obter valores n�o normalizados
I=eye(nr_f);%indices para resolver problemas mono-objetivos com a fun��o problemaPw
for j=1:nr_f
    w = I(j,:); %resolve um problema mono-objetivo a cada itera��o
    [s(j,:), ~] = VNS( s_0, 2, 0.1, 5, @(solution) problemaPw( solution, w, eps ) ); %solu��o mono-objetivo
    f(j,:) = (fobjMulti(s(j,:), eps))';%linha j: avalia��o de Fc(coluna1) e Fq(coluna2) para solu��o j
    j
end

f_lim = [min(f)' max(f)'];%linha 1: valor m�nimo e m�ximo de Fc
                          %linha 2: valor m�nimo e m�ximo de Fq
%%
%Minimiza o problema multi-objetivo
for i=1:nr_s
    %usar para gerar pesos aleat�rios
    w = rand(1,nr_f);
    w = w/sum(w);
    
    [s(i,:), ~] = VNS( s_0, 2, 0.1, 5, @(solution) problemaPw( solution, w, f_lim ) );
    f(i,:) = (fobjMulti(s(i,:), eps))';% avalia a solu��o i para Fc e Fq(valores n�o normalizados)
    f_lim = [min(f)' max(f)']; %atualiza m�ximos e m�nimos
    i
end
%%
%Normaliza solu��es e avalia domin�ncia
f_norm = zeros(size(f));
for k=1:nr_f
    f_norm(:,k)=(f(:,k) - f_lim(k,1))/(f_lim(k,2) - f_lim(k,1));
    k
end

[s,f_norm,f] = nondominatedpoints(s',f_norm',f');
s = s';
f_norm = f_norm';
f = f';
%%
%Plota resultados
figure(1)
plot(f(:,1),f(:,2), 'b*')
title('Fronteira Pareto �tima')
xlabel('Fc')
ylabel('Fq')

%{
figure(2)
plot(f_norm(:,1),f_norm(:,2), 'ro')
xlabel('Fc')
ylabel('Fq')
%}

solucoes_nao_dominadas = size(s,1)