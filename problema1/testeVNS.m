initial_solution = initialize();
%initial_solution = randomInitialize();
k_max = 3;
erro = 0.1;
MAX_ITER = 10;
%fobj = @fobjFC;
fobj = @fobjFQ;

qtd_testes = 5;

load('data_10x50.mat', 'n');
best_solutions = zeros(qtd_testes,n);
min_f = zeros(1,qtd_testes);

for i=1:qtd_testes
    [ best_solutions(i,:), f ] = VNS( initial_solution, k_max, erro, MAX_ITER, fobj );
    min_f(i) = f(end);
    
    figure(i)    
    plot(f, '--.', 'LineWidth',2)
    xlim([1 length(f)])
    title('Evolução da Função objetivo');
    xlabel('iterações')
    ylabel('fobj')
    drawnow
end

min(min_f)