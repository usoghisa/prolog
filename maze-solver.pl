%% To lauch  use consult('maze-solver.pl.').
%% solve(From, To, Path)
%% which, given locations From and To, finds a Path going from From to To.
%% From and To are given as two element lists, and Path should be a list of
%% two-element lists. The first element of Path should be From, and the last
%% element should be To. Moves can be made horizontally or vertically, but
%% not diagonally.
%% For example,
%% solve([3,2], [2,6], [[3,2], [3,3], [2,3], [1,3], [1,4], [1,5], [1,6], [2,6]]).
%% -------------------------------------------------------------
%% Instruction
% consult('maze4.pl').
% CALL ?- solve(0,0,3,4,ResultPath).
% use semicolon ; to see all the path solution

b(1,1). b(1,3).
b(2,1). b(2,2). b(2,3).

p(0,0). p(0,1). p(0,2). p(0,3). p(0,4).
p(1,0). 		p(1,2). 	    p(1,4).
p(2,0). 						p(2,4).
p(3,0). p(3,1). p(3,2). p(3,3). p(3,4).

route(X0,Y0,X,Y) :- next_p(X0,Y0,X,Y), p(X,Y).
next_p(X0,Y0,X0,Y) :- Y is Y0+1.
next_p(X0,Y0,X,Y0) :- X is X0+1.
next_p(X0,Y0,X0,Y) :- Y is Y0-1.
next_p(X0,Y0,X,Y0) :- X is X0-1.

reverseLs([],H,H).
reverseLs([H|T],S,R) :- reverseLs(T,[H|S],R).

go(X,Y,X,Y,Path,Path).
go(X0,Y0,X,Y,SoFar,Path) :-	
    route(X0,Y0,X1,Y1),
	\+ member( br(_,_), SoFar ),
    \+ member( p(X1,Y1), SoFar ),
	go(X1,Y1,X,Y,[p(X1,Y1)|SoFar],Path).

solve(FromX0,FromY0,ToX,ToY,ResultPath):-
		go(FromX0,FromY0,ToX,ToY,[],Path),
		write(' 
ph is path, br is barrier
ph(0,0). ph(0,1). ph(0,2). ph(0,3). ph(0,4).
ph(1,0). br(1,1). ph(1,2). br(1,3). ph(1,4).
ph(2,0). br(2,1). br(2,2). br(2,3). ph(2,4).
ph(3,0). ph(3,1). ph(3,2). ph(3,3). ph(3,4).'),
		reverseLs(Path,[],ResultPath ).

