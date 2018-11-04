
%function main()

%% Initialization
N  = 100; % number of solutions
n  = 6;  % number of decision variables
lb = [0.05 0.05 0.05 0.05 0.05 0.05];  % lower bound
ub = [0.5  0.6  1.0  1.2  1.0  0.6];   % upper bound
nc = 50; %number of cells
nit = 80;
X  = (repmat(lb(:),1,N) + repmat((ub(:)-lb(:)),1,N).*rand(n,N));
%% otimization

cell_x = EvDif(X,lb,ub,nc,nit);
j=[];
f=[];

for g=1:nc
   [fp,jP] = nondominatedpoints(cell_x{g},dea(cell_x{g}));
   j = [j jP];
   f = [f fp];
end
[X,fX] = nondominatedpoints(f,j);


save solutions X fX


%% Plot solutions found
plot(fX(1,:),fX(2,:),'r.')
hold on
fx_goal = fx_estimated();
plot(fx_goal(1,:),fx_goal(2,:),'k.')
legend('soluções não dominadas obtidas','soluções estimadas')
hold off
drawnow

