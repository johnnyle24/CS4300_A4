function action = CS4300_Hybrid_Wumpus_Agent(percept)
import java.util.Queue;
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

t = 0;

% plan = java.util.PriorityQueue;
% 
% plan.add({1, 0});
% 
% plan = (100, 1);

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
    
    persistent visited;
    visited(1).square = [1,1];
    
    persistent fringe_squares;
    fringe_squares(1).square = [1,2];
    fringe_squares(2).square = [2,1];
    
    persistent fringe_squares_index;
    fringe_squares_index = 1;
        
    persistent plan;
    plan = Queue();
    
    persistent succeed;
    succeed = 0;
    
    persistent time;
    time = 0;
end


    CS4300_Tell(KB, CS4300_Make_Percept_Sentence(percept, t));
    
    % must define G for gold
    
    if (CS4300_Ask(KB, G)
       % grab and use A*star_man to escape 
    end
    if(isEmpty(plan))
        % possible wumpus or pit
    end
    if(isEmpty(plan) && CS4300_Ask(KB, query) %wumpus number of current location, make a map
        
    end
    
    if(isEmpty(plan)
       %check for a safest and then choose one 
    end
    
    if(isEmpty(plan))
       plan = CS4300_A_star_man(current, destination); 
    end
    
    action = pop(plan);
    
    CS4300_Tell(KB, CS4300_make_action_sentence(action, I);
    
    t = t + 1;


end

