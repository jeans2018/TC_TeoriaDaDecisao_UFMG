nr_s = 50; %quantidade de soluções
nr_f = 2; %quantidade de funções objetivo
load('data_10x50.mat','n');

s_0 = initialize;
s = zeros(nr_s,n);
f=zeros(nr_s,nr_f);

for i=1:nr_s
    w = rand(1,nr_f);
    w = w/sum(w);
    
    [s(i,:), ~] = VNS( s_0, 3, 0.1, 5, @(solution) problemaPw( solution, w ) );
    f(i,:) = (fobjMulti(s(i,:)))';% avalia a solução i para Fc e Fq
    s_0 =  s(i,:);
end

plot(f(:,1),f(:,2), 'ro')
xlabel('Fc')
ylabel('Fq')