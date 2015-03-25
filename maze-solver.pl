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
% consult('maze.pl').
% CALL ?- solve(From, To, Path). 
% use semicolon ; to see the path
u(m,1).
mazeSize(2, 2).
barrier(2, 2).

%% We start by defining the database of facts which describe the paths between points
path([1,1],[2,1]).
path([2,1],[2,2]).
route(X,X).
route(X,Y) :- path(X,Z), route(Z,Y).

%% solve(From, To, Path).
d([2,1], [2,2]).
d([2,2], [1,2]).
d([2,2], [2,3]).

go(From, To, Path) :-
go(From, To, [], Path).

go(P, P, T, T).
go(P1, P2, T, NT) :-
    (d(P1, P3) ; d(P3, P2)),
    \+ member(P3, T),
    go(P3, P2, [P3|T], NT).
