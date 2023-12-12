function char_array = double2char(double_array)

% Please write this function based on the following specifications.
%
% This function double2char.m convert a double array to a character array. More specifically,
%
% 1 should be mapped to 'a'
% 2 should be mapped to 'b'
% ...
% 26 should be mapped to 'z'
%
% 27 should be mapped to char(32), which corresponds to white space
%
% Example:
%   char_array = double2char([1 2 3]) gives 'abc'
%   char_array = double2char([1 27 26 1) gives 'a za'
%
% Input:
%	double_array = 1 x N double array
%
% Output:
%   char_array = 1 x N character array

char_array = char(double_array + 64);        % Add 64 because ASCII starts from 65
char_array(double_array == 27) = char(32);   % if array contains 27, map to white space  
char_array = lower(char_array);              % Convert to all uppercase 
