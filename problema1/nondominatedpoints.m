
function [P,norm_jP,jP] = nondominatedpoints(P,norm_jP,jP)
% Eliminate the Pareto dominated points

% P : candidate solutions (varDim x N)
% jP: objective values (objDim x N)
% norm_jP: normalized objective values (objDim x N)

[objDim, N] = size(norm_jP);
I = repmat(norm_jP(:),1,N) <= repmat(norm_jP,N,1);
I = reshape(I',N,objDim,N);
I = prod(double(I),2);
I = sum(I(:,:),2) > 1;

% Eliminate dominated subproblems
P(:,I)  = [];
norm_jP(:,I) = [];
jP(:,I) = [];

