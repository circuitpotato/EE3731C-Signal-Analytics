function pr_trans = compute_transition_probability(double_input)

% Please write this function based on the following specifications.
%
% compute_transition_probability.m takes an input text and
% computes a matrix of transition probability.
%
% Input:
%	input_txt = 1 x N character array
%
% Output:
%    pr_trans = 27 x 27 matrix, where pr_trans(i, j)  = probability j-th letter in the alphabet occurs immediately after i-th letter in the alphabet
%                               e.g., pr_trans(1, 2)  = probability character b occurring immediately after character a
%                               e.g., pr_trans(1, 27) = probability character ' ' occurring immediately after character a
%
% pr_trans(i, j) is defined to be equal to
% (1 + #times j-th letter of alphabet appears after i-th letter of alphabet in input_txt) divided by
% (27 + #times i-th letter of alphabet appears in the text except at the last position in the text)
%
% For example, if the input_txt is 'aaabababa', then
%	# times 'a' appears not corresponding to last position is 5;
%   # times 'a' appears after 'a' is 2; # times 'b' appears after 'a' is 3.
%
%   Therefore pr_trans(1, 1) = (1 + 2)/(5 + 27) = 0.09375
%			  pr_trans(1, 2) = (1 + 3)/(5 + 27) = 0.125
%			  pr_trans(1, 3) = ... = pr_trans(1, 27) = 1/(5 + 27) = 0.03125...
%
%	Observe that sum(pr_trans(1, :)) is equal to 1

pr_trans = zeros(27); % initialise matrix
cnt = zeros(1,27); 
double_input = char2double(double_input); % convert text to double

for i = 1:length(double_input)-1
    cnt(double_input(i)) = cnt(double_input(i)) + 1; % track cnt
    pr_trans(double_input(i),double_input(i+1)) = pr_trans(double_input(i),double_input(i+1)) + 1;
end


% transition  
for i = 1:27
    for j = 1:27
        pr_trans(i,j) = (1 + pr_trans(i,j)) / (27 + cnt(i)); 
        
    end
end


