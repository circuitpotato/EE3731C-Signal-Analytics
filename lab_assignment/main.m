clc; clear; close all;

%% Load dataset
load('sem1_2023_encrypt.mat');

%% Qn 1(a) 
fprintf('Qn 1(a) Results\n'); 
NumericArray = double('It does not do to dwell on dreams and forget to live');
fprintf('\n>> NumericArray = double(''It does not do to dwell on dreams and forget to live'')\n');
disp(NumericArray); 
CharacterArray = char(NumericArray);
fprintf('\n>> CharacterArray = char(NumericArray) \n');
disp(CharacterArray); 
CharacterArray = char([70 97 109 101 32 105 115 32 97 32 102 105 99 107 108 101 32 102 114 105 101 110 100]);
fprintf('\n>> CharacterArray = char([70 97 109 101 32 105 115 32 97 32 102 105 99 107 108 101 32 102 114 105 101 110 100])\n');
disp(CharacterArray); % print Character array result 

%% Qn 1(b) 
fprintf('\n\nQn 1(b) Results\n\n');
qn1B_ans = char2double('It does not do to dwell on dreams and forget to live');
fprintf('>> char2double(''It does not do to dwell on dreams and forget to live'')\n');
disp(qn1B_ans);

%% Qn 1(c) 
fprintf('\nQn 1(c) Results\n');
qn1C_ans = double2char([6 1 13 5 27 9 19 27 1 27 6 9 3 11 12 5 27 6 18 9 5 14 4]);
fprintf('\n>> double2char([6 1 13 5 27 9 19 27 1 27 6 9 3 11 12 5 27 6 18 9 5 14 4]) \n');
disp(qn1C_ans);

%% Qn 2(a) 
fprintf('\nQn 2(a) Results\n');
frank_original_double = char2double('It does not do to dwell on dreams and forget to live');
fprintf('\n>> frank_original_double = char2double(''It does not do to dwell on dreams and forget to live'')\n');
disp(frank_original_double);
frank_encrypted_double = frank_encrypt_key(frank_original_double);
fprintf('\n>> frank_encrypted_double = frank_encrypt_key(frank_original_double) \n');
disp(frank_encrypted_double);
frank_encrypted_txt = double2char(frank_encrypted_double);
fprintf('\n>> frank_encrypted_txt = double2char(frank_encrypted_double) \n');
disp(frank_encrypted_txt);

%% Qn 2(b)
fprintf('\nQn 2(b) Results\n');
frank_encrypted_double = char2double('ywrntjstwtyjvmentyfjnap');
fprintf('\n>> frank_encrypted_double = char2double(''ywrntjstwtyjvmentyfjnap'')\n');
disp(frank_encrypted_double);
frank_decrypted_double = frank_decrypt_key(frank_encrypted_double);
fprintf('\n>> frank_decrypted_double = frank_decrypt_key(frank_encrypted_double)\n');
disp(frank_decrypted_double);
frank_decrypted_txt = double2char(frank_decrypted_double);
fprintf('\n>> frank_decrypted_txt = double2char(frank_decrypted_double)\n');
disp(frank_decrypted_txt);

%% Qn 3(a) 
fprintf('\nQn (3a) Results\n');
pr_trans = compute_transition_probability(training_txt);
fprintf('\n>> pr_trans(1,1) value\n');
disp(pr_trans(1,1));
fprintf('\n>> pr_trans(2,3) value \n');
disp(pr_trans(2,3));
fprintf('\n>> Max pr_trans value \n');
disp(max(max(pr_trans)));
[i,j]=find(pr_trans==max(max(pr_trans)));
fprintf('\n>> Letter position of [i,j] \n')
disp([i j])
fprintf('\n>> Equivalent to: \n')
disp(double2char([i j]))

%% Qn 3(b) 
load('sem1_2023_encrypt.mat'); %% load file to refresh values
fprintf('\nQn 3(b) Results\n\n');
logn_pr = logn_pr_txt(frank_encrypted_txt, pr_trans);
fprintf('\n>> logn_pr = logn_pr_txt(frank_encrypted_txt, pr_trans) \n');
disp(logn_pr);
logn_pr = logn_pr_txt(frank_original_txt, pr_trans);
fprintf('\n>> logn_pr = logn_pr_txt(frank_original_txt, pr_trans) \n');
disp(logn_pr);

%% Qn 3(c) 
fprintf('\nQn 3(c) Results\n\n');
frank_encrypted_double = char2double(frank_encrypted_txt);
frank_decrypted_double = frank_decrypt_key(frank_encrypted_double);
frank_decrypted_txt = double2char(frank_decrypted_double);
log_pr = logn_pr_txt(frank_decrypted_txt, pr_trans) ;
fprintf('\n>> Natural logarithm of p(frank_encrypted_txt | frank_decrypt_key: \n');
disp(log_pr);
frank_encrypted_double = char2double(frank_encrypted_txt);
frank_decrypted_double = mystery_decrypt_key(frank_encrypted_double);
frank_decrypted_txt = double2char(frank_decrypted_double);
log_pr = logn_pr_txt(frank_decrypted_txt, pr_trans);
fprintf('\n>> Natural logarithm of p(frank_encrypted_txt | mystery_decrypt_key): \n');
disp(log_pr);

%% Qn 4(a)(i)
fprintf('\nQn 4(a)(i) Results\n\n');
[accept_new_key, prob_accept] = metropolis(frank_decrypt_key, mystery_decrypt_key, pr_trans, frank_encrypted_txt);
fprintf('\n>> [accept_new_key, prob_accept]: \n');
disp([accept_new_key  prob_accept]);

%% Qn 4(a)(ii)
fprintf('\nQn 4(a)(ii) Results\n\n');
frank_decrypt_key_new=frank_decrypt_key;
temp=frank_decrypt_key_new (12);
frank_decrypt_key_new (12)=frank_decrypt_key_new (13);
frank_decrypt_key_new (13)=temp; 
fprintf('\n>> Values for frank_decrypt_key swapped:\n');
disp(frank_decrypt_key_new);
[accept_new_key, prob_accept] = metropolis(frank_decrypt_key, frank_decrypt_key_new, pr_trans, frank_encrypted_txt);
fprintf('\n>> accept_new_key:\n');
disp(accept_new_key);
fprintf('\n>> prob_accept:\n');
disp(prob_accept);

%% Qn 4(b)
fprintf('\nQn 4(b) Results\n\n');
[decrypted_txt, decrypt_key] = mcmc_decrypt_text(frank_encrypted_txt, pr_trans);
fprintf('\n>> Comparison between decrypt key and frank decrypt key: \n');
disp(decrypt_key)
disp(frank_decrypt_key)
fprintf('\n>> Comparison between decrypted text and frank original text: \n');
disp(decrypted_txt)
disp(frank_original_txt)

%% Qn 4(c) 
fprintf('\nQn 4(c) Results\n\n');
[mystery_decrypted_txt, decrypt_key] =  mcmc_decrypt_text(mystery_encrypted_txt, pr_trans);
fprintf('\n>> Comparison between mystery decrypt key and decrypt key:\n');
disp(mystery_decrypt_key);
disp(decrypt_key);
disp(mystery_decrypted_txt);

