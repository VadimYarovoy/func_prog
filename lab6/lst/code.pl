% Сохраните этот файл с именем, например, `tree.pl`

% Факты и правила
ibt(void, void).
ibt(t(_, L, R), t(_, U, V)) :- ibt(L, U), ibt(R, V).

% Запрос для запуска
run :- ibt(t(a, L, R), T).

debug :- ibt(t(a, L, R), T), write('T = '), write(T), nl, write('a = '), write(a), nl, write('L = '), write(L), nl, write('R = '), write(R), nl, write('============ '), nl.


# query2 :- ibt(t(a, L, R), T), write('T = '), write(T), nl, fail.