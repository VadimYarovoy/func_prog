% Факты
member(X, [X | _]).
member(X, [_ | L]) :- member(X, L).

% Запрос для проверки
:- member(X, [1, 2, 3]).
