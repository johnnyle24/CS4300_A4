function plan = CS4300_Plan_Route(current,target,safe)
%Given x, y return the stench index
%Pits [1,16]
%Breeze [17,32]
%Stench [33,48]
%Wumpus [49,65]
%Gold [66, 81]

%Type
%0 Pits
%1 Breeze
%2 Stench
%3 Wumpus
%4 Gold

initial_state = zeros(1,3);
initial_state(1) = current(1);
initial_state(2) = current(2);
initial_state(3) = 0;

goal_state = zeros(1,3);
goal_state(1) = target(1);
goal_state(2) = target(2);
goal_state(3) = 0;

[sol,nod] = CS4300_Wumpus_A_star_safe(actual_board,initial_state,goal_state,'CS4300_A_star_Man',safe);

for i = 1:length(sol)
   plan(i) = sol(i,4); 
end


end