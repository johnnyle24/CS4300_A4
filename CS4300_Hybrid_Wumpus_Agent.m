function action = CS4300_Hybrid_Wumpus_Agent(percept)
% CS4300_Hybrid_Wumpus_Agent - KB logic agent 
%    
% On input:
%     percept (1x5 Boolean vector): percept values
%      (1): Stench
%      (2): Pit
%      (3): Glitters
%      (4): Bumped
%      (5): Screamed
% On output:
%     action (int): action selected by agent
%       FORWARD = 1;
%       ROTATE_RIGHT = 2;
%       ROTATE_LEFT = 3;
%       GRAB = 4;   
%       SHOOT = 5;  
%       CLIMB = 6;  
% Call:
%     a = CS4300_Example1([0,1,0,0,0]);
% Author:
%     T. Henderson
%     UU
%     Summer 2015
%

%Type
%0 Pits
%1 Breeze
%2 Stench
%3 Wumpus

%Pits [1,16]
%Breeze [17,32]
%Stench [33,48]
%Wumpus [49,65]

FORWARD = 1;
ROTATE_RIGHT = 2;
ROTATE_LEFT = 3;
GRAB = 4;
SHOOT = 5;
CLIMB = 6;

if(~exist(KB))
    global KB;
    %Initially no pit and no wumpus in 1,1
    KB = CS4300_Initialize_KB();
    
    persistent local_x;
    local_x = 1;
    persistent local_y;
    local_y = 1;
    persistent local_orientation;
    local_orientation = 0;
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

%if breeze
if(percept(2))
    CS4300_Tell(KB, CS4300_Get_Index(x,y,1,1));
else
    CS4300_Tell(KB, CS4300_Get_Index(x,y,-1,1));
end

%if glitter
if(percept(3))
   action = GRAB;
   return;
%plan is non empty
%elseif
    %action = plan.pop
%check fringe squares
%elseif
    %check (i,j) if(ask(kb, (-Pij A -Wij)) || !ask(kb, (Pij V Wij))
    %   then plan = A* search from (x,y) to (i,j)
    %   action = action.pop
%else
    %action = random action
end






end

