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
Работа №8 "Язык пролог. Прикладная вычислительная модель. Планирование определений предикатов длины списка" \

= Постановка задачи
== Правила
```
• length1([], 0). // Если список пуст, его длина равна 0.
• length1([_|T], N) :- length1(T, N1), N is N1 + 1. // Если список не пуст, рекурсивно вычислите длину хвоста T и прибавьте к ней 1.

• length2([], 0). // Если список пуст, его длина равна 0.
• length2([_|T], N) :- N > 0, N1 is N - 1, length2(T, N1). // Если длина больше 0, рекурсивно сгенерируйте список с конца длиной N-1.

• length(L, N) :- nonvar(L), length1(L, N). // Если L - связанная (определенная) переменная, вызовите length1(L, N), чтобы вычислить длину L и присвоить результат N.
• length(L, N) :- var(L), integer(N), length2(L, N). // Если L - несвязанная переменная (то есть L не была определена), а N - целое число, вызовите length2(L, N), чтобы сгенерировать список длины N и связать его с L.

```

= Основная часть
\/\/ рассмотрим следующий запрос
== ?- length(L, N).

#table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  [Резольвента], [Правило], [Подстановка], [Комментарий],
  // line
  [{length(L, N)}],
  [length(L, N) :- nonvar(L), length1(L, N)],
  [{L = L, N = N}],
  [Для данной подцели детерменировано выбрано первое правило и выполнена подстановка по правилу унификации],
  // line
  [{nonvar(L), length1(L, N)}],
  [-],
  [-],
  [nonvar(L) - ложь, так как L - переменная. Проверка условий завершилась неудачей -  выполнется откат к предыдущему, через бектрекинг. В итоге до правила lenght2 не дошло],
  // line
  [{length(L, N)}],
  [length(L, N) :- var(L), integer(N), length2(L, N)],
  [{L = L, N = N}],
  [Для данной подцели детерменировано выбрано первое правило и выполнена подстановка по правилу унификации],
  // line
  [{var(L), integer(N), length2(L, N)}],
  [-],
  [-],
  [var(L) - истина, integer(N) - ложь, так как N - переменная. Проверка условий завершилась неудачей -  выполнется откат к предыдущему, через бектрекин. В итоге до правила lenght2 не дошло],
)

Ответ --- No