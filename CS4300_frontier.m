function new_frontier = CS4300_frontier(x, y, visited, frontier)
% CS4300_new_frontier - initalizes KB with initial knowledge
% Call:
%     KB = CS4300_Initialize_KB();
% Author:
%     Trung Le and Johnny Le
%     UU
%     Summer 2015
%
%   Pits [1,16]
%   Breeze [17,32]
%   Stench [33,48]
%   Wumpus [49,65]
%   Gold [66, 81]

%   Type
%   0 Pits
%   1 Breeze
%   2 Stench
%   3 Wumpus
%   4 Gold

new_frontier = frontier;

    %Initialize KB for breezes and pits

    if(y+1 <= 4 && visited(x, y+1) == 0)
        new_frontier(x, y+1) = 1;
    end
    if(y-1 > 0 && visited(x, y-1) == 0)
        new_frontier(x, y-1) = 1;
    end
    if(x+1 <= 4 && visited(x+1, y) == 0)
        new_frontier(x+1, y) = 1;
    end
    if(x-1 > 0 && visited(x-1, y) == 0)
        new_frontier(x-1, y) = 1;
    end


end