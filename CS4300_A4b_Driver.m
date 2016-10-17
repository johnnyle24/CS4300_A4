function [score, trace] = CS4300_A4b_Driver(board)
% CS4300_A4b_Driver - given a board, runs the hybrid wumpus agent
% On input:
%     board: nxn int array
% On output:
%     score (int): agent score on game
%     trace (nx3 int array): trace of state
%       (i,1): x location
%       (i,2): y location
%       (i,3): action selected at time i
% Call:
%     [s,t] = CS4300_A4b_Driver(board);
% Author:
%     T. Henderson
%     UU
%     Summer 2015
%
