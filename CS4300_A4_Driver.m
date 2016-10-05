function results = CS4300_A4_Driver()
% CS4300_4300_A4_Driver : the driver
% On output:
%     empty: result of checking the resolution
% Author:
%     Johnny Le and Trung Le
%     UU
%     Fall 2016
%


     DP(1).clauses = [1,2,3];
     DP(2).clauses = [-2];
     DP(3).clauses = [-3];
     thm(1).clauses = [1];
     vars = [1,2,3];
     resolution = CS4300_resolution(DP, thm, vars);
     disp('Done');
end