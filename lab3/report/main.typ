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
Работа №3 "Простой недетерминированный абстрактный интерпритатор. Модельные списки" \

= Постановка задачи
== Легенда
Для экономии места в таблице определим следующее:
- a --- append
- r --- reverse
== Программа
```
r([],[]).
r([X | Xs], Zs) :- r(Xs, Ys), a(Ys, [X], Zs).
a([H | X], Y, [H | Z]) :- a(X, Y, Z).
a([], Y, Y).
```

= Основная часть
\/\/ рассмотрим следующий запрос
=== ? r([a, b], [b, a]).

#table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  [Резольвента], [Правило], [подстановка], [Комментарий],
  [{r([a, b], [b, a])}],
  [r([X1 | Xs1], Zs1) :- r(Xs1, Ys1), a(Ys1, [X1], Zs1)],
  [X1 = a, Xs1 = [b], Zs1 = [b,a]],
  [Выбрано случайное правило, выбрана случайная подстановка, все подошло, можно продолжать решение. В результате мы получаем новую резольвенту],
  // ==
  [{r([b], Ys1), a(Ys1, [a], [b, a])}],
  [r([],[])],
  [],
  [Рассматриваем новую нить вычисления, недетерминировано выбрана подцель *a* выбрано случайное правило, выбрана случайная подстановка,не подошло, правило отброшено и вычисление остановлено на данном пути, так как резольвента не пустая],
  // ==
  [{r([b], Ys1), a(Ys1, [a], [b, a])}],
  [r([X2 | Xs2], Zs2) :- r(Xs2, Ys2), a(Ys2, [X2], Zs2)],
  [X2 = b, Xs2 = [], Zs2 = Ys1],
  [Рассматриваем новую нить вычисления, недетерминировано выбрана подцель *r* выбрано случайное правило, все подошло. В результате мы получаем новую резольвенту],
  // ==
  [{r([], Ys2), a(Ys2, [b], Ys1), a(Ys1, [a], [b, a])}],
  [r([],[])],
  [Ys2 = []],
  [Рассматриваем новую нить вычисления, недетерминировано выбрана подцель *r* выбрано случайное правило, все подошло. В результате мы получаем новую резольвенту],
  // ==
  [{a([], [b], Ys1), a(Ys1, [a], [b, a])}],
  [a([], Y3, Y3)],
  [Y3 = [b], Ys1 = [b], Y3 = [b]],
  [Рассматриваем новую нить вычисления, недетерминировано выбрана подцель *a([], [b], Ys1)* выбрано случайное правило, все подошло. В результате мы получаем новую резольвенту],
  // ==
  [{a([b], [a], [b, a])}],
  [a([Hx4 | X4], Y4, [Hz4 | Z4]) :- a(X4, Y4, Z4)],
  [Hx4 = b, X4 = [], Y4 = [a] Hz4 = b,  Z4 = [a]],
  [Рассматриваем новую нить вычисления, выбрано случайное правило, выбрана случайная подстановка, все подошло, можно продолжать решение. В результате мы получаем новую резольвенту],
  // ==
  [{a([], [a], [a])}],
  [a([], Y5, Y5)],
  [Y5 = [a]],
  [Рассматриваем новую нить вычисления, выбрано случайное правило, выбрана случайная подстановка, все подошло, можно продолжать решение. В результате мы получаем новую резольвенту],
  // ==
  [{}],
  [],
  [],
  [True, потому что пустая резольвента],
)

Ответ --- выполняется