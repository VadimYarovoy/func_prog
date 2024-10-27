#set page(
  paper: "a4",
  margin: (x: 2cm, y: 3cm),
)
#set text(
  font: "New Computer Modern",
  size: 10pt
)

ФИО: Яровой Вадим \
ГР: 5140904/40102 \
Работа №4 "Простой недетерминированный абстрактный интерпритатор. Полиномы" \

= Постановка задачи
== Программа
```
poly(X, X).
poly(N, X) :- number(N).
poly(S + T, X) :- poly(S, X), poly(T, X).
poly(S - T, X) :- poly(S, X), poly(T, X).
poly(S * T, X) :- poly(S, X), poly(T, X).
poly(T / N, X) :- poly(T, X), number(N), not N = 0.
poly(T ** N, X) :- poly(T, X), number(N).
```

= Основная часть
\/\/ рассмотрим следующий запрос
== ? poly(1+x + x \*\* 3, x).

#table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  [Резольвента], [Правило], [подстановка], [Комментарий],
  [{poly(1+x + x \*\* 3, x)}], [poly(S1 + T1, X1) :- poly(S1, X1), poly(T1, X1)], [S1 = 1 + x, T1 = x \*\* 3, X1 = x], [Оракул применил случайно выбранное правило и случайную подстановку. В результате мы получаем новую резольвенту],
  [{poly(1 + x, x), poly(x \*\* 3, x)}], [poly(S2 + T2, X2) :- poly(S2, X2), poly(T2, X2)], [S2 = 1, T2 = x, X2 = x], [Оракул применил случайно выбранное правило и случайную подстановку. В результате мы получаем новую резольвенту],
  [{poly(1, x), poly(x,x), poly(x\*\* 3, x)}], [poly(N3, X3) :- number(N3)], [N3 = 1, X3 = x], [Оракул применил случайно выбранное правило и случайную подстановку. В результате мы получаем новую резольвенту],
  [{poly(x, x), poly(x\*\* 3, x)}], [poly(X4, X4)], [X4 = x], [Оракул применил случайно выбранное правило и случайную подстановку. В результате мы получаем новую резольвенту],
  [{poly(x\*\* 3, x)}], [poly(T5 \*\* N5, X5) :- poly(T5, X5), number(N5)], [T5 = x, N5 = 3, X5 = x], [Оракул применил случайно выбранное правило и случайную подстановку. В результате мы получаем новую резольвенту],
  [{poly(x, x)}], [poly(X6, X6)], [X6 = x], [Оракул применил случайно выбранное правило и случайную подстановку. В результате мы получаем пустую резольвенту],
  [{}], [], [], [True, потому что пустая резольвента],
)

Ответ --- выполняется