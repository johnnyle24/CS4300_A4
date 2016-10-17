function CS4300_Tell(KB, percept_sentence)
% CS4300_Tell - Adds percept sentence to knowledge base
% On input:
%     sentences (CNF data structure): array of conjuctive clauses
%       (i).clauses
%           each clause is a list of integers (- for negated literal)
%     percept_sentence: 1 disjunctive clause to be added
% Call:
%     CS4300_tell(kb, [-1,2]);
% Author:
%     Trung Le and Johnny Le
%     UU
%     Fall 2016
%

num_clauses = length(KB);
KB(num_clauses + 1) = percept_sentence;





end

