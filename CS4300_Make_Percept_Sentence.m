function sentence = CS4300_Make_Percept_Sentence(percept, t)
%Tell the knowledge base what the agent perceives
%Simply add percept to knowledge base?
%not used in psuedo code it seems?


% convert percept into a sentence


sentence(1).clauses = percept(1); % need location?
sentence(2).clauses = percept(2); 
sentence(3).clauses = percept(3);
sentence(4).clauses = percept(4);
sentence(5).clauses = percept(5);


end

