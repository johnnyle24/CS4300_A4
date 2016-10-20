function action = CS4300_Hybrid_Wumpus_Agent(percept)
import java.util.Queue;
% CS4300_Hybrid_Wumpus_Agent - KB logic agent 
%    
% On input:
%     percept (1x5 Boolean vector): percept values
%      (1): Stench
%      (2): Breeze
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
%4 Gold

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
    
    global local_x;
    local_x = 1;
    
    global local_y;
    local_y = 1;
    
    global local_dir;
    local_dir = 0;
    
    persistent visited;
    %0  not visited
    %1  visited
    %initially (1,1) visited
    visited = [0,0,0,0;0,0,0,0;0,0,0,0;1,0,0,0];
    
    persistent board;
    %-1 dont know
    %0  safe/no pit or wumpus
    %1  not safe
    board = [-1,-1,-1,-1;-1,-1,-1,-1;-1,-1,-1,-1; 0,-1,-1,-1];
    
    persistent frontier;
    %frontier:  neighbors of whats been visited
    %0  not on frontier
    %1  on frontier
    frontier = [0,0,0,0;0,0,0,0;1,0,0,0;0,1,0,0];
    
    persistent plan;
    plan = Queue();
    
    persistent succeed;
    succeed = 0;
    
    persistent haveArrow;
    haveArrow = 1;
    
end

KB = CS4300_Tell(KB, CS4300_Make_Percept_Sentence(percept,local_x,local_y));

visited(local_y, local_x) = 1;
frontier(local_y,local_x) = 0;

frontier = CS4300_frontier(x,y,visited,frontier);

board = CS4300_safe(local_x,local_y,KB,board);

%On glitter
if(CS4300_Ask(KB,CS4300_Get_Index(local_x,local_y,1,4)))
   plan.add(GRAB);
   temp_plan = CS4300_Plan_Route([local_x, local_y, local_dir], [tempx,tempy,0], board);
   for temp_index = 1:length(temp_plan)
      plan.add(temp_plan(temp_index).p); 
   end
   plan.add(CLIMB);
end

found = 0;

%Go to safe square
if(isempty(plan)) % check to see if it is safe and if it is, navigates to it
    for i = 1:length(safeBoard)
        if(found == 1)
            break;
        end
        for j = 1:length(safeBoard)
            if(safeBoard(i, j) == 0)
                if(visited(i, j) == 0)
                    tempx = i;
                    tempy = j;
                    found = 1;
                    break;
                end
            end
        end
    end
   
   if(found == 1)
       temp_plan = CS4300_Plan_Route([local_x, local_y, local_dir], [tempx,tempy,0], board);
       for temp_index = 1:length(temp_plan)
          plan.add(temp_plan(temp_index).p); 
       end
   end
   
end

%Make a safe square by shooting
if(isempty(plan) && haveArrow == 1)
    for i = 1:length(frontier)
        for j = 1:length(frontier)
            if(frontier(i, j) == 1)
                if(~CS4300_Ask(KB, CS4300_Get_Index(i, j, -1, 3)))
                    tempx = i;
                    tempy = j;
                end
            end
        end
    end
    
    temp_plan = CS4300_Plan_Shot([local_x, local_y, local_dir], [tempx,tempy,0], board);
    
    for temp_index = 1:length(temp_plan)
       plan.add(temp_plan(temp_index).p); 
    end
end

found = 0;

%Go to possibly safe square
if(isempty(plan))
    for i = 1:length(frontier)
        if(found == 1)
            break;
        end
        for j = 1:length(frontier)
            if(frontier(i, j) == 1)
                pit = CS4300_Get_Index(i,j,1,0);
                stench = CS4300_Get_Index(i,j,1,2);
                sentence(1).clauses = pit;
                sentence(2).clauses = stench;
                
                if(~CS4300_Ask(KB,sentence))
                    tempx = i;
                    tempy = j;
                    found = 1;
                    break;
                end
            end
        end
    end
   
   if(found == 1)
       temp_plan = CS4300_Plan_Route([local_x, local_y, local_dir], [tempx,tempy,0], board);
       for temp_index = 1:length(temp_plan)
          plan.add(temp_plan(temp_index).p); 
       end
   end
   
end

random_index = 1;
%go to random neigboring square
if(isempty(plan))
   for i = 1:length(frontier)
        for j = 1:length(frontier)
            if(frontier(i, j) == 1 && visited(i,j) == 0)
                random(random_index).square = [i,j];
                random_index = random_index + 1;
            end
        end
   end
    
   p = randi([1, random_index]);
   
   tempx = random(p).square(1);
   tempy = random(p).square(2);

   if(found == 1)
       temp_plan = CS4300_Plan_Route([local_x, local_y, local_dir], [tempx,tempy,0], board);
       for temp_index = 1:length(temp_plan)
          plan.add(temp_plan(temp_index).p); 
       end
   end
   
end

action = plan.poll();




