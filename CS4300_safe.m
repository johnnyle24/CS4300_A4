function new_board = CS4300_safe(x, y, kb, board) 

%0 Pits
%1 Breeze
%2 Stench
%3 Wumpus

%Pits [1,16]
%Breeze [17,32]
%Stench [33,48]
%Wumpus [49,65]

%0 means safe; -1 means dont know; 1 means not safe

new_board = board;

    %check is right safe
    if(y+1 <= 4)
        above_wumpus = CS4300_Get_Index(x,y+1,-1,3);
        above_pit = CS4300_Get_Index(x,y+1,-1,0);
        sentence(1).clauses = above_wumpus;
        sentence(2).clauses = above_pit;
        above_safe = CS4300_Ask(kb, sentence);
        
        above_y = CS4300_conversion(y+1);
        if(above_safe)
            new_board(above_y,x) = 0;
        else
            %new_board(above_y,x) = -1;
        end
       
    end
    if(y-1 > 0)
        below_wumpus = CS4300_Get_Index(x,y-1,-1,3);
        below_pit = CS4300_Get_Index(x,y-1,-1,0);
        sentence(1).clauses = [below_wumpus];
        sentence(2).clauses = [below_pit];
        below_safe = CS4300_Ask(kb, sentence);
        
        below_y = CS4300_conversion(y-1);
        if(below_safe)
            new_board(below_y,x) = 0;
        else
            %new_board(above_y,x) = -1;
        end
    end
    if(x+1 <= 4)
        right_wumpus = CS4300_Get_Index(x+1,y,-1,3);
        right_pit = CS4300_Get_Index(x+1,y,-1,0);
        sentence(1).clauses = [right_wumpus];
        sentence(2).clauses = [right_pit];
        right_safe = CS4300_Ask(kb, sentence);
        
        right_y = CS4300_conversion(y);
        if(right_safe)
            new_board(right_y,x+1) = 0;
        else
            %new_board(above_y,x) = -1;
        end
    end
    if(x-1 > 0)
        left_wumpus = CS4300_Get_Index(x-1,y,-1,3);
        left_pit = CS4300_Get_Index(x-1,y,-1,0);
        sentence(1).clauses = [left_wumpus];
        sentence(2).clauses = [left_pit];
        left_safe = CS4300_Ask(kb, sentence);
        
        left_y = CS4300_conversion(y);
        if(left_safe)
            new_board(left_y,x-1) = 0;
        else
            %new_board(above_y,x) = -1;
        end
    end
end
