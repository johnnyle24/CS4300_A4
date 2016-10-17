function action = CS4300_Hybrid_Wumpus_Agent(percept)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if(~exist(KB))
    global KB;
    %Initially no pit and no wumpus in 1,1
    KB(1).clauses = [-1]; %no pit
    KB(2).clauses = [-49]; %no wumpus
    global x;
    global y;
    global orientation;
    global visited;
    global action;
    global plan;
end

%update x,y orientation, visited based on action

%if stench
if(percept(1))
    CS4300_Tell(KB, CS4300_Get_Index(x,y,1,2));
else
    CS4300_Tell(KB, CS4300_Get_Index(x,y,-1,2));
end



end

