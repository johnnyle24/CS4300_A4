function resolution = CS4300_resolution(KB,a)
% CS4300_resolution - resolution theorem
% On input:
%     KB: knowledge base, a sentence in propositional logic
%     a: query, a sentence in propositional logic
% On output:
%     resolution: results of resolution
%        []: proved sentence |- thm
%        not []: thm does not follow from sentences
% Call:  (example from Russell & Norvig, p. 252)
%     DP(1).clauses = [-1,2,3,4];
%     DP(2).clauses = [-2];
%     DP(3).clauses = [-3];
%     DP(4).clauses = [1];
%     thm = [4];
%     vars = [1,2,3,4];
%     resolution = CS4300_resolve(C1, C2);
% Author:
%     Johnny Le and Trung Le
%     UU
%     Fall 2016
%



%%%%%%%%%%%%
%
%  Do something here with "KB" and "a" to generate clauses
%
%%%%%%%%%%%%

clauses = []; % The set of clauses in the CNF rep of KB ^ ~a

new = [];

resolvents = [100];

while(1)
    
    for i = 1:length(clauses)

        for j = 1:length(clauses)

            resolvents = CS4300_resolve(clauses(i), clauses(j))

            if (CS4300_containsEmpty(resolvents))
                resolution = true;
                break;
            end

            new = CS4300_combineClauses(new, resolvents); % Fix this

        end

    end

    if (CS4300_subset(new, clauses))
        resolution = false;
    end
    clauses = CS4300_combineClauses(clauses, new);
    
end
        
        
        
        
        
        
        

