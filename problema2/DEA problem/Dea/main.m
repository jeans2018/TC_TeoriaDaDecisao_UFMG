
function main()

% Initialization
N  = 10; % number of solutions
n  = 6;  % number of decision variables
lb = [0.05 0.05 0.05 0.05 0.05 0.05];  % lower bound
ub = [0.5  0.6  1.0  1.2  1.0  0.6];   % upper bound
X  = (repmat(lb(:),1,N) + repmat((ub(:)-lb(:)),1,N).*rand(n,N));

% Evaluation of the candidate solutions
fX = dea(X);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% optimization algorithm
%
% DEVE SER DESENVOLVIDO PELOS ALUNOS 
% PODE SER BASEADO EM TRAJETÓRIA OU POPULAÇÃO
% NÃO SE ESQUEÇAM DE TRATAR AS RESTRIÇÕES DE CAIXA!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Eliminate Pareto dominated solutions
[X,fX] = nondominatedpoints(X,fX);


save solutions X fX


% Plot solutions found
plot(fX(1,:),fX(2,:),'r.')
hold on
fx_goal = fx_estimated();
plot(fx_goal(1,:),fx_goal(2,:),'k.')
hold off
drawnow

