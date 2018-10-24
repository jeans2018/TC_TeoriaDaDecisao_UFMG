nr_s = 50; %quantidade de soluções
nr_f = 2; %quantidade de funções objetivo
load('data_10x50.mat','n');

s_0 = initialize;

% Determina a solução utópica (aproximada) usando Pw
I=eye(nr_f);
for j=1:nr_f
    w = I(j,:);
    [s(j,:), ~] = VNS( s_0, 3, 0.1, 5, @(solution) problemaPw( solution, w ) );
    f(j,:) = (fobjMulti(s(j,:)))';% avalia a solução j para Fc(linha 1) e Fq(linha 2)
end
eps = [ min(f,[],2) max(f,[],2) ];

for i=1:(nr_s/2)       %usa Fc como objetivo e Fq como restrição
   e = ((eps(:,2)-eps(:,1)).*rand(nr_f,1) + eps(:,1))';
   
   [s(i,:), ~] = VNS( s_0, 3, 0.1, 5, @(solution) problemaPe( solution, e, 1 ) );
   f(i,:) = (fobjMulti(s(i,:)))';
   s_0 = s(i,:);
end

s_0 = initialize;

for k=(nr_s/2)+1:nr_s   %usa Fq como objetivo e Fc como restrição
   e = ((eps(:,2)-eps(:,1)).*rand(nr_f,1) + eps(:,1))';
   
   [s(k,:), ~] = VNS( s_0, 3, 0.1, 5, @(solution) problemaPe( solution, e, 2 ) );
   f(k,:) = (fobjMulti(s(k,:)))';
   s_0 = s(i,:);
end

plot(f(:,1),f(:,2), 'ro')
xlabel('Fc')
ylabel('Fq')