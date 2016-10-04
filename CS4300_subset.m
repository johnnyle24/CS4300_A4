function subset = CS4300_subset(new, clauses)
% CS4300_RTP - resolution theorem prover
% On input:
%     new: the list of clauses that were just resolved
%     clauses: the current list of clauses
% On output:
%     subset: result of checking if every clause in new is in clauses
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

subset = false;
equal = true;

for i = 1:length(new)
   for j = 1:length(clauses)
       equal = true;
       subset = true;
       for k = 1:length(clauses(j).clauses)
           c1 = new(i).clauses(k);
           c2 = clauses(j).clauses(k);
           if(new(i).clauses(k) ~= clauses(j).clauses(k))
               equal = false;
           end
       end
       if (~equal)
           subset = false;
           return;
       else
           subset = true;
           break;
       end
   end
end


% k > length(new(i).clauses) && k > length(clauses(j).clauses) && 