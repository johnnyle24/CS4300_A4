function result = CS4300_Tell(KB, percept_sentence)
% CS4300_Tell - Adds percept sentence to knowledge base
% On input:
%     sentences (CNF data structure): array of conjuctive clauses
%       (i).clauses
%           each clause is a list of integers (- for negated literal)
%     percept_sentence: 1 disjunctive clause to be added
% On output:
%       returns the update KB
% Call:
%     CS4300_tell(kb, [-1,2]);
% Author:
%     Trung Le and Johnny Le
%     UU
%     Fall 2016
%

num_clauses = length(KB);
num_clauses = num_clauses + 1;
result = KB;
for i = 1:length(percept_sentence)
    result(num_clauses).clauses = percept_sentence(i).clauses;
    num_clauses = num_clauses + 1;
end



%TODO: Check for duplicates


end

