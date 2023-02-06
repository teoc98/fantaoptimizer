include "globals.mzn";

int: n;
int: max_quote;
int: budget;
int: artists_per_team;

array [1..n] of string: artists;
array [1..n] of string: songs;

array[1..n] of 1..max_quote: quotes;
array[1..n] of float: scores;

% array[1..n] of var bool: chosen;
% constraint (count (i in 1..n) (chosen[i]) == artists_per_team);
% var int: total = sum (i in 1..n where chosen[i]) (quotes[i]);
% constraint (total <= budget);

array[1..artists_per_team] of var 1..n: chosen;
constraint alldifferent(chosen);
constraint increasing(chosen);
var 1..artists_per_team: captain;

var int: total = sum (x in chosen) (quotes[x]);
constraint (total <= budget);

var float: value = sum (x in chosen) (scores[x]) + scores[chosen[captain]];
solve maximize value;

int: b;
array[1..n,1..b] of float: odds; 

array[1..b] of float: sum_odds = [sum (i in 1..n) (1 / odds[i,j]) | j in 1..b];
scores = [(sum (j in 1..b) (1 / sum_odds[j] / odds[i,j]) / b) | i in 1..n];

output [ join("\n", [
  " selected : " ++ join(", ", [ artists[fix(x)] | x in chosen ]) ++ "; captain : \(artists[fix(chosen[captain])])",
  " total = \(total), value = \(value)",
 ])];



