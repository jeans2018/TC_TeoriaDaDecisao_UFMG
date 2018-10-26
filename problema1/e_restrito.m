nr_s = 50; %quantidade de soluções
nr_f = 2; %quantidade de funções objetivo

s_0 = initialize;

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
                          
e = linspace(0,1,25);
for i=1:(nr_s/2)       %usa Fc como objetivo e Fq como restrição
   %e = ((f_lim(:,2)-f_lim(:,1)).*rand(nr_f,1) + f_lim(:,1))';
   %e = rand;
   
   [s(i,:), ~] = VNS( s_0, 2, 0.1, 5, @(solution) problemaPe( solution, e(i), 1, f_lim ) );
   f(i,:) = (fobjMulti(s(i,:), eps))';
   f_lim = [min(f)' max(f)'];
   
   %s_0 = s(i,:);
   i
end

%s_0 = initialize;

for k=(nr_s/2)+1:nr_s   %usa Fq como objetivo e Fc como restrição
   %e = ((f_lim(:,2)-f_lim(:,1)).*rand(nr_f,1) + f_lim(:,1))';
   %e=rand;
   
   [s(k,:), ~] = VNS( s_0, 2, 0.1, 5, @(solution) problemaPe( solution, e(k-(nr_s/2)), 2, f_lim ) );
   f(k,:) = (fobjMulti(s(k,:), eps))';
   f_lim = [min(f)' max(f)'];
   
   %s_0 = s(i,:);
   k
end

f_norm = zeros(size(f));
for t=1:nr_f
    f_norm(:,t)=(f(:,t) - f_lim(t,1))/(f_lim(t,2) - f_lim(t,1));
    t
end

plot(f_norm(:,1),f_norm(:,2), 'ro')
xlabel('Fc')
ylabel('Fq')