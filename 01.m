# Initiation
clear

# General function
function next_state = general_markov (current_state, transition, n)
	if (nargin != 3)
		usage ("general_markov (current_state, transition, n)");
	endif
	next_state = current_state * transition ^ n;
endfunction

function next_day = forecast (n, today)
	next_day = general_markov (today, [.4 .4 .2; .3 .3 .4; .1 .6 .3], n);
endfunction

# Part A
display ("Part A, Forecasting tomorrow (n = 1):");
n = 1;
today = [0 1 0];
tomorrow = forecast (n, today);
display (tomorrow);

# Part B
display ("Part B, Forecasting future (n = 1372):");
n = 1372;
today = [0 1 0];
future = forecast (n, today);
display (future);

# Part C
display ("Part C, General markov model under test !");
n = 1;
current_state = [1, 2];
transition = [1, 2; 1, 2];
display (general_markov (current_state, transition, n));
