clear all
close all
clc

initial_solution = initialize();
l_max = 2;
k_max = 3;
erro = 0.1;
MAX_ITER = 10;
%fobj = @fobjFC;
fobj = @fobjFQ;

qtd_testes = 5;

load('data_10x50.mat', 'n');
best_solutions = zeros(qtd_testes,n);
f = zeros(1,qtd_testes);

for i=1:qtd_testes
    [ best_solutions(i,:), caminho ] = VNS( initial_solution, l_max, k_max, erro, MAX_ITER, fobj );
    f(i) = caminho(end);
    
    figure(i)    
    plot(caminho, '--.', 'LineWidth',2)
    xlim([1 length(caminho)])
    title('Evolu��o da Fun��o objetivo');
    xlabel('itera��es')
    ylabel('fobj')
    drawnow
end

min(f)