function combinedClauses = CS4300_combineClauses(clauses, new)
% CS4300_RTP - resolution theorem prover
% On input:
%     new: the list of clauses that were just resolved
%     clauses: the current list of clauses
% On output:
%     combinedClauses: result of checking if every clause in new is in
%     clauses and adding the new ones
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