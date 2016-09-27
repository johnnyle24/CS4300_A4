function resolvents = CS4300_resolve(C1,C2)
% CS4300_RTP - resolution theorem prover
% On input:
%     C1: First input clause
%     C2: Second input clause
% On output:
%     resolvents (CNF data structure): all possible clauses as a result of
%     resolving the two inputs
% Call:  (example from Russell & Norvig, p. 252)
%     DP(1).clauses = [-1,2,3,4];
%     DP(2).clauses = [-2];
%     DP(3).clauses = [-3];
%     DP(4).clauses = [1];
%     thm = [4];
%     vars = [1,2,3,4];
%     Sr = CS4300_resolve(DP,thm);
% Author:
%     Johnny Le and Trung Le
%     UU
%     Fall 2016
%



%%%%%%%%%
%
% Do fancy things with C1 and C2. See pg. 216, fig. 7.12
%
%%%%%%%%%

resolvents = C1 + C2;



